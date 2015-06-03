 <?php

 $app->group('/seccion', function () use ($app)	{

 	/*
	13)
 		/get all secciones
 	*/

	$app->get('/', function () use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
		$secciones = ORM ::for_table('seccion')	
			->select('seccion.*')
			->order_by_asc('seccion.secuencia')			
			->find_many();

		$response = array();	
		foreach ($secciones as $key => $value) {

			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
			$num_pregunta = count(ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('id_seccion', $value->id_seccion)
				->find_many());

			$seccion = array(
				'id'     => $value->id_seccion,
				'secuencia' => $value->secuencia,
				'num_preguntas' => $num_pregunta,																	
			);

			$response[] = $seccion;
		}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	14)
 		/get id seccion
 	*/


	$app->get('/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
		$secciones = ORM ::for_table('seccion')	
			->select('seccion.*')
			->where('id_seccion',$id)	
			->find_one();

		$response = array(
			'id'     => $secciones->id_seccion,
			'nombre' => $secciones->nombre,
			'ruta_imagen' => $secciones->ruta_imagen,
			'ruta_video' => $secciones->ruta_video,	
			'secuencia' => $secciones->secuencia,										
			'es_final' => $secciones->es_final,			
			'estatus' => $secciones->estatus,	
			'descripcion' => $secciones->descripcion,																										
		);

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	15)
 		/PUT POST
 	*/

	$app->put('/', function () use ($app) {

		$rules=array(
 			//Estos solo para actualizar
			'id' =>array(false, "integer", 1, 99), 	 					 							 			 	
	 		//todos estos para nuevo registro
			'nombre' =>array(false, "string", 1, 99), 	
			'ruta_imagen' =>array(false, "string", 1, 99), 
			'ruta_video' =>array(false, "string", 1, 99), 
			'descripcion' =>array(false, "string", 1, 99)		 			 		
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
			 	$seccion = ORM::for_table('seccion')->create();
			 	$seccion->nombre = $params['nombre'];		
			 	$seccion->ruta_imagen = $params['ruta_imagen'];								
			 	$seccion->ruta_video = $params['ruta_video'];					
			 	$seccion->descripcion = $params['descripcion'];		
			 	$seccion->save();	
			 
			 	$response = array(
			 		'mensaje' =>"Se agrego correctamente la seccion"
			 	);	
		 } else{
				//Actualizamos con el id
			 	ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));				
			 	$update= ORM::for_table('seccion')->find_one($params['id']);

			 	if(!$update){
			 		$app->response->setStatus(400);
			 		$error = array('error'=>array('correo'=>"El id del usuario es incorrecto"));
			 		$app->response->setBody(json_encode($error));
			 		$app->stop();
			 	}

			 	$update->set('nombre',$params['nombre']);
			 	$update->set('ruta_imagen',$params['ruta_imagen']);
			 	$update->set('ruta_video',$params['ruta_video']);
			 	$update->set('descripcion',$params['descripcion']);
			 	$update->save();	

			 	$response = array(
			 		'mensaje' =>"Se actualizo correctamente la seccion "
			 	);	
		 }

		 $app->response->setStatus(200);
		 $app->response->setBody(json_encode($response));	
	});

	 /*Respuesta del put*/
	$app->options('/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	16)
		//Devuelve la ultima secuencia de seccion definida y activa
	*/
	$app->get('/ultima/', function () use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
		$secciones = ORM ::for_table('seccion')	
			->select('seccion.secuencia')
			->order_by_desc('seccion.secuencia')			
			->find_many();

		$response = array(
			'ultima_seccion' => $secciones[0]->secuencia,
		);


		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/ultima/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});


});

?>
