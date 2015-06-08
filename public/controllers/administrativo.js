//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('administrativo_middle',['youtube-embed'])
	.controller('administrativo_page', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){
		$scope.json = {};

		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
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
				console.log($scope.url_cuestionario);
			});
		}

		$scope.guardar_cuestionario = function (e, id) {
			alert("No puede puede moficar el cuestionario")
		}

		$scope.limpiar_cuestionario = function (){
			location.reload(true);	
		}		

	}])