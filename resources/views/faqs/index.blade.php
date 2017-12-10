@extends('store.template')

@section('content')

@include('store.partials.slider')

	<div class="container-fluid">
		
		<div class="page-header">
		
			<h1>
				<i class="fa fa-shopping-cart"></i>
				FAQS <a href="#" class="btn btn-warning"><i class="fa fa-plus-circle"></i>FAQS</a>
			</h1>
		
		</div>
		
		<div class="page">
			<div class="table-responsive">
			
				<table class="table table-stripped table-bordered table-hover">
				
					<thead>
					
						<tr>						
							<th>Categoria</th>
							<th>Pregunta</th>
							<th>Respuesta</th>							
						
						</tr>
					
					</thead>
					
					<tbody>
					
						@foreach($faq as $faq)
							
							<tr>							
								<td>{{ $faq->categoria }}</td>
								<td>{{ $faq->pregunta }}</td>
								<td>{{ $faq->respuesta }}</td>																
							
							</tr>
																		
						@endforeach
					
					</tbody>
				
				</table>
				
			</div>
		</div>
	
	</div>

@stop
