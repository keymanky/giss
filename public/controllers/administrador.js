//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('roles',[])
	.controller('admin', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		//Variables globales
		$scope.json = {};		
		$scope.idrolseleccionado = "";
		$scope.rolseleccionadonombre = "";
		//Al init de la pagina
		giss_servicios.consultar_todos_roles().success( function(data){
			console.log(data);
			$scope.datos = data;
		});

		giss_servicios.consultar_todos_permisos().success( function(permisos){
			console.log(permisos);
			$scope.permisos = permisos;
		});

		//Eventos al controlar con el click de ng
		$scope.editarRol = function (e, id){
			var element = document.querySelector(".normal-"+ e);
			var element2 = document.querySelector(".success");
			
			if(element2)
				element2.classList.remove("success");
			element.classList.toggle("success");

			giss_servicios.consultar_id_rol(id).success(function (data) {
				$scope.rolseleccionado = data;


				giss_servicios.consultar_permisos_rol(id).success(function (data){
					if(data.mensaje == "El rol no tiene permisos aun")
						$scope.rolseleccionadopermisos = undefined;
					else
						$scope.rolseleccionadopermisos = data;
					console.log($scope.rolseleccionado);
				});
			});
			$scope.idrolseleccionado = id;
			console.log($scope.idrolseleccionado);
		}

		$scope.eliminarPermiso = function (id){
			giss_servicios.eliminar_permisos_rol(id).success(function (respuesta){
				alert(respuesta[0].mensaje);
				location.reload(true);
			})
		}

		$scope.agregar_permiso_rol = function (id_rol, id_permiso){
			$scope.json = {};			
			$scope.json.id_rol = id_rol;
			$scope.json.id_permiso = id_permiso;
			giss_servicios.agregar_permiso_rol($scope.json).success(function (respuesta){
				alert(respuesta[0].mensaje);
				location.reload(true);				
			});
		}

		$scope.cambiarvalor = function (id) {
			$scope.idpermiso = id;
		}

		$scope.limpiar_rol = function (){
			location.reload(true);	
		}

		$scope.guardar_rol = function (idrolseleccionado, nombre, descripcion){
			$scope.json = {};
			if(idrolseleccionado){
				$scope.json.id = idrolseleccionado;		
			}
			$scope.json.nombre = nombre;
			$scope.json.descripcion = descripcion;	
			giss_servicios.agregar_actualizar_rol($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);

				location.reload(true);				
			});	
		}		
	}])