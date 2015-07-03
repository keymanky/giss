 <?php

 $app->group('/pantalla', function () use ($app)	{

 	/*
	33)
 		/get id seccion
 	*/

	$app->get('/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		$permiso = ORM::for_table('pantalla_de_instruccion')
			->select('pantalla_de_instruccion.*')
			->where('id_seccion',$id)
			->find_many();

			$response = array();	
			foreach ($permiso as $key => $value) {
				$permiso = array(
					'id'     => $value->id_pantalla_de_instruccion,
					'nombre' => $value->nombre,
					'ruta_imagen' => $value->ruta_imagen,
					'ruta_video' => $value->ruta_video,
					'secuencia' => $value->secuencia,
					'estatus' => $value->estatus,
					'id_seccion' => $value->id_seccion,
					'descripcion' => $value->descripcion,
				);
				$response[] = $permiso;
			}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
		});

		/*Respuesta del post*/
	$app->options('/_id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

 	/*
	34)
 		/get ultima secuencia del id
 	*/
	$app->get('/ultima/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		try{
			$permiso = ORM::for_table('pantalla_de_instruccion')
				->select('pantalla_de_instruccion.*')
				->where('id_seccion',$id)
				->order_by_desc('pantalla_de_instruccion.secuencia')			
				->find_many();

				$response = [];	
				$response = array(
					'ultima_pantalla'=>$permiso[0]->secuencia,
				);
		}catch (Exception $e){

				$response = [];	
				$response = array(
					'ultima_pantalla'=>0,
				);			
		}


			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
	});
	/*Respuesta del post*/
	$app->options('/ultima/:id', function ($id) use ($app){
		$app->response->setStatus(200);
		$app->response->setBody(json_encode(array('message' => 'ok')));
	});	

	/*
	36)
 		/elimina una pantalla por su id
 	*/
	$app->delete('/:id', function ($id) use ($app) {
		try{
		ORM::configure('id_column_overrides', array('pantalla_de_instruccion' => 'id_pantalla_de_instruccion'));
		$permiso = ORM::for_table('pantalla_de_instruccion')
			->select('pantalla_de_instruccion.*')
			->where('id_pantalla_de_instruccion',$id)		
			->find_one();
		$seccion = $permiso->id_seccion;
			/*Eliminacion del registro*/
			$rol = ORM::for_table('pantalla_de_instruccion')
			->where('id_pantalla_de_instruccion',$id)			
			->delete_many();

			/*Verificamos si se borro el registro*/
			if($rol){
				 //Consultamos la ultima secuencia
				 $ch = curl_init();
				 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/pantalla/consecutiva/" . $seccion);
				 curl_setopt($ch, CURLOPT_HEADER, 0);
				 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				 $raw_data = curl_exec($ch);
				 curl_close($ch);
				 $data = json_decode($raw_data);

				$response[] = array(
					'mensaje'=>"se elimino la pantalla a la seccion"
					);
			}else{
				$response[] = array(
					'mensaje'=>"no existe la pantalla a eliminar"
					);			 			
			}
			$app->response->setStatus(201);
			$app->response->setBody(json_encode($response));
		}catch (Exception $e){
			$app->response->setStatus(500);
			$app->response->setBody(json_encode($e));	 			
		}

	});

	/*Respuesta del delete*/
	$app->options('/:id', function ($id) use ($app){
		$app->response->setStatus(200);
		$app->response->setBody(json_encode(array('message' => 'ok')));
	});	 

 	/*
	35)
 		/registra un nuevo inciso para la pregunta id
 	*/
	$app->post('/:id', function ($id) use ($app) {
		try{

			 //Consultamos la ultima secuencia
			 $ch = curl_init();
			 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/pantalla/ultima/" . $id);
			 curl_setopt($ch, CURLOPT_HEADER, 0);
			 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			 $raw_data = curl_exec($ch);
			 curl_close($ch);
			 $data = json_decode($raw_data);
			 $secuencia = $data->ultima_pantalla+1;

			/*Creacion del registro*/
			$rol_permiso=ORM::for_table('pantalla_de_instruccion')->create();
			$rol_permiso->id_seccion=$id;
			$rol_permiso->secuencia = $secuencia;
			$rol_permiso->save();

			/*Respuesta del servidor*/
			$response[] = array(
				'mensaje'=>"se agrego la pantalla de instruccion " // . $secuencia
				);
			$app->response->setStatus(201);
			$app->response->setBody(json_encode($response));
		}catch(Exception $e){
			$app->response->setStatus(500);
			$app->response->setBody(json_encode($e));	 			
		}
	});

	 /*Respuesta del post*/
	 $app->options('/:id', function ($id) use ($app){
		 	$app->response->setStatus(201);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
	 });

 	/*
	38)
 		/actualiza un id por su id_pantalla
 	*/
	$app->put('/:id', function ($id) use ($app) {
		// try{
			$rules=array(
				'nombre' =>array(false, "string", 1, 99), 	
				'ruta_imagen' =>array(false, "string", 1, 99), 
				'ruta_video' =>array(false, "string", 1, 99),
				'descripcion' =>array(false, "string", 1, 99),		 			 		
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

		 	ORM::configure('id_column_overrides', array('pantalla_de_instruccion' => 'id_pantalla_de_instruccion'));				
		 	$update= ORM::for_table('pantalla_de_instruccion')->find_one($id);

		 	if(!$update){
		 		$app->response->setStatus(400);
		 		$error = array('error'=>array('correo'=>"El id de  la pantalla no es correcta"));
		 		$app->response->setBody(json_encode($error));
		 		$app->stop();
		 	}

		 	$update->set('nombre',$params['nombre']);
		 	$update->set('ruta_imagen',$params['ruta_imagen']);
		 	$update->set('ruta_video',$params['ruta_video']);
		 	$update->set('descripcion',$params['descripcion']);
		 	$update->save();
			/*Respuesta del servidor*/
			$response[] = array(
				'mensaje'=>"se actualizo correctamente la pantalla " // . $secuencia
			);
			$app->response->setStatus(201);
			$app->response->setBody(json_encode($response));
		// }catch(Exception $e){
		// 	$app->response->setStatus(500);
		// 	$app->response->setBody(json_encode($e));	 			
		// }
	});

	 /*Respuesta del post*/
	 $app->options('/:id', function ($id) use ($app){
		 	$app->response->setStatus(201);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
	 });


/*
	37)
 		/Reordenar las secuecia de los incisos
 	*/

	$app->get('/consecutiva/:id', function ($id) use ($app) {
		$count =1;
		//Intercambiamos las secuencias
	 	ORM::configure('id_column_overrides', array('pantalla_de_instruccion' => 'id_pantalla_de_instruccion'));				
	 	$update= ORM::for_table('pantalla_de_instruccion')
	 		->select('pantalla_de_instruccion.*')
	 		->where('id_seccion',$id)
			->order_by_asc('pantalla_de_instruccion.secuencia')
			->order_by_asc('pantalla_de_instruccion.id_pantalla_de_instruccion')		
	 		->find_many();
	 	if($update){
		foreach ($update as $key => $value) {
			$value->set('secuencia',$count);
			$count ++;
			$value->save();
		}
		 	$response = array(
		 		'mensaje' =>"OK "
		 	);	
	 	}else{
		 	$response = array(
		 		'mensaje' =>"BAD "
		 	);		 		
	 	}

		 $app->response->setStatus(200);
		 $app->response->setBody(json_encode($response));	
	});

	 /*Respuesta del get*/
	$app->options('/consecutiva/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});	

});
?>
