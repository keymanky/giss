//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('pantallas_middle',[])
	.controller('pantallas', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		$scope.json = {};	
		$scope.id_seccion = localStorage.getItem("id_seccion");
		$scope.id_pantalla_a_modificar = localStorage.getItem("pantalla_a_modificar");	
		$scope.cuestionario_nombre = "Cuestionario sobre salud sexual para jóvenes con discapacidad auditiva";			

		giss_servicios.consultar_pantallas($scope.id_seccion).success( function(data){
			$scope.pantallas = data;
			//console.log($scope.pantallas)
		});

		giss_servicios.consultar_id_seccion($scope.id_seccion).success( function(data){
			$scope.seccion = data;
			//console.log($scope.seccion)
		});

		$scope.regresar_a_seccion = function (id){
			window.location="http://localhost/giss/public/pages/administrativo/#/seccion";
		}	


		$scope.guardar_pantalla = function(id,nombre, ruta_imagen, ruta_video, descripcion){
			//alert(id + nombre + ruta_imagen + ruta_video + descripcion)
			$scope.json.nombre = nombre;
			$scope.json.ruta_imagen = ruta_imagen;
			$scope.json.ruta_video = ruta_video;			
			$scope.json.descripcion = descripcion;
			//console.log($scope.json);
			giss_servicios.actualizar_pantalla(id,$scope.json).success( function(data){
				alert(data[0].mensaje);
				window.location="http://localhost/giss/public/pages/administrativo/#/seccion";
			});
		}		

	}])