/*
	1) Archivo principal de angular
	para llamarlo en html como ng-app
*/
angular.module('administrador',['rutasadmin','roles','miservicio']);
angular.module('administrativo',['rutasadministrativo','administrativo_middle','miservicio']);
angular.module('incisos',['rutasinciso','incisos_middle','miservicio']);
angular.module('pantallas',['rutaspantallas','pantallas_middle','miservicio']);
angular.module('joven',['rutasjoven','joven_middle','miservicio']);
angular.module('excel',['rutasexcel','excel_middle','miservicio']);
angular.module('login',['login_middle','miservicio']);