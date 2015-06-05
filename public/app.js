/*
	1) Archivo principal de angular
	para llamarlo en html como ng-app
*/
angular.module('administrador',['rutasadmin','roles','miservicio']);
angular.module('administrativo',['rutasadministrativo','administrativo_middle','miservicio']);