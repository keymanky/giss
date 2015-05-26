 <?php

 $app->group('/permiso', function () use ($app)	{

 	/*
 		0)
 		/permiso get ALL
 	*/

	$app->get('/', function () use ($app) {

		/*Consulta a la base*/
		$permiso = ORM::for_table('permiso')
			->select('permiso.*')
			->find_many();

			$response = array();	
			foreach ($permiso as $key => $value) {
				$permiso = array(
					'id'     => $value->id_permiso,
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
