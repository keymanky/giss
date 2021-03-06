//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('administrativo_middle',['youtube-embed'])
	.controller('administrativo_page', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		
		var host = "http://localhost/giss/public/";

		//Validando la session
			if(window.localStorage.getItem("administrativo")){
				$scope.administrativo = JSON.parse(localStorage.getItem("administrativo"));
			}else{
				window.location=host;
			}

		//Variables globales
			$scope.json = {};
			$scope.json2 = {};
			$scope.idseccionseleccionada = "";
			$scope.idseccionseleccionada_estatus = "";
			$scope.idpreguntaseleccionada = "";
			$scope.idpreguntaseleccionada_estatus = "";	
			$scope.idseccionagregar = "";	

		//Al init de la pagina
			giss_servicios.consultar_todos_cuestionarios().success( function(data){
				$scope.cuestionarios = data;
			});
			giss_servicios.consultar_todas_secciones().success( function(data){
				$scope.secciones = data;
			});

		//Eventos a controlar
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

			$scope.activar_desactivar_pregunta = function (id){		
				giss_servicios.activar_desactivar_pregunta(id).success(function (respuesta){
					alert(respuesta.mensaje);
					location.reload(true);				
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
				window.location= host + "pages/incisos/#/view";
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
				window.location=host + "pages/pantallas/#/view";
			}	

			$scope.ir_a_excel = function (){
				window.location=host + "pages/excel/#/exportar";
			}

			$scope.salir = function (){
				window.localStorage.clear();
				window.location=host ;
			}

			$scope.ir_a_probar = function(){
				//alert("Cargando ...");
				var meses = new Array ("ENERO","FEBRERO","MARZO","ABRIL","MAYO","JUNIO","JULIO","AGOSTO","SEPTIEMBRE","OCTUBRE","NOVIEMBRE","DICIEMBRE");
				var diasSemana = new Array("Domingo","Lunes","Martes","Miércoles","Jueves","Viernes","Sábado");			
				var f=new Date();
				var folio = meses[f.getMonth()].substring(0,2) + f.getDate();
				$scope.json = {};
				$scope.json.name_login = "folio";
				$scope.json.password = folio,
				$scope.json.estatus = "1",
				$scope.json.tipo = "1",
				$scope.json.id_rol = "1",
				$scope.json.pnombre = " ",
				$scope.json.ppaterno = " ",
				$scope.json.pmaterno = " ",
				$scope.json.pemail = " ",
				$scope.json.pfecha = "0000-00-00",
				$scope.json.id_entidadf = "1",
				$scope.json.calle = " ",
				$scope.json.num_ext = " ",
				$scope.json.num_int = " ",
				$scope.json.codigo_postal = " ",
				$scope.json.colonia = " ",
				$scope.json.localidad = " ",
				$scope.json.ciudad = " ",
				$scope.json.telefono_particular = " "			
				//alert(diasSemana[f.getDay()] + ", " + f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
				giss_servicios.agregar_actualizar_usuario($scope.json).success(function (respuesta){
					$scope.json2 = {};
					$scope.json2.id= respuesta.id,
					$scope.json2.id_persona = respuesta.id_persona,
					$scope.json2.id_direccion = respuesta.id_direccion,
					$scope.json2.name_login = "folio";
					$scope.json2.password = folio + respuesta.id,
					$scope.json2.estatus = "1",
					$scope.json2.tipo = "1",
					$scope.json2.id_rol = "1",
					$scope.json2.pnombre = " ",
					$scope.json2.ppaterno = " ",
					$scope.json2.pmaterno = " ",
					$scope.json2.pemail = " ",
					$scope.json2.pfecha = "0000-00-00",
					$scope.json2.id_entidadf = "1",
					$scope.json2.calle = " ",
					$scope.json2.num_ext = " ",
					$scope.json2.num_int = " ",
					$scope.json2.codigo_postal = " ",
					$scope.json2.colonia = " ",
					$scope.json2.localidad = " ",
					$scope.json2.ciudad = " ",
					$scope.json2.telefono_particular = " "		

					giss_servicios.agregar_actualizar_usuario($scope.json2).success(function (respuesta2){
						window.localStorage.setItem("folio",folio + respuesta.id);
					});	

				});			
			}
	}])