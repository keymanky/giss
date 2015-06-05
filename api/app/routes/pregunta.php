 <?php

 $app->group('/pregunta', function () use ($app)	{

 	/*
	19)
 		/get all preguntas de la seccion especificada
 	*/

	$app->get('/seccion/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
		$secciones = ORM ::for_table('pregunta')	
			->select('pregunta.*')
			->where('id_seccion',$id)
			->order_by_asc('pregunta.secuencia')			
			->find_many();

		$response = array();	
		foreach ($secciones as $key => $value) {

		ORM::configure('id_column_overrides', array('inciso' => 'id_inciso'));
			$num_inciso = count(ORM ::for_table('inciso')	
				->select('inciso.*')
				->where('id_pregunta', $value->id_pregunta)
				->find_many());

			$seccion = array(
				'id'     => $value->id_pregunta,
				'secuencia' => $value->secuencia,
				'num_incisos' => $num_inciso,	
			);

			$response[] = $seccion;
		}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/seccion/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	20)
 		/get id pregunta
 	*/


	$app->get('/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
		$secciones = ORM ::for_table('pregunta')	
			->select('pregunta.*')
			->where('id_pregunta',$id)	
			->find_one();

		$response = array(
			'id'     => $secciones->id_pregunta,
			'nombre' => $secciones->nombre,
			'ruta_imagen' => $secciones->ruta_imagen,
			'ruta_video' => $secciones->ruta_video,	
			'secuencia' => $secciones->secuencia,												
			'estatus' => $secciones->estatus,	
			'descripcion' => $secciones->descripcion,																										
		);

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	21)
 		/PUT POST
 	*/

	$app->put('/', function () use ($app) {

		$rules=array(
 			//Estos solo para actualizar
			'id' =>array(false, "string", 1, 99), 	 					 							 			 	
	 		//todos estos para nuevo registro
			'nombre' =>array(false, "string", 1, 99), 	
			'ruta_imagen' =>array(false, "string", 1, 99), 
			'ruta_video' =>array(false, "string", 1, 99), 
			'descripcion' =>array(false, "string", 1, 99),
			'id_seccion' =>array(false, "string", 1, 99),		 			 		
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


		 //Consultamos la ultima secuencia
		 $ch = curl_init();
		 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/pregunta/ultima/" . $params['id_seccion']);
		 curl_setopt($ch, CURLOPT_HEADER, 0);
		 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		 $raw_data = curl_exec($ch);
		 curl_close($ch);
		 $data = json_decode($raw_data);
		 $ultima_seccion = $data->ultima_pregunta+1;

		 //Si es nueva la pregunta
		 if(empty($params['id'])){

				//Insertamos un nuevo registrO			
			 	$seccion = ORM::for_table('pregunta')->create();
			 	$seccion->nombre = $params['nombre'];		
			 	$seccion->ruta_imagen = $params['ruta_imagen'];								
			 	$seccion->ruta_video = $params['ruta_video'];					
			 	$seccion->descripcion = $params['descripcion'];		
			 	$seccion->id_seccion = $params['id_seccion'];
			 	$seccion->secuencia = $ultima_seccion;
			 	$seccion->save();

			 	$response = array(
			 		'mensaje' =>"Se agrego correctamente la pregunta"
			 	);	
		 } else{
				//Actualizamos con el id
			 	ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));				
			 	$update= ORM::for_table('pregunta')->find_one($params['id']);

			 	if(!$update){
			 		$app->response->setStatus(400);
			 		$error = array('error'=>array('correo'=>"El id del pregunta es incorrecta"));
			 		$app->response->setBody(json_encode($error));
			 		$app->stop();
			 	}

			 	//Se cambio de seccion
			 	if($update->id_seccion != $params['id_seccion']){
			 		 $update->set('secuencia',$ultima_seccion);		 		
					 //Reordenamos las pregunts en donde se encontraba
					 $ch = curl_init();
					 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/pregunta/consecutiva/" . $update->id_seccion);
					 curl_setopt($ch, CURLOPT_HEADER, 0);
					 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
					 $raw_data = curl_exec($ch);
					 curl_close($ch);	
					 $update->set('id_seccion',$params['id_seccion']);						 	 		
			 	}

			 	$update->set('nombre',$params['nombre']);
			 	$update->set('ruta_imagen',$params['ruta_imagen']);
			 	$update->set('ruta_video',$params['ruta_video']);
			 	$update->set('descripcion',$params['descripcion']);
			 	//$update->set('id_seccion',$id);
			 	$update->save();	

			 	$response = array(
			 		'mensaje' =>"Se actualizo correctamente la pregunta "
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
	22)
		//Devuelve la ultima secuencia de todas las preguntas de una seccion
	*/
	$app->get('/ultima/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
		$secciones = ORM ::for_table('pregunta')	
			->select('pregunta.secuencia')
			->where('id_seccion',$id)
			->order_by_desc('pregunta.secuencia')			
			->find_many();

		$response = array(
			'ultima_pregunta' => $secciones[0]->secuencia,
		);


		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/ultima/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});


	/*Respuesta del get*/
	$app->options('/es_final/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	23)
 		/Reordenar las secuecia de las PREGUNTAS
 	*/

	$app->put('/reordenar/:id', function ($id) use ($app) {

		$rules=array(
			//De la PREGUNTA a la cual se le cambiara su secuencia
			'id' =>array(false, "integer", 1, 99), 	 
			//Su secuencia actual			
			'secuencia' =>array(false, "integer", 1, 99), 	 	
			//mas o menos				 							 			 	
			'accion' =>array(false, "string", 1, 99)
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

		 if($params['accion'] == "mas"){
		 	$secuencia_buscada = $params['secuencia'] + 1;
		 }elseif ($params['accion'] == "menos"){
		 	$secuencia_buscada = $params['secuencia'] - 1;
		 }else{
		 	$secuencia_buscada = 0;
		 }

		//Intercambiamos las secuencias
	 	ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));				
	 	$update= ORM::for_table('pregunta')
	 		->select('pregunta.*')
	 		->where('secuencia',$secuencia_buscada)
	 		->where('id_seccion',$id)
	 		->find_one();

	 	if(!$update){
		 		$app->response->setStatus(400);
		 		$error = array('error'=>array('mensaje'=>"es la maxima o la minima " . $secuencia_buscada));
		 		$app->response->setBody(json_encode($error));
		 		$app->stop();
	 	}

		$update->set('secuencia',$params['secuencia']);
	 	$update->save();	

	 	ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));				
	 	$update= ORM::for_table('pregunta')
	 		->select('pregunta.*')
	 		->where('id_pregunta',$params['id'])
	 		->find_one();

	 	$update->set('secuencia',$secuencia_buscada);
	 	$update->save();	

	 	$response = array(
	 		'mensaje' =>"OK "
	 	);	

		 $app->response->setStatus(200);
		 $app->response->setBody(json_encode($response));	
	});

	 /*Respuesta del put*/
	$app->options('/reordenar/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});	


	/*
	24)
 		/Pone la secuencia en orden consecutivo para toda una seccion
 	*/

	$app->get('/consecutiva/:id', function ($id) use ($app) {
		$count =1;
		//Intercambiamos las secuencias
	 	ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));				
	 	$update= ORM::for_table('pregunta')
	 		->select('pregunta.*')
	 		->where('id_seccion',$id)
			->order_by_asc('pregunta.secuencia')
			->order_by_asc('pregunta.id_pregunta')		
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

	 /*Respuesta del put*/
	$app->options('/consecutiva/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});	

});

?>
