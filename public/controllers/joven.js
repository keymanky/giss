//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',['youtube-embed'])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		if(window.localStorage.getItem("usuario")){
			$scope.informacion = JSON.parse(localStorage.getItem("info"));
			$scope.usuario = JSON.parse(localStorage.getItem("usuario"));	
			//console.log($scope.informacion);
			//console.log($scope.usuario);			
		}


		$scope.folio =  localStorage.getItem("folio");
		$scope.anotherGoodOne = 'https://www.youtube.com/watch?v=18-xvIjH8T4';	
		$scope.playerVars = {
		    controls: 0,
		    autoplay: 0
		};
		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
			console.log($scope.cuestionarios);
		});

		//Cuando el usuario selecciona el cuestionario que desea contestar
		$scope.iniciar = function (Folio){
			giss_servicios.valida_folio(Folio).success(function (data) {
				var pregunta = data.ultima_pregunta_contestada_id;

				if(data.ultima_pregunta_contestada_id < 9999){
					window.localStorage.setItem("usuario",JSON.stringify(data));					
					giss_servicios.info_sig_pregunta($scope.usuario.ultima_pregunta_contestada_id).success(function (data2) {					
						window.localStorage.setItem("info",JSON.stringify(data2));													
					});
				}else{
					alert(data.mensaje);	
				}
			});
		}	
			
	}])