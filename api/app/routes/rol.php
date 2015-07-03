 <?php

 $app->group('/rol', function () use ($app)	{

 	/*
 		1)
 		Retorna el id, y el nombre de todos los registros en la tabla roles
 	*/
		$app->get('/', function () use ($app) {
			$roles = ORM::for_table('rol')
				->select('rol.*')
				->find_many();

			$response = array();	
			foreach ($roles as $key => $value) {
				$tmp = array(
					'id'     => $value->id_rol,
					'nombre' => $value->nombre,
				);
				$response[] = $tmp;
			}
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
		});

		$app->options('/', function () use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


 	/*
 		2)
 		Retorna todos los campos del rol con el id especificado
 	*/
		$app->get('/:id', function ($id) use ($app) {

			$rol = ORM::for_table('rol')
				->select('rol.*')
				->where('id_rol',$id)			
				->find_one();
	
			$response = array(
				'id'     => $rol->id_rol,
				'nombre' => $rol->nombre,
				'descripcion' => $rol->descripcion
			);

			if(empty($response)){
				$response = array (
					'mensaje' => "El rol no tiene permisos aun"
				);
			}
			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();

		});

		/*Respuesta del get id*/
		$app->options('/:id', function ($id) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


	/*
		3)
		/rol/permiso/id GET
	*/
		$app->get('/permiso/:id', function ($id) use ($app) {

			/*Consulta a la base*/
			$rol = ORM::for_table('rol_permiso')
				->select('rol_permiso.*')
				->select('permiso.nombre','nombre_permiso')
				->join('permiso', array('rol_permiso.id_permiso','=','permiso.id_permiso'))
				->where('id_rol',$id)			
				->find_many();

			$response = array();	
			foreach ($rol as $key => $value) {
				$rol = array(
					'id'     => $value->id_rol_permiso,
					'id_rol' => $value->id_rol,
					'id_permiso' => $value->id_permiso,
					'nombre_permiso'=>$value->nombre_permiso
				);
				$response[] = $rol;
			}

			if(empty($response)){
				$response = array (
					'mensaje' => "El rol no tiene permisos aun"
				);
			}

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
		});

		/*Respuesta del get id permiso*/
		$app->options('/permiso/:id', function () use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});	

	/*
		4)
		/rol/permiso/ id_Rol POST
		Nota: los ids del permiso y del rol deben de ser validos, no se valida que ya se haya agregado anteriormente
	*/
	 	$app->post('/permiso', function () use ($app) {

	 		try{
		 		/*Validacion de los parametros*/
			 		$rules=array(
			 			'id_rol' =>array(true, "integer", 1, 99),
			 			'id_permiso' =>array(true, "integer", 1, 99)	 			
			 		);

			 		$v = new Validator($app->request->getBody(), $rules);
			 		$params = $v->validate();

			 		if(count($v->getErrors()) > 0){
			 			foreach ($v->getErrors() as $key => $value) {
			 				$response = array("error" => array($key => "campo incorrecto"));
			 				$app->response->setStatus($v->getCode());
			 				$app->response->setBody(json_encode($response));
			 				$app->stop();
			 			}
			 		}

			 	/*Creacion del registro*/
			 		$rol_permiso=ORM::for_table('rol_permiso')->create();
			 		$rol_permiso->id_rol=$params["id_rol"];
			 		$rol_permiso->id_permiso=$params["id_permiso"];
			 		$rol_permiso->save();

			 	/*Respuesta del servidor*/
			 		$response[] = array(
			 			'mensaje'=>"se agrego el permiso al rol"
			 		);
			 		$app->response->setStatus(201);
			 		$app->response->setBody(json_encode($response));
	 		}catch(Exception $e){
			 	$app->response->setStatus(500);
			 	$app->response->setBody(json_encode($e));	 			
	 		}
	 	});

	 	/*Respuesta del post*/
		$app->options('/permiso', function () use ($app){
			$app->response->setStatus(201);
			$app->response->setBody(json_encode(array('message' => 'ok')));
	 	});


	/*
		5)
		/rol/permiso/ id_Rol DELETE
	*/
	 	$app->delete('/permiso/:id', function ($id) use ($app) {
	 		try{
			 	/*Eliminacion del registro*/
					$rol = ORM::for_table('rol_permiso')
						->where_equal('id_rol_permiso',$id)			
						->delete_many();

			 	/*Verificamos si se borro el registro*/
			 		if($rol){
				 		$response[] = array(
				 			'mensaje'=>"se elimino el permiso al rol"
				 		);
			 		}else{
				 		$response[] = array(
				 			'mensaje'=>"no existe el permiso a eliminar"
				 		);			 			
			 		}
			 		$app->response->setStatus(201);
			 		$app->response->setBody(json_encode($response));

	 		}catch (Exception $e){
			 	$app->response->setStatus(500);
			 	$app->response->setBody(json_encode($e));	 			
	 		}

		});

	 	/*Respuesta del post*/
		$app->options('/permiso', function ($id) use ($app){
			$app->response->setStatus(200);
			$app->response->setBody(json_encode(array('message' => 'ok')));
	 	});

	/*
		6)
		/rol/id/ PUT id rol
	*/
	 	$app->put('/', function () use ($app) {
	 		try{
			 	/*Validaciones del response*/
		 		$rules=array(
		 			'id' =>array(false, "integer", 1, 99),
		 			'nombre' =>array(true, "string", 1, 99),
		 			'descripcion' =>array(true, "string", 1, 99)	 			
		 		);

		 		$v = new Validator($app->request->getBody(), $rules);
		 		$params = $v->validate();

		 		if(count($v->getErrors()) > 0){
		 			foreach ($v->getErrors() as $key => $value) {
		 				$response = array("error" => array($key => "campo incorrecto"));
		 				$app->response->setStatus($v->getCode());
		 				$app->response->setBody(json_encode($response));
		 				$app->stop();
		 			}
		 		}


		 		if(empty($params['id'])){
		 			//Insertamos un nuevo registro	
					$rol = ORM::for_table('rol')->create();
					$rol->nombre = $params['nombre'];
					$rol->descripcion = $params['descripcion'];
					$rol->save();	
					$response = array(
							'mensaje' =>"Se agrego correctamente el rol"
					);
		 		} else{
		 			//Actualizamos el registro
					ORM::configure('id_column_overrides', array('rol' => 'id_rol'));
					$update = ORM::for_table('rol')->find_one($params['id']);

					//Si no se encontro al registro a actualizar
					if(!$update){
						$app->response->setStatus(400);
						$error = array('error'=>array('correo'=>"Este rol no se puede actualizar"));
						$app->response->setBody(json_encode($error));
						$app->stop();
					}
					//Actualizamos
					$update->set('nombre', $params['nombre']);
					$update->set('descripcion', $params['descripcion']);
					$update->save();
					$response = array(
							'mensaje' =>"Se actualizo correctamente"
					);	 
				}		

			 	$app->response->setStatus(200);
			 	$app->response->setBody(json_encode($response));	

	 		}catch (Exception $e){			
			 	$app->response->setStatus(500);
			 	$app->response->setBody(json_encode(array("mensaje" => "error al procesar la peticion")));	 			
	 		}

		});

	 	/*Respuesta del put*/
		$app->options('/permiso', function () use ($app){
			$app->response->setStatus(200);
			$app->response->setBody(json_encode(array('message' => 'ok')));
	 	});

});

?>
