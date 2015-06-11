 <?php

 $app->group('/pantalla', function () use ($app)	{

 	/*
	7)
 		/permiso get ALL
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
	});

	/*Respuesta del post*/
	$app->options('/_id', function ($id) use ($app){
	 	$app->response->setStatus(200);
	 	$app->response->setBody(json_encode(array('message' => 'ok')));
	});

?>
