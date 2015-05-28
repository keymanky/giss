/*
	2) Archivo secundario de angular
	Donde se define el ruteo y su controlador para cada uno de ellos en vez de hacerlo directamente en el html
*/
angular.module("rutasadmin", ['ngRoute']).
	config(function ($routeProvider) {
		$routeProvider
		.when('/roles', {
				templateUrl : "roles.html",
				controller : 'admin'
		})
		.when('/usuarios',{
				templateUrl : "usuarios.html",
				controller : 'admin'
		})
	})