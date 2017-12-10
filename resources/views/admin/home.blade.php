@extends('admin.template')

@section('content')

    <div class="container text-center">
        <div class="page-header">
            <h1><i class="fa fa-rocket"></i> PANEL DE ADMINISTRADOR</h1>
        </div>
        
        <h2>Bienvenido(a) {{ Auth::user()->user }} al Panel de administración de tu tienda en línea.</h2><hr>
        
        <div class="row">
            
            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-list-alt icon-home"></i>
                    <a href="{{ route('admin.category.index') }}" class="btn btn-warning btn-block btn-home-admin">CATEGORÍAS</a>
                </div>
            </div>
            
            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-shopping-cart  icon-home"></i>
                    <a href="{{ route('admin.product.index') }}" class="btn btn-warning btn-block btn-home-admin">PRODUCTOS</a>
                </div>
            </div>
                     
        </div>
        
        <div class="row">
            
            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-cc-paypal  icon-home"></i>
                    <a href="{{ route('admin.order.index') }}" class="btn btn-warning btn-block btn-home-admin">VENTAS</a>
                </div>
            </div> 
            
            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-users  icon-home"></i>
                    <a href="{{ route('admin.user.index') }}" class="btn btn-warning btn-block btn-home-admin">USUARIOS</a>
                </div>
            </div>
                    
            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-th" aria-hidden="true" style="font-size:400%"></i>
                    <a href="{{ route('admin.config.index') }}" class="btn btn-warning btn-block btn-home-admin">CONFIGURACION DE FUENTE</a>
                </div>
            </div>                

            <div class="col-md-6">
                <div class="panel">
                    <i class="fa fa-paper-plane" aria-hidden="true" style="font-size:400%"></i>
                    <a href="{{ route('admin.envio.index') }}" class="btn btn-warning btn-block btn-home-admin">ENVIO</a>
                </div>
            </div>
            
        </div>
    </div>
    <hr>

@stop