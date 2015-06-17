/*
	Los servicios de alimentan la aplicación 
	Deberan ser llamdos desde el controlador respectivo
	*/

	angular.module('miservicio',[])
	.factory('giss_servicios', function ($http) {
		//console.log($http);
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
			},	
			//7
			consultar_todas_entidades:function () {
				return $http.get('http://localhost/giss/api/entidad');			
			},	
			//8
			consultar_todos_usuarios:function () {
				return $http.get('http://localhost/giss/api/usuario/');			
			},
			//9
			consultar_id_usuario:function(id){
				return $http.get('http://localhost/giss/api/usuario/'+id)
			},
			//10
			agregar_actualizar_usuario:function(obj){
				return $http.put('http://localhost/giss/api/usuario/',obj)
			},
			//11
			consultar_todos_cuestionarios:function () {
				return $http.get('http://localhost/giss/api/cuestionario/');
			},
			//12
			consultar_id_cuestionario:function (id) {
				return $http.get('http://localhost/giss/api/cuestionario/'+id);			
			},
			//13
			consultar_todas_secciones:function () {
				return $http.get('http://localhost/giss/api/seccion/');			
			},
			//14
			consultar_id_seccion:function (id) {
				return $http.get('http://localhost/giss/api/seccion/'+id);			
			},
			//15
			agregar_seccion:function (obj) {
				return $http.put('http://localhost/giss/api/seccion/',obj);			
			},
			//16 consultar la ultima seccion//17 de uso interno establecer como final una seccion
			//18
			reordenar_seccion:function (obj) {
				return $http.put('http://localhost/giss/api/seccion/reordenar/',obj);			
			},
			//19
			consultar_todas_preguntas_de_seccion:function (id) {
				return $http.get('http://localhost/giss/api/pregunta/seccion/'+id);			
			},
			//20
			consultar_pregunta_id:function (id) {
				return $http.get('http://localhost/giss/api/pregunta/'+id);			
			},
			//21
			agregar_pregunta:function (obj) {
				return $http.put('http://localhost/giss/api/pregunta/',obj);			
			},
			//22 consultar la ultima pregunta uso interno			
			//23
			reordenar_pregunta:function (id, obj) {
				return $http.put('http://localhost/giss/api/pregunta/reordenar/'+id ,obj);			
			},
			//25
			activar_desactivar_seccion:function (id) {
				return $http.get('http://localhost/giss/api/seccion/desactivar_activar/'+id);			
			},
			//26
			activar_desactivar_pregunta:function (id) {
				return $http.get('http://localhost/giss/api/pregunta/desactivar_activar/'+id);			
			},
			//27
			consultar_todos_incisos: function(id){
				return $http.get('http://localhost/giss/api/inciso/'+id);						
			},
			//28 uso interno devuelve la ultima
			//29
			agregar_inciso_pregunta: function(id){
				return $http.post('http://localhost/giss/api/inciso/'+id);						
			},
			//30 Eliminar inciso
			eliminar_inciso_pregunta: function(id){
				return $http.delete('http://localhost/giss/api/inciso/'+id);						
			},
			//31 es de uso interno
			//32 
			actualizar_inciso: function(id, obj){
				return $http.put("http://localhost/giss/api/inciso/" + id, obj);
			},
			//33
			consultar_pantallas: function(id){
				return $http.get("http://localhost/giss/api/pantalla/" + id);
			},
			//34 uso interno devuelve la ultima
			//35
			agregar_pantalla_seccion: function(id){
				return $http.post('http://localhost/giss/api/pantalla/'+id);						
			},
			//36 Eliminar pantalla
			eliminar_pantalla_seccion: function(id){
				return $http.delete('http://localhost/giss/api/pantalla/'+id);						
			},
			//37 es de uso interno
			//38 
			actualizar_pantalla: function(id, obj){
				return $http.put("http://localhost/giss/api/pantalla/" + id, obj);
			},
			//
			//	40 	
			// 
			valida_folio: function(id){
				return $http.get("http://localhost/giss/api/usuario/valido/" + id);
			},
			genera_folio: function(id){
				return $http.get("http://localhost/giss/api/usuario/genera/" + id);
			},
			info_sig_pregunta: function(id){
				return $http.get("http://localhost/giss/api/engine/" + id);
			}

		}
	});
