//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('administrativo_middle',['youtube-embed'])
	.controller('administrativo_page', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		$scope.json = {};
		$scope.idseccionseleccionada = "";
		$scope.idseccionseleccionada_estatus = "";

		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
		});
		giss_servicios.consultar_todas_secciones().success( function(data){
			$scope.secciones = data;
		});
		//Eventos al controlar con el click de ng
		$scope.editarCuestionario = function (e, id){
			var element = document.querySelector(".normal-"+ e);
			var element2 = document.querySelector(".success");
			
			if(element2)
				element2.classList.remove("success");
			element.classList.toggle("success");

			giss_servicios.consultar_id_cuestionario(id).success( function(data){
				$scope.cuestionarioseleccionado = data;
			});
		}

		$scope.guardar_cuestionario = function (e, id) {
			alert("No puede puede moficar el cuestionario")
		}

		$scope.limpiar_cuestionario = function (){
			location.reload(true);	
		}

		$scope.editarSeccion = function (e, id){
			var element = document.querySelector(".normal-"+ e);
			var element2 = document.querySelector(".success");
			
			if(element2)
				element2.classList.remove("success");
			element.classList.toggle("success");

			giss_servicios.consultar_id_seccion(id).success( function(data){
				$scope.seccionseleccionada = data;
				$scope.idseccionseleccionada = data.id;

				if($scope.seccionseleccionada.ruta_video == " " )
					$scope.seccionseleccionada.ruta_video = undefined;
				if($scope.seccionseleccionada.ruta_imagen == " " )
					$scope.seccionseleccionada.ruta_imagen = undefined;				
			});
		}		

		$scope.limpiar_seccion = function (){
			location.reload(true);	
		}

		$scope.cambiar_estatus = function (e){
			$idseccionseleccionada_estatus = e;
		}

		$scope.guardar_seccion = function (nombre, ruta_imagen, ruta_video, descripcion) {
			$scope.json = {};			
			if($scope.idseccionseleccionada){
				$scope.json.id = $scope.idseccionseleccionada
			}

			$scope.json.nombre = nombre;
			ruta_imagen===undefined ? $scope.json.ruta_imagen = " " : $scope.json.ruta_imagen = ruta_imagen;			
			ruta_video===undefined ? $scope.json.ruta_video = " " : $scope.json.ruta_video = ruta_video;

			$scope.json.descripcion = descripcion;
					
			console.log($scope.json);

			giss_servicios.agregar_seccion($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});		
		}

		$scope.reordenarSeccionMas = function (id, sec){
			// alert("id: " + id + "secuencia: " + sec);
			$scope.json = {}
			$scope.json.id = id;
			$scope.json.secuencia = sec;
			$scope.json.accion = "mas"
			console.log($scope.json);
			giss_servicios.reordenar_seccion($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});				
		}

		$scope.reordenarSeccionMenos = function (id, sec){
			// alert("id: " + id + "secuencia: " + sec);
			$scope.json.id = id;
			$scope.json.secuencia = sec;
			$scope.json.accion = "menos"
			console.log($scope.json);			
			giss_servicios.reordenar_seccion($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});			
		}		

		$scope.activar_desactivar_seccion = function (id){		
			giss_servicios.activar_desactivar_seccion(id).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});			
		}		
		//activar_desactivar_seccion
	}])
