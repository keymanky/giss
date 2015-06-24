//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('excel_middle',['media'])
	.controller('excel', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		$scope.excel = "";
		
		giss_servicios.exportar().success( function(data){
			$scope.excel = data;
			console.log($scope.excel);			
		});
	}])