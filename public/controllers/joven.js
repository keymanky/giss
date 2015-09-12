//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',['media'])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
	
		var host = "http://localhost/giss/public/";

		//Validacion de la sesion
			$scope.json = {};
			$scope.contra = "";

			if(window.localStorage.getItem("contra")){
			//if(window.localStorage.getItem("usuario")){				
				$scope.informacion = JSON.parse(localStorage.getItem("info"));
				$scope.usuario = JSON.parse(localStorage.getItem("usuario"));	
				$scope.indice_seccion = window.localStorage.getItem("index_seccion_actual");
				$scope.sec_seccion_actual = window.localStorage.getItem("sec_seccion_actual");
				$scope.id_pregunta = window.localStorage.getItem("id_pregunta");			
				
				console.log("info: " + $scope.informacion);
				console.log("sec_seccion_actual: " + $scope.sec_seccion_actual);			
				console.log("indice seccion: " + $scope.indice_seccion);
				console.log("id pregunta: " + $scope.id_pregunta);

			}else{
				window.location=host + "pages/joven/#/contra";
			}

			$scope.folio =  localStorage.getItem("folio");
			$scope.playerVars = {
			    controls: 0,
			    autoplay: 1
			};

		//Al init de la pagina
			giss_servicios.consultar_todos_cuestionarios().success( function(data){
				$scope.cuestionarios = data;
			});

		//Eventos a controlar

			$scope.valida_contra = function(){

				//alert($scope.contra);
				// var json = {};
				// json.contra = $scope.contra;

				// if(json.contra){
				// 	giss_servicios.valida_contra(json).success( function(result){
				// 		if(result.mensaje == "ok"){
				// 			//console.log(result.usuario)	
				// 			window.localStorage.setItem("contra",JSON.stringify(result.usuario));												
				// 			window.location= host + "pages/joven/#/ingresar";						
				// 		}else
				// 			alert(result.mensaje)
				// 	});
				// }else
				// 	alert("Ingrese su contraseña");
			}

			$scope.valida_folio = function(valor){
				window.localStorage.setItem("folio", valor);
				alert(valor);
				window.location=host+ "pages/joven/#/ubicacion"
			}			
			$scope.nuevo_folio = function(){
				//window.localStorage.setItem("contra", valor);
				window.location=host+ "pages/joven/#/ubicacion"
			}			
			$scope.ingresar_ubicacion = function(estado, poblacion, institucion){
				//window.localStorage.setItem("contra", valor);
				alert(estado + " - " + poblacion + " - " + institucion)
			}
			$scope.salir = function(){
				window.localStorage.clear();
				window.location=host + "pages/joven/#/ingresar_folio.html";			
			}

			$scope.repetir = function(){
				location.reload();
			}

			//Al dar clic en seleccionar un cuestionario
			$scope.iniciar = function (Folio){
				giss_servicios.valida_folio(Folio).success(function (data) {

					var pregunta = data.ultima_pregunta_contestada_id;
					//console.log(pregunta);
					//Si es la primera vez que se contesta el cuestionario
					if(pregunta == 9998){
						window.localStorage.setItem("usuario",JSON.stringify(data));
						giss_servicios.consultar_id_cuestionario(1).success(function (cuestionarios) {					
							//console.log(cuestionarios);
							window.localStorage.setItem("info",JSON.stringify(cuestionarios));	
							window.localStorage.setItem("sec_seccion_actual",0);
							window.localStorage.setItem("index_seccion_actual",0);
							window.localStorage.setItem("id_pregunta",0);																						
							window.location=host + "pages/joven/#/contestar";																								
						});						
					//Si ya termino de constestar todo el cuestionario						
					}else if(pregunta == 9999){
						window.localStorage.clear();					
						alert(data.mensaje);	
					//Nos posicionamos en la ultima pregunta
					}else if (pregunta <= 9997){
						window.localStorage.setItem("usuario",JSON.stringify(data));					
						giss_servicios.info_sig_pregunta(pregunta).success(function (pregunta) {					
							if(pregunta.mensaje == "ok"){
								window.localStorage.setItem("info",JSON.stringify(pregunta));	
								window.localStorage.setItem("sec_seccion_actual",pregunta.secuencia_seccion);	
								window.localStorage.setItem("index_seccion_actual",0);	
								window.localStorage.setItem("id_pregunta",pregunta.id_pregunta);																							
								window.location=host + "pages/joven/#/contestar";	
							}else if (pregunta.mensaje == "ir a seccion"){
								giss_servicios.sig_seccion_valida(pregunta.secuencia).success(function (seccion_datos) {
									//console.log(seccion_datos);
									window.localStorage.setItem("info",JSON.stringify(seccion_datos));
									window.localStorage.setItem("sec_seccion_actual",seccion_datos.pantallas[0].secuencia);	
									window.localStorage.setItem("index_seccion_actual",0);	
									window.localStorage.setItem("id_pregunta",0);
									window.location=host + "pages/joven/#/contestar";															
									if(seccion_datos.mensaje == "abortar"){
										alert("No hay mas preguntas que contestar");
										window.localStorage.clear();
										window.location=host + "pages/joven/#/contra";										
									}								
								})

							}else{
								window.localStorage.clear();
								window.location=host + "pages/joven/#/contra";								
							}																							
						});
					}
					//Folio incorrecto
					else{
						alert(data.mensaje);							
					}


				});
			}	

			$scope.cargar_seccion = function (){
				$scope.sec_seccion_actual = JSON.parse(localStorage.getItem("sec_seccion_actual"));	
				//console.log($scope.sec_seccion_actual);
				giss_servicios.sig_seccion_valida($scope.sec_seccion_actual).success(function (seccion_datos) {	
					window.localStorage.setItem("info",JSON.stringify(seccion_datos));
					window.localStorage.setItem("sec_seccion_actual",seccion_datos.pantallas[0].secuencia);	
					window.localStorage.setItem("index_seccion_actual",0);	
					window.localStorage.setItem("id_pregunta",0);				
					console.log(seccion_datos);		
					location.reload(); 			
				});
			}

			$scope.cambiar_seccion = function(){
				var i = $scope.informacion.pantallas.length-1
				console.log("Longitud: " + i + " Indice: " + $scope.indice_seccion);
				$scope.indice_seccion++;	

				window.localStorage.setItem("index_seccion_actual",	$scope.indice_seccion);			
				if($scope.informacion.pantallas.length-1 >= $scope.indice_seccion){
					window.localStorage.setItem("index_seccion_actual",$scope.indice_seccion);
					//alert("Siguiente indice");
					location.reload(); 
				}
				else{
					giss_servicios.primera_pregunta_valida($scope.sec_seccion_actual-1).success(function (data) {	
						if(data.mensaje == "ok"){
							window.localStorage.setItem("info",JSON.stringify(data));	
							window.localStorage.setItem("sec_seccion_actual",data.secuencia_seccion);	
							window.localStorage.setItem("index_seccion_actual",0);	
							window.localStorage.setItem("id_pregunta",data.id_pregunta);																	
							location.reload(); 	
						}else{
							alert("No hay mas preguntas que contestar");
							window.localStorage.clear();
							window.location=host + "pages/joven/#/contra";
						}
					});
				}
			}

			$scope.cambiar_pregunta = function(id_inciso,respuesta){
				if(typeof(respuesta) != "number" && id_inciso){
					return alert("Ingrese un numero");
				}
				$scope.json = {};
				$scope.json.id_usuario = $scope.usuario.id;
				$scope.json.id_pregunta = $scope.id_pregunta;
				if(id_inciso){
					$scope.json.id_inciso = id_inciso;
				}
				else{
					$scope.json.id_inciso = 0;
					$scope.json.comentario = $scope.informacion.respuesta;
				}
				console.log($scope.json);

				giss_servicios.contestar($scope.json).success(function (insertar) {	
					console.log(insertar);
					if(insertar.mensaje == "ok"){
						giss_servicios.info_sig_pregunta($scope.id_pregunta).success(function (data) {	
							console.log(data);
							if(data.mensaje == "ok"){
								window.localStorage.setItem("info",JSON.stringify(data));	
								window.localStorage.setItem("sec_seccion_actual",data.secuencia_seccion);	
								window.localStorage.setItem("index_seccion_actual",0);	
								window.localStorage.setItem("id_pregunta",data.id_pregunta);																					
								location.reload(); 	
							}else if(data.mensaje == "ir a seccion"){
								giss_servicios.sig_seccion_valida(data.secuencia).success(function (seccion_datos) {
									console.log(seccion_datos);
									if(seccion_datos.mensaje == "ok"){
										window.localStorage.setItem("info",JSON.stringify(seccion_datos));
										window.localStorage.setItem("sec_seccion_actual",seccion_datos.pantallas[0].secuencia);	
										window.localStorage.setItem("index_seccion_actual",0);
										window.localStorage.setItem("id_pregunta",0);							
										location.reload(); 	
									}													
									if(seccion_datos.mensaje == "abortar"){
										alert("No hay mas preguntas que contestar");
										window.localStorage.clear();
										window.location=host + "pages/joven/#/contra";										
									}								
								});
							}
						});					
					}else if(insertar.mensaje == "ir a seccion"){
						$scope.sec_seccion_actual = JSON.parse(localStorage.getItem("sec_seccion_actual"));	
						//console.log($scope.sec_seccion_actual);
						giss_servicios.sig_seccion_valida($scope.sec_seccion_actual).success(function (seccion_datos) {	
							window.localStorage.setItem("info",JSON.stringify(seccion_datos));
							window.localStorage.setItem("sec_seccion_actual",seccion_datos.pantallas[0].secuencia);	
							window.localStorage.setItem("index_seccion_actual",0);	
							window.localStorage.setItem("id_pregunta",0);				
							console.log(seccion_datos);		
							location.reload(); 		
						});
					}	
				});		
			}

			$scope.test = function(){
				alert("hoola");
			}
	}])