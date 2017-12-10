@extends('admin.template')

@section('content')
	
         <div class="container text-center">
        <div class="page-header">
            <h1>CONFIGURA TU ESTILO</h1>
        </div>
        <br>

        <div class="row">
            
            <div class="col-md-4">
                <div class="panel">
                <hr>
                	<form action="{{url('admin/config/modificarE')}}" method="post" >
                           {!! csrf_field() !!}
                	<h2>selecciona tu color:</h2>
  				<input type="color" name="encabezado" id="encabezado" value="#ff0000">
  				<input type="submit" value="Guardar cambio">
			</form>
			<hr>
                    <a href="" class="btn btn-warning btn-block btn-home-admin">Encabezado</a>
                </div>
            </div> 
            
            <div class="col-md-4">
                <div class="panel">
                <hr>
                	<form action="{{url('admin/config/modificarF')}}" method="post" >
                            {!! csrf_field() !!}
                	<h2>selecciona tu color:</h2>
  				<input type="color" name="fondo" id="fondo" value="#ff0000">
  				<input type="submit" value="Guardar cambio">
			</form>
			<hr>
                    <a href="" class="btn btn-warning btn-block btn-home-admin">Fondo</a>
                </div>
            </div>
                    
            <div class="col-md-4">
                <div class="panel">
                    <hr>
                	<form action="{{url('admin/config/modificarP')}}" method="post" >
                            {!! csrf_field() !!}
                    <h2>selecciona tu color:</h2>
                      <input type="color" name="pie" id="pie" value="#ff0000">
                      <input type="submit" value="Guardar cambio">
                    </form>
			<hr>
                    <a href="" class="btn btn-warning btn-block btn-home-admin">Pie de pagina</a>
                </div>
            </div>
        </div>
    </div>
    <br><br><br><br><br><br><br>
    @stop