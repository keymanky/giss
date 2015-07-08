//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('excel_middle',[])
	.controller('excel', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){


		var host = "http://localhost/giss/public/";

		//Validando la session
			if(window.localStorage.getItem("administrativo")){
				$scope.administrativo = JSON.parse(localStorage.getItem("administrativo"));
			}else{
				window.location= host;
			}

		//Variables globales
			$scope.excel = "";
		
		//Al init de la pagina
			giss_servicios.exportar().success( function(data){
				$scope.excel = data;
				console.log($scope.excel);			
			});


      $scope.exportToExcel=function(tableId){ // ex: '#my-table'
            $scope.exportHref=Excel.tableToExcel(tableId,'sheet name');
            $timeout(function(){location.href=$scope.fileData.exportHref;},100); // trigger download
        }


	}])
	.factory('Excel',function($window){
	        var uri='data:application/vnd.ms-excel;base64,',
	            template='<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>',
	            base64=function(s){return $window.btoa(unescape(encodeURIComponent(s)));},
	            format=function(s,c){return s.replace(/{(\w+)}/g,function(m,p){return c[p];})};
	        return {
	            tableToExcel:function(tableId,worksheetName){
	                var table=$(tableId),
	                    ctx={worksheet:worksheetName,table:table.html()},
	                    href=uri+base64(format(template,ctx));
	                return href;
	            }
	        };
	    })