//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('joven_middle',[])
	.controller('joven', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		giss_servicios.consultar_todos_cuestionarios().success( function(data){
			$scope.cuestionarios = data;
		});
	}])