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

		 		//Consultamos la ultima secuencia
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/seccion/ultima/");
				curl_setopt($ch, CURLOPT_HEADER, 0);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				$raw_data = curl_exec($ch);
				curl_close($ch);
				$data = json_decode($raw_data);
				$ultima_seccion = $data->ultima_seccion+1;

				//Insertamos un nuevo registrO			
			 	$seccion = ORM::for_table('seccion')->create();
			 	$seccion->nombre = $params['nombre'];		
			 	$seccion->ruta_imagen = $params['ruta_imagen'];								
			 	$seccion->ruta_video = $params['ruta_video'];					
			 	$seccion->descripcion = $params['descripcion'];		
			 	$seccion->secuencia = $ultima_seccion;
			 	$seccion->save();	

			 	//Se escribimos la secuencia final
				$ch = curl_init();
				curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/seccion/es_final/" . $seccion->id());
				curl_setopt($ch, CURLOPT_HEADER, 0);
				curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				$raw_data = curl_exec($ch);
				curl_close($ch);			 	
			 
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
		//Devuelve la ultima secuencia de seccion definida
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


	/*
	17)
		//Establece como ultima la seccion pasada por el parametro
	*/
	$app->get('/es_final/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
		$seccionesu = ORM ::for_table('seccion')	
			->select('seccion.*')
			->where('id_seccion',$id)		
			->find_one();

		if($seccionesu){
			$seccionesu->set('es_final',1);
			$seccionesu->save();

			ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
			$seccionesu = ORM ::for_table('seccion')	
				->select('seccion.*')
				->where_not_equal('id_seccion',$id)		
				->find_many();

			foreach ($seccionesu as $key => $value) {
				$value->set('es_final',0);
				$value->save();
			}

			$response= array(
				"mensaje" =>  'OK'
			);			
		}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del get*/
	$app->options('/es_final/:id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	/*
	18)
 		/Reordenar las secuecia de las secciones
 	*/

	$app->put('/reordenar/', function () use ($app) {

		$rules=array(
			//De la seccion a la cual se le cambiara su secuencia
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
	 	ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));				
	 	$update= ORM::for_table('seccion')
	 		->select('seccion.*')
	 		->where('secuencia',$secuencia_buscada)
	 		->find_one();

	 	if(!$update){
		 		$app->response->setStatus(400);
		 		$error = array('error'=>array('mensaje'=>"es la maxima o la minima " . $secuencia_buscada));
		 		$app->response->setBody(json_encode($error));
		 		$app->stop();
	 	}

 		//Consultamos la ultima secuencia
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/seccion/ultima/");
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		$raw_data = curl_exec($ch);
		curl_close($ch);
		$data = json_decode($raw_data);
		$ultima_seccion = $data->ultima_seccion;

		//La ultima seccion sera la enviada en los parametros
		if($ultima_seccion == $secuencia_buscada)
			$id_ultima = $params['id'];
		//la ultima seccion es la mandada en los parametros, pero ahora ssera la penultima
		if($ultima_seccion == $params['secuencia'])
			$id_ultima = $update->id_seccion;

		$update->set('secuencia',$params['secuencia']);
	 	$update->save();	

	 	ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));				
	 	$update= ORM::for_table('seccion')
	 		->select('seccion.*')
	 		->where('id_seccion',$params['id'])
	 		->find_one();

	 	$update->set('secuencia',$secuencia_buscada);
	 	$update->save();	

	 	if(isset($id_ultima))
	 	{
			//Se escribimos la secuencia final
		 	$ch = curl_init();
		 	curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/seccion/es_final/" . $id_ultima);
		 	curl_setopt($ch, CURLOPT_HEADER, 0);
		 	curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		 	$raw_data = curl_exec($ch);
		 	curl_close($ch);	
	 	}
	 	
	 	$response = array(
	 		'mensaje' =>"OK " . $id_ultima
	 	);	

		 $app->response->setStatus(200);
		 $app->response->setBody(json_encode($response));	
	});

	 /*Respuesta del put*/
	$app->options('/reordenar/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});	

});

?>
