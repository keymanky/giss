 <?php

 $app->group('/contrasena', function () use ($app)	{

	$app->get('/', function () use ($app) {

		/*Consulta a la base*/
		$contra = ORM::for_table('contrasenas')
			->select('contrasenas.*')
			->find_many();

			$response = array();	
			foreach ($contra as $key => $value) {
				$contra = array(
					'id'     => $value->id_contrasena,
					'contrasena' => $value->contrasena,
				);
				$response[] = $contra;
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


	$app->post('/', function () use ($app) {

		$rules=array(
			'contrasena' =>array(true, "string", 1, 99)	 			 		
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

		//Insertamos un nuevo registrO			
	 	$nuevo = ORM::for_table('contrasenas')->create();
	 	$nuevo->contrasena = $params['contrasena'];		
	 	$nuevo->save();	


	 	$response = array(
	 		'mensaje' =>"Se agrego correctamente la clave de acceso al cuestionario"
	 	);	

		 $app->response->setStatus(200);
		 $app->response->setBody(json_encode($response));	
	});

	 /*Respuesta del post*/
	$app->options('/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

});


?>
