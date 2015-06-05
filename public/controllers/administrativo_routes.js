/*
	2) Archivo secundario de angular
	Donde se define el ruteo y su controlador para cada uno de ellos en vez de hacerlo directamente en el html
*/
angular.module("rutasadministrativo", ['ngRoute']).
	config(function ($routeProvider) {
		$routeProvider
		.when('/cuestionario', {
				templateUrl : "cuestionario.html",
				controller : 'administrativo_page'
		})
		.when('/seccion',{
				templateUrl : "seccion.html",
				controller : 'administrativo_page'
		})
		.when('/pregunta',{
				templateUrl : "pregunta.html",
				controller : 'administrativo_page'
		})		
		.when('/inciso',{
				templateUrl : "inciso.html",
				controller : 'administrativo_page'
		})		
	})