//Cerebro de angular donde controlaremos el el funcionamiento, es decir aqui ejecutarmeos las acciones importantes

angular.module('roles',[])
	.controller('admin', [ '$scope', 'giss_servicios' , function ($scope, giss_servicios){

		//Variables globales
		$scope.json = {};		
		$scope.idrolseleccionado = "";
		$scope.idusuarioseleccionado = "";
		$scope.idusuarioseleccionadoidpersona = "";
		$scope.idusuarioseleccionadoiddireccion = "";
		$scope.rolseleccionadonombre = "";
		$scope.usuarioseleccionado = "";
		$scope.identidad = "";
		$scope.idroless = "";
		//Al init de la pagina
		giss_servicios.consultar_todos_roles().success( function(data){
			console.log(data);
			$scope.datos = data;
		});
		giss_servicios.consultar_todos_permisos().success( function(permisos){
			console.log(permisos);
			$scope.permisos = permisos;
		});
		giss_servicios.consultar_todas_entidades().success( function(entidades){
			$scope.entidades = entidades;
		});		
		giss_servicios.consultar_todos_usuarios().success( function(usuarios){
			$scope.usuarios = usuarios;
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
				});
			});
			$scope.idrolseleccionado = id;
			console.log($scope.idrolseleccionado);
		}

		$scope.editarUsuario = function (e, id){
			var element = document.querySelector(".normal-"+ e);
			var element2 = document.querySelector(".success");
			
			if(element2)
				element2.classList.remove("success");
			element.classList.toggle("success");

			giss_servicios.consultar_id_usuario(id).success(function (data) {
				$scope.usuarioseleccionado = data;
				$scope.idusuarioseleccionado = data.id;
				$scope.idusuarioseleccionadoidpersona = data.id_persona;
				$scope.idusuarioseleccionadoiddireccion = data.id_direccion;
				$scope.identidad=data.id_entidadf;
				$scope.idroless=data.id_rol;
				console.log($scope.usuarioseleccionado);
				//alert($scope.identidad+$scope.idroless);
			});
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

		$scope.cambiarvalor_entidad = function (id) {
			$scope.identidad = id;
		}

		$scope.cambiarvalor_rol = function (id) {
			$scope.idroless = id;
		}

		$scope.limpiar_rol = function (){
			location.reload(true);	
		}

		$scope.guardar_rol = function (idrolseleccionado, nombre, descripcion){
			//alert(idrolseleccionado + nombre + descripcion)
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

		$scope.guardar_usuario = function(name_login, password, estatus, tipo, id_rol, pnombre, ppaterno, pemail ,pmaterno, pfecha , id_entidadf ,calle, num_ext, num_int, codigo_postal, colonia, efnombre, ciudad, telefono_particular){

			$scope.json = {};			
			if($scope.idusuarioseleccionado){
				$scope.json.id = $scope.idusuarioseleccionado;
				$scope.json.id_persona = $scope.idusuarioseleccionadoidpersona;
				$scope.json.id_direccion = $scope.idusuarioseleccionadoiddireccion;
			}
			$scope.json.name_login = name_login;
			$scope.json.password = password;
			$scope.json.estatus = estatus;
			$scope.json.tipo = tipo;
			$scope.idroless==="" || $scope.idroless === undefined ? $scope.json.id_rol = "1" : $scope.json.id_rol = $scope.idroless;	

			pnombre===undefined ? $scope.json.pnombre = " " : $scope.json.pnombre = pnombre;
			ppaterno===undefined ? $scope.json.ppaterno = " " : $scope.json.ppaterno = ppaterno;
			pmaterno===undefined ? $scope.json.pmaterno = " " : $scope.json.pmaterno = pmaterno;
			pemail===undefined ? $scope.json.pemail = " " : $scope.json.pemail = pemail;						
			pfecha===undefined ? $scope.json.pfecha = "0000-00-00" : $scope.json.pfecha = pfecha;						
			$scope.identidad==="" || $scope.identidad === undefined ? $scope.json.id_entidadf = "1" : $scope.json.id_entidadf = $scope.identidad;	

			calle===undefined ? $scope.json.calle = " " : $scope.json.calle = calle;
			num_ext===undefined ? $scope.json.num_ext = " " : $scope.json.num_ext = num_ext;
			num_int===undefined ? $scope.json.num_int = " " : $scope.json.num_int = num_int;
			codigo_postal===undefined ? $scope.json.codigo_postal = " " : $scope.json.codigo_postal = codigo_postal;						
			colonia===undefined ? $scope.json.colonia = " " : $scope.json.colonia = colonia;						
			ciudad===undefined ? $scope.json.ciudad = " " : $scope.json.ciudad = ciudad;
			efnombre===undefined ? $scope.json.localidad = " " : $scope.json.localidad = efnombre;
			telefono_particular===undefined ? $scope.json.telefono_particular = " " : $scope.json.telefono_particular = telefono_particular;	
					
			//console.log($scope.json);

			giss_servicios.agregar_actualizar_usuario($scope.json).success(function (respuesta){
				alert(respuesta.mensaje);
				location.reload(true);				
			});			
			//alert(codigo_postal + colonia );
			//alert($scope.idroless)
			//alert($scope.idusuarioseleccionado + $scope.idusuarioseleccionadoidpersona + $scope.idusuarioseleccionadoiddireccion);			
		}
	}])