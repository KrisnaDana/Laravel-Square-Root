<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Log;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class SquareRootController extends Controller
{
    public function post(Request $request): JsonResponse {
        $request->validate(['input' => 'required|numeric|gte:0']);

        $input = $request->input;
        $hasil = $input/2;
        $tebak = 0;
        $toleransi = 0.00001;

        $mulai = hrtime(true);
        while(abs($hasil - $tebak) > $toleransi){
            $tebak = $hasil;
            $hasil = 0.5 * ($hasil + ($input / $hasil));
        }
        $akhir = hrtime(true);
        $waktu = ($akhir - $mulai) / 1e9;
        $waktu = number_format($waktu, 9, '.', '');

        $log = array(
            'input' => $input,
            'hasil' => $hasil,
            'waktu' => $waktu,
            'jenis' => 'API'
        );
        Log::create($log);

        return response()->json([
            'status' => 'success',
            'message' => 'Berhasil mendapatkan hasil akar kuadrat',
            'data' => [
                'hasil' => $hasil,
                'waktu' => $waktu . " detik"
            ],
        ], Response::HTTP_OK);
    }
}
