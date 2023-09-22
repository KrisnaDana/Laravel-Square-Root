<?php

namespace App\Http\Controllers;

use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use App\Models\Log;
use Exception;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\DB;

class SquareRootController extends Controller
{
    public function index(): View {
        $logs = Log::orderBy('id', 'DESC')->limit(10)->get();
        $log_count = Log::count();
        foreach($logs as $log) {
            $log->waktu = number_format($log->waktu, 9, '.', '');
        }
        return view('index', compact('logs', 'log_count'));
    }

    public function hitung(Request $request): RedirectResponse {
        $validated = $request->validate([
            'input' => 'required|numeric|gte:0|lte:9999999999|decimal:0,9',
            'jenis' => 'required|in:API,PL-SQL'
        ]);
        if($validated['jenis'] == 'API'){
            try{
                $mulai = hrtime(true);
                $client = new Client();
                $response = $client->post('http://localhost:8080/square-root', [
                    'form_params' => [
                        'input' => $validated['input']
                    ],
                ]);
                $body = $response->getBody()->getContents();
                $data = json_decode($body, true);
                $hasil = $data['hasil'];
                $akhir = hrtime(true);
                $waktu = ($akhir - $mulai) / 1e9;
                $waktu = number_format($waktu, 9, '.', '');
            }catch(Exception $e){
                return redirect()->route('index')->with([
                    'input' => $validated['input'],
                    'jenis' => $validated['jenis'],
                    'toast' => [
                        'type' => 'error',
                        'message' => 'Internal server error.'
                        ]
                ]);
            }
        }else{
            try{
                $mulai = hrtime(true);
                $data = DB::select('CALL square_root(?,@hasil)', [$validated['input']]);
                $hasil = DB::select('SELECT @hasil as hasil')[0]->hasil;
                $akhir = hrtime(true);
                $waktu = ($akhir - $mulai) / 1e9;
                $waktu = number_format($waktu, 9, '.', '');
            }catch(Exception $e){
                return redirect()->route('index')->with([
                    'input' => $validated['input'],
                    'jenis' => $validated['jenis'],
                    'toast' => [
                        'type' => 'error',
                        'message' => 'Internal server error.'
                        ]
                ]);
            }
        }
        $log = array(
            'input' => $validated['input'],
            'hasil' => $hasil,
            'waktu' => $waktu,
            'jenis' => $validated['jenis']
        );
        Log::create($log);
        return redirect()->route('index')->with([
            'hasil' => $hasil,
            'input' => $validated['input'],
            'jenis' => $validated['jenis'],
            'toast' => [
                'type' => 'success',
                'message' => 'Berhasil menghitung akar kuadrat.'
                ]
        ]);
    }
}
