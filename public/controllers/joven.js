//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',['youtube-embed'])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		if(window.localStorage.getItem("usuario")){
			$scope.informacion = JSON.parse(localStorage.getItem("info"));
			$scope.usuario = JSON.parse(localStorage.getItem("usuario"));	
			//console.log($scope.informacion);
			//console.log($scope.usuario);			
		}else{
			window.location="http://localhost/giss/public/pages/joven/#/ingresar";
		}


		$scope.folio =  localStorage.getItem("folio");
		$scope.playerVars = {
		    controls: 0,
		    autoplay: 0
		};
		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
			//console.log($scope.cuestionarios);
		});

		//Cuando el usuario selecciona el cuestionario que desea contestar, es decir el sistema recupera el punto donde se quedo el usuario
		//Hay 3 posibles casos
		//1) Ya termino de constestar identificado por el ultima_pregunta_contestada_id = 9999
		//2) El usuario es nuevo identificado por ultima_pregunta_contestada_id = 9998
		//3) El usuario se quedo en una pregunta idenficada por el ultima_pregunta_contestada_id

		$scope.iniciar = function (Folio){
			giss_servicios.valida_folio(Folio).success(function (data) {

				var pregunta = data.ultima_pregunta_contestada_id;
				//console.log(pregunta);
				if(data.ultima_pregunta_contestada_id < 9999){

					//CASO 2 Y 3
					window.localStorage.setItem("usuario",JSON.stringify(data));
					console.log(data);		
					//CASO 2 Y 3  el servicio decide con las banderas que info debe de pintarse, pregunta, o pantallas de secciones			
					giss_servicios.info_sig_pregunta(pregunta).success(function (data2) {					
						console.log(data2);
						window.localStorage.setItem("info",JSON.stringify(data2));		
						window.location="http://localhost/giss/public/pages/joven/#/contestar";																		
					});

				//CASO 1
				}else{
					alert(data.mensaje);	
				}


			});
		}	
		
		$scope.salir = function(){
			window.localStorage.clear();
			window.location="http://localhost/giss/public/pages/joven/#/ingresar";			
		}
	}])