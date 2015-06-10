/*
	2) Archivo secundario de angular
	Donde se define el ruteo y su controlador para cada uno de ellos en vez de hacerlo directamente en el html
*/
angular.module("rutasinciso", ['ngRoute']).
	config(function ($routeProvider) {
		$routeProvider
		.when('/view', {
				templateUrl : "incisos.html",
				controller : 'inci'
		})
	})