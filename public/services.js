/*
	Los servicios de alimentan la aplicación 
	Deberan ser llamdos desde el controlador respectivo
*/

angular.module('miservicio',[])
	.factory('giss_servicios', function ($http) {
		console.log($http);
		return{
			//0
			consultar_todos_permisos:function (id) {
				return $http.get('http://localhost/giss/api/permiso');			
			},		
			//1		
			consultar_todos_roles: function (){
				return $http.get('http://localhost/giss/api/rol');
			},
			//2
			consultar_id_rol: function (id) {
				return $http.get('http://localhost/giss/api/rol/'+id);				
			},
			//3
			consultar_permisos_rol:function (id) {
				return $http.get('http://localhost/giss/api/rol/permiso/'+id);			
			},
			//4
			agregar_permiso_rol: function(obj){
				return $http.post('http://localhost/giss/api/rol/permiso',obj);
			},
			//5
			eliminar_permisos_rol:function (id) {
				return $http.delete('http://localhost/giss/api/rol/permiso/'+id);			
			},	
			//6
			agregar_actualizar_rol:function (obj) {
				return $http.put('http://localhost/giss/api/rol/',obj);			
			}								
			/*
			sig_metodo: function (){
				return $http.get('url_del_servicio');
			}
			*/		
		}
	});
