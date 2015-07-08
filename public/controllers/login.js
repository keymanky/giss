angular.module('login_middle', [])
	.controller('login', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		var host = "http://localhost/giss/public/";

		$scope.user_name = "";
		$scope.password = "";

		$scope.entrar = function(){
			var json = {};
			json.name_login = $scope.user_name;
			json.password = $scope.password;

			if(json.name_login && json.password){
				giss_servicios.acceso(json).success( function(result){
					if(result.mensaje == "ok"){
						//console.log(result.usuario)	
						window.localStorage.setItem("administrativo",JSON.stringify(result.usuario));												
						window.location= host + "pages/administrativo/#/pregunta";						
					}else
						alert(result.mensaje)
				});
			}
		}
	}])