@extends('store.template')

@section('content')
	
	<div class="container text-center">
		<div class="page-header">
			<h1><i class="fa fa-shopping-cart"></i> Detalle del pedido</h1>
		</div>

		<div class="page">
			<div class="table-responsive">
				<h3>Datos del usuario</h3>
				<table class="table table-striped table-hover table-bordered">
					<tr><td>Nombre:</td><td>{{ Auth::user()->name . " " . Auth::user()->last_name }}</td></tr>
					<tr><td>Usuario:</td><td>{{ Auth::user()->user }}</td></tr>
					<tr><td>Correo:</td><td>{{ Auth::user()->email }}</td></tr>
					<tr><td>Dirección:</td><td>{{ Auth::user()->address }}</td></tr>
				</table>
			</div>
			<div id="table-responsive">
				@include('store.partials.mapa')
			</div>
			<div class="table-responsive">
				<h3>Datos del pedido</h3>
				<table class="table table-striped table-hover table-bordered">
					<tr>
						<th>Producto</th>
						<th>Precio</th>
						<th>Cantidad</th>
						<th>Subtotal</th>
					</tr>
					@foreach($cart as $item)
						<tr>
							<td>{{ $item->name }}</td>
							<td>Bs.{{ number_format($item->price,2) }}</td>
							<td>{{ $item->quantity }}</td>
							<td>Bs.{{ number_format($item->price * $item->quantity,2) }}</td>
						</tr>
					@endforeach
				</table><hr>
				<h3>
					<span class="label label-success">
						Total: Bs.{{ number_format($total, 2) }}
					</span>
				</h3>
				<br>
				<br>
				<hr>
				<p>
					<a href="{{ route('cart-show') }}" class="btn btn-primary" style="font-weight: bold;font-size: x-small;">
						<i class="fa fa-chevron-circle-left"></i> Regresar
					</a>

					<a href="{{ route('payment') }}" class="btn btn-warning" style="font-weight: bold;font-size: x-small;">
						Pagar con <i class="fa fa-cc-paypal fa-2x"></i>
					</a>

					<a href="" class="btn btn-warning" style="font-weight: bold;font-size: x-small;">
						Pagar con targeta</i>
					</a>
					<a href="" class="btn btn-danger" style="font-weight: bold;font-size: x-small;">
						simular pago</i>
					</a>
				</p>
			</div>
		</div>
	</div>

@stop