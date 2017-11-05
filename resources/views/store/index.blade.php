@extends('store.template')

@section('content')

@include('store.partials.slider')
<!--@include('store.partials.menuslide')-->
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand main-title" href="{{ route('home') }}"><font size=6>Categorias</font></a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <p class="navbar-text"></p>
      <ul class="nav navbar-nav navbar-center">
        </font><li><a href="{{ route('ropa-deportiva') }}"><font size=5><h3>| Ropa deportiva |</h3></font></a></li>
        <li><a href="{{ route('ropa-de-gala') }}"><font size=5><h3>| Ropa de Gala |</h3></font></a></li>
        <li><a href="{{ route('ropa-casual') }}"><font size=5><h3>| Ropa Casual |</h3></font></a></li>
        <li><a href="{{ route('ropa-de-playa') }}"><font size=5><h3>| Ropa de Playa |</h3></font></a></li>
        <li><a href="{{ route('ropa-de-invierno') }}"><font size=5><h3>| Ropa de Invierno |</h3></font></a></li>
        

        
      </ul>
    </div>
  </div>
</nav>
<br>
<div class="container text-center">
	<div id="products">
		@foreach($products as $product)
			<div class="product white-panel">
				<h6>{{ $product->name }}</h6><hr>
				<img src="{{ $product->image }}" width="200">
				<div class="product-info panel">
					<p>{{ $product->extract }}</p>
					<h3><span class="label label-success">Precio:. Bs.{{ number_format($product->price,2) }}</span></h3>
					<p>
						<a class="btn btn-warning" href="{{ route('cart-add', $product->slug) }}">
							<i class="fa fa-cart-plus"></i> La quiero
						</a>
						<a class="btn btn-primary" href="{{ route('product-detail', $product->slug) }}"><i class="fa fa-chevron-circle-right"></i> Leer mas</a>
					</p>
				</div>
			</div>
		@endforeach
	</div>
</div>
</div>
@stop