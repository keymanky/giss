//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',['youtube-embed'])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		//Validacion de la sesion
		if(window.localStorage.getItem("usuario")){
			$scope.informacion = JSON.parse(localStorage.getItem("info"));
			$scope.usuario = JSON.parse(localStorage.getItem("usuario"));		
		}else{
			window.location="http://localhost/giss/public/pages/joven/#/ingresar";
		}

		//Variables al cargar la pagina
		$scope.folio =  localStorage.getItem("folio");
		$scope.playerVars = {
		    controls: 0,
		    autoplay: 1
		};

		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
		});


		$scope.salir = function(){
			window.localStorage.clear();
			window.location="http://localhost/giss/public/pages/joven/#/ingresar";			
		}

		$scope.repetir = function(){
			location.reload();
		}

		//Al dar clic en seleccionar un cuestionario
		$scope.iniciar = function (Folio){
			giss_servicios.valida_folio(Folio).success(function (data) {

				var pregunta = data.ultima_pregunta_contestada_id;
				console.log(pregunta);
				//Si es la primera vez que se contesta el cuestionario
				if(pregunta == 9998){
					window.localStorage.setItem("usuario",JSON.stringify(data));
					giss_servicios.consultar_id_cuestionario(1).success(function (cuestionarios) {					
						//console.log(cuestionarios);
						window.localStorage.setItem("info",JSON.stringify(cuestionarios));	
						window.localStorage.setItem("sec_seccion_actual",0);										
						window.location="http://localhost/giss/public/pages/joven/#/contestar";																								
					});						
				//Si ya termino de constestar todo el cuestionario						
				}else if(pregunta == 9999){
					window.localStorage.clear();					
					alert(data.mensaje);	
				//Nos posicionamos en la ultima pregunta
				}else if (pregunta <= 9997){
					window.localStorage.setItem("usuario",JSON.stringify(data));					
					giss_servicios.info_sig_pregunta(pregunta).success(function (pregunta) {					
						console.log(pregunta.mensaje);
						if(pregunta.mensaje == "ok"){
							window.localStorage.setItem("info",JSON.stringify(pregunta));	
							window.localStorage.setItem("sec_seccion_actual",pregunta.id_seccion);										
							window.location="http://localhost/giss/public/pages/joven/#/contestar";	
						}else if (pregunta.mensaje == "ir a seccion"){
							alert("Debemos ir a seccion");
						}else{
							window.localStorage.clear();
							window.location="http://localhost/giss/public/pages/joven/#/ingresar";								
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
			giss_servicios.ultima_secuencia().success(function (max_secuencia) {	
				//Cargue los datos de la sig seccion de acuerdo a la secuencia
			});
		}
	}])


		//Cuando el usuario selecciona el cuestionario que desea contestar, es decir el sistema recupera el punto donde se quedo el usuario
		//Hay 3 posibles casos
		//1) Ya termino de constestar identificado por el ultima_pregunta_contestada_id = 9999
		//2) El usuario es nuevo identificado por ultima_pregunta_contestada_id = 9998
		//3) El usuario se quedo en una pregunta idenficada por el ultima_pregunta_contestada_id


					//console.log(data);		
					//CASO 2 Y 3  el servicio decide con las banderas que info debe de pintarse, pregunta, o pantallas de secciones			
					// giss_servicios.info_sig_pregunta(pregunta).success(function (data2) {					
					// 	console.log(data2);
					// 	window.localStorage.setItem("info",JSON.stringify(data2));		
					// 	window.location="http://localhost/giss/public/pages/joven/#/contestar";																		
					// });