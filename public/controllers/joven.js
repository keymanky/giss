//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',['youtube-embed'])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		$scope.folio = "";
		$scope.anotherGoodOne = 'https://www.youtube.com/watch?v=18-xvIjH8T4';	
		$scope.playerVars = {
		    controls: 0,
		    autoplay: 1
		};
		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
		});



		$scope.iniciar = function (Folio){
			giss_servicios.valida_folio(Folio).success(function (data) {
				//console.log(data);
				if(!data[0].id){
					alert(data[0].mensaje);				
				}else
					alert("Folio valido");				
			});
		}	
			
	}])