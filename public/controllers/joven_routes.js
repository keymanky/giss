/*
	2) Archivo secundario de angular
	Donde se define el ruteo y su controlador para cada uno de ellos en vez de hacerlo directamente en el html
*/
angular.module("rutasjoven", ['ngRoute']).
	config(function ($routeProvider) {
		$routeProvider
		.when('/ingresar', {
				templateUrl : "ingresar_folio.html",
				controller : 'joven'
		})
		.when('/contestar', {
				templateUrl : "contestar.html",
				controller : 'joven'
		})		
	})