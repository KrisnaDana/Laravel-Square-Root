<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Square Root</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <style>
            .form-control, .form-select, .btn-primary {
                border-radius: 0px;
            }
        </style>
    </head>
    <body>
        @if($toast = Session::get('toast'))
            @php
                toast($toast['message'], $toast['type']);
            @endphp
        @endif
        @include('sweetalert::alert')
        <nav class="navbar navbar-expand-lg" style="background-color:#2C3345">
            <div class="container-fluid">
                <a class="navbar-brand text-white" href="{{route('index')}}">Akar Kuadrat</a>
            </div>
        </nav>
        <div class="container">
            <div class="row mt-4">
                <div class="col-4 me-5" style="width:500px">
                    <h2>Hitung Akar Kuadrat</h2>
                    <form method="POST" action="{{route('hitung')}}">
                        @csrf
                        <div class="mt-3">
                            <label class="form-label">Input</span></label>
                            <input class="form-control @error('input') is-invalid @enderror" type="text" name="input" value="{{Session::get('input')}}">
                            @error('input')
                                <div class="invalid-feedback">{{$message}}</div>
                            @enderror
                        </div>
                        <div class="mt-3">
                            <label class="form-label">Jenis</span></label>
                            <select class="form-select" name="jenis">
                                @if(Session::get('jenis') == "PL-SQL")
                                <option selected value="PL-SQL">PL-SQL</option>
                                <option value="API">API</option>
                                @else
                                <option selected value="API">API</option>
                                <option value="PL-SQL">PL-SQL</option>
                                @endif
                            </select>
                        </div>
                        <div class="mt-3">
                            <label class="form-label">Hasil</span></label>
                            <input class="form-control" type="text" readonly disabled value="{{Session::get('hasil')}}">
                        </div>
                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary btn-lg" style="width:100%">Hitung</button>
                        </div>
                    </form>
                </div>
                <div class="col ms-5">
                    <h2>Log</h2>
                    <table class="table mt-3">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Input</th>
                                <th scope="col">Hasil</th>
                                <th scope="col">Waktu (s)</th>
                                <th scope="col">Jenis</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($logs as $log)
                            <tr>
                                <th scope="row">{{$loop->iteration}}</th>
                                <td>{{$log->input}}</td>
                                <td>{{$log->hasil}}</td>
                                <td>{{$log->waktu}}</td>
                                <td>{{$log->jenis}}</td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    <div>
                        <p><strong>Total Data :</strong> {{$log_count}}</p>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>