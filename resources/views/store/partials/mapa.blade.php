<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Geolocalizacion</title>
	<style>
		#map{
			margin: 20px;
			width: 300px;
			height: 250px;
		}
	</style>
</head>
<body>
	<button onclick="findMe()">Enviar ubicación</button>
	<div id="map"></div>
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCEtBg-9fWZ2UoGOD2eamrwqltIqVi9Vec"></script>
	<script>
		function findMe(){
			var output = document.getElementById('map');

			// Verificar si soporta geolocalizacion
			if (navigator.geolocation) {
				output.innerHTML = "<p>Tu navegador soporta Geolocalizacion</p>";
			}else{
				output.innerHTML = "<p>Tu navegador no soporta Geolocalizacion</p>";
			}

			//Obtenemos latitud y longitud
			function localizacion(posicion){

				var latitude = posicion.coords.latitude;
				var longitude = posicion.coords.longitude;

				

				var imgURL = "https://maps.googleapis.com/maps/api/staticmap?center="
				+latitude+","+longitude+"&size=1000x500&markers=color:red%7C"
				+latitude+","+longitude+"&key=AIzaSyCEtBg-9fWZ2UoGOD2eamrwqltIqVi9Vec";

				output.innerHTML ="<img src='"+imgURL+"'>";

				
				//output.innerHTML ="<p> Latitud: "+latitude+"<br> Longitud: "+longitude+"</p>";
			}

			function error(){
				output.innerHTML = "<p>No se pudo obtener tu ubicación</p>";

			}

			navigator.geolocation.getCurrentPosition(localizacion,error);

		}


	</script>
</body>
</html>