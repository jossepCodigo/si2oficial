@extends('admin.template')

@section('content')
	
         <div class="container text-center">
        <div class="page-header">
            <h1>
                <i class="fa fa-shopping-cart"></i> ENVIOS
            </h1>
        </div>
        
        <div class="page">
            <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Ver Detalle</th>
                            <th>Administrar</th>
                            <th>FechaEnvio</th>
                            <th>estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($envios as $envio)
                            <tr>
                                <td>
                                            <!--  -->
                                          <a href="{{ url('/envio/view/'.$envio->idVenta) }}" class="btn btn-primary">
                                          <i class="fa fa-pencil-square"></i>
                                          </a>
                                </td>
                                
                                <td>
                                    <form action="{{url('admin/envio/modificarE')}}" method="post" >
                                      {!! csrf_field() !!}
                                       <select name="est" id="est">
                                          <option value="por enviar">por enviar</option>
                                          <option value="envio">enviado</option>
                                          <option value="reclamo">reclamo</option>
                                          <option value="devuelto">devuelto</option>
                                       </select>
                                       
                                       <input name="ide" id="ide" type="text" placeholder="Company" value="{{ $envio->id }}" style="visibility:hidden">
                                       <input type="submit" value="Guardar">
                                    </form>
                                </td>

                                <td>{{ $envio->fechaEnvio }}</td>

                                <td>{{ $envio->estado }}</td>
                               
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            <hr>
            
            <?php echo $envios->render(); ?>
            
        </div>
    </div>
    @stop