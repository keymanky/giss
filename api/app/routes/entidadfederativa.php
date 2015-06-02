 <?php

 $app->group('/entidad', function () use ($app)	{

 	/*
	7)
 		/permiso get ALL
 	*/

	$app->get('/', function () use ($app) {

		/*Consulta a la base*/
		$permiso = ORM::for_table('entidad_federativa')
			->select('entidad_federativa.*')
			->find_many();

			$response = array();	
			foreach ($permiso as $key => $value) {
				$permiso = array(
					'id'     => $value->id_identidad_federativa,
					'nombre' => $value->nombre,
				);
				$response[] = $permiso;
			}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
		});
	});

	/*Respuesta del post*/
	$app->options('/', function () use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

?>
