 <?php

 $app->group('/cuestionario', function () use ($app)	{

 	/*
	11)
 		/cuestionario get unique
 	*/

	$app->get('/', function () use ($app) {

		/*Consulta a la base*/
		ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
		$num_Secciones = count(ORM ::for_table('seccion')	
			->select('seccion.*')
			->find_many());


		ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));		
		$num_preguntas = count(ORM::for_table('pregunta')
			->select('pregunta.*')
			->find_many());

		$response = array(
				'id' => "1",
				'nombre' => "Cuestionario sobre salud sexual para jóvenes con discapacidad auditiva",
				'num_secciones' => "$num_Secciones",
				'num_preguntas' => "$num_preguntas",
		);

		$res[]=$response;
		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($res));			
		$app->response->setStatus(200);
		$app->stop();
		});

	/*Respuesta del post*/
	$app->options('/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

	$app->get('/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		$response = array(
				'cuestionario' => 1,
				'nombre' => "Cuestionario sobre salud sexual para jóvenes con discapacidad auditiva",
				'activo' => "1",
				'descripcion' => "",
				'ruta_imagen' => "",
				'ruta_video' => "https://www.youtube.com/watch?v=8CRP0rqJyPM",
			);

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
		});

	/*Respuesta del post*/
	$app->options('/', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

});
?>
