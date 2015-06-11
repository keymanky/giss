//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('incisos_middle',[])
	.controller('incisos', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		$scope.json = {};	
		$scope.id_seccion = localStorage.getItem("id_seccion");
		$scope.nombre_pregunta = localStorage.getItem("nombre_pregunta");
		$scope.incisos = JSON.parse(localStorage.getItem("incisos"));				
		$scope.inciso_a_modificar = localStorage.getItem("inciso_a_modificar");
		$scope.cuestionario_nombre = "Cuestionario sobre salud sexual para jóvenes con discapacidad auditiva";		

		$scope.ir_a_preguntas = function (id){
			window.location="http://localhost/giss/public/pages/administrativo/#/pregunta";
		}		

		giss_servicios.consultar_id_seccion($scope.id_seccion).success( function(data){
			$scope.seccion = data;
			console.log($scope.seccion)
		});

		$scope.guardar_inciso = function(id,nombre, ruta_imagen, codificacion, salta_a_la_seccion_id){
			//alert(id + nombre + ruta_imagen + codificacion + salta_a_la_seccion_id)
			$scope.json.nombre = nombre;
			$scope.json.ruta_imagen = ruta_imagen;
			$scope.json.codificacion = codificacion;
			$scope.json.salta_a_la_seccion_id = salta_a_la_seccion_id;
			//console.log($scope.json);
			giss_servicios.actualizar_inciso(id,$scope.json).success( function(data){
				alert(data[0].mensaje);
				window.location="http://localhost/giss/public/pages/administrativo/#/pregunta";
			});
		}
	}])