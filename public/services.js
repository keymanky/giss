/*
	Los servicios de alimentan la aplicación 
*/

angular.module('miservicio',[])
	.factory('giss_servicios', function ($http) {
		console.log($http);
		return{
			consultar_todos_roles: function (){
				return $http.get('http://localhost/giss/api/rol');
			}
			/*
			sig_metodo: function (){
				return $http.get('url_del_servicio');
			}
			*/		
		}
	});
