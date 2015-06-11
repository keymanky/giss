//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('administrativo_middle',['youtube-embed'])
	.controller('administrativo_page', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		$scope.json = {};
		$scope.idseccionseleccionada = "";
		$scope.idseccionseleccionada_estatus = "";
		$scope.idpreguntaseleccionada = "";
		$scope.idpreguntaseleccionada_estatus = "";	
		$scope.idseccionagregar = "";	


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

				
				giss_servicios.consultar_pantallas($scope.idseccionseleccionada).success(function (respuesta){
					$scope.pantallas = respuesta;			
				});				
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
			ruta_imagen===undefined ||  ruta_imagen=== "" ? $scope.json.ruta_imagen = " " : $scope.json.ruta_imagen = ruta_imagen;			
			ruta_video===undefined || ruta_video==="" ? $scope.json.ruta_video = " " : $scope.json.ruta_video = ruta_video;

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

		$scope.cambiarseccion = function(id, nombre){
			$scope.idseccionagregar = id;		
			giss_servicios.consultar_todas_preguntas_de_seccion(id).success(function (respuesta){
				$scope.preguntas = respuesta;		
				console.log($scope.preguntas);		
			});			
		}		

		$scope.cambiarseccionagregar = function(id){
			$scope.idseccionagregar = id;	
			//alert($scope.idseccionagregar);
		}		

		$scope.editarPregunta = function (e, id){
			var element = document.querySelector(".normal-"+ e);
			var element2 = document.querySelector(".success");
			//$scope.idseccionagregar = id;			
			if(element2)
				element2.classList.remove("success");
			element.classList.toggle("success");


			giss_servicios.consultar_todos_incisos(id).success(function (respuesta){
				$scope.incisos = respuesta;
				console.log(respuesta);				
				giss_servicios.consultar_pregunta_id(id).success( function(data){

					$scope.preguntaseleccionada = data;
					$scope.idpreguntaseleccionada = data.id;
					if($scope.preguntaseleccionada.ruta_video == " " )
						$scope.preguntaseleccionada.ruta_video = undefined;
					if($scope.preguntaseleccionada.ruta_imagen == " " )
						$scope.preguntaseleccionada.ruta_imagen = undefined;	
					//console.log($scope.preguntaseleccionada);	

				});				
			});		
		}	

		$scope.limpiar_pregunta = function (){
			$scope.idseccionagregar = "";			
			location.reload(true);	
		}
		$scope.guardar_pregunta = function (nombre, ruta_imagen, ruta_video, descripcion) {
			if($scope.idseccionagregar === ""){
				alert("Seleccione la seccion")
				return;
			}
			$scope.json = {};			
			if($scope.idpreguntaseleccionada){
				$scope.json.id = $scope.idpreguntaseleccionada;
			}

			$scope.json.nombre = nombre;
			ruta_imagen===undefined ||  ruta_imagen=== "" ? $scope.json.ruta_imagen = " " : $scope.json.ruta_imagen = ruta_imagen;			
			ruta_video===undefined  || ruta_video==="" ? $scope.json.ruta_video = " " : $scope.json.ruta_video = ruta_video;
			$scope.json.id_seccion = $scope.idseccionagregar;
			$scope.json.descripcion = descripcion;
					
			console.log($scope.json);

			giss_servicios.agregar_pregunta($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});		
		}
		$scope.reordenarPreguntaMas = function (id, sec){
			// alert("id: " + id + "secuencia: " + sec);
			$scope.json = {}
			$scope.json.id = id;
			$scope.json.secuencia = sec;
			$scope.json.accion = "mas"
			console.log($scope.json);
			giss_servicios.reordenar_pregunta($scope.idseccionagregar , $scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});				
		}

		$scope.reordenarPreguntaMenos = function (id, sec){
			// alert("id: " + id + "secuencia: " + sec);
			$scope.json.id = id;
			$scope.json.secuencia = sec;
			$scope.json.accion = "menos"
			console.log($scope.json);			
			giss_servicios.reordenar_pregunta($scope.idseccionagregar  , $scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});			
		}		

		$scope.agregar_inciso_pregunta = function (){		
			giss_servicios.agregar_inciso_pregunta($scope.idpreguntaseleccionada).success(function (respuesta){
				alert(respuesta[0].mensaje);
				//console.log(respuesta[0].mensaje)
				location.reload(true);				
			});			
		}

		$scope.eliminar_inciso_pregunta = function (id){		
			giss_servicios.eliminar_inciso_pregunta(id).success(function (respuesta){
				alert(respuesta[0].mensaje);
				//console.log(respuesta[0].mensaje)
				location.reload(true);				
			});			
		}	

		$scope.ir_a_inciso = function (id){
			//alert("Hacer lo que tengo que hacer para "+ id);
			window.localStorage.setItem("inciso_a_modificar",id);
			window.localStorage.setItem("id_seccion",$scope.idseccionagregar);
			window.localStorage.setItem("nombre_pregunta",$scope.preguntaseleccionada.descripcion);
			window.localStorage.setItem("incisos",JSON.stringify($scope.incisos));

			window.location="http://localhost/giss/public/pages/incisos/#/view";
		}	

		$scope.agregar_pantalla_seccion = function (){		
			giss_servicios.agregar_pantalla_seccion($scope.idseccionseleccionada).success(function (respuesta){
				alert(respuesta[0].mensaje);
				//console.log(respuesta[0].mensaje)
				location.reload(true);				
			});			
		}

		$scope.eliminar_pantalla_seccion = function (id){		
			giss_servicios.eliminar_pantalla_seccion(id).success(function (respuesta){
				alert(respuesta[0].mensaje);
				//console.log(respuesta[0].mensaje)
				location.reload(true);				
			});			
		}	

		$scope.ir_a_pantallas = function (id){
			window.localStorage.setItem("pantalla_a_modificar",id);
			window.localStorage.setItem("id_seccion",$scope.seccionseleccionada.id);	
			window.location="http://localhost/giss/public/pages/pantallas/#/view";
		}	

		$scope.ir_a_probar = function(){
			//alert("Cargando ...");
		}
	}])