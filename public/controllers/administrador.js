//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('roles',[])
	.controller('admin_roles', [ '$scope', 'giss_servicios' ,function ($scope, servicio){

		$scope.nombre = "Jorgito";
		servicio.consultar_todos_roles().success( function(data){
			console.log(data);
			$scope.datos = data;
		});
	}])