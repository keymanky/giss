 <?php

	function letra($num_secuencia){
		switch ($num_secuencia) {
			case 1:
				return "A)";
				break;
			case 2:
				return "B)";
				break;
			case 3:
				return "C)";
				break;		
			case 4:
				return "D)";
				break;	
			case 5:
				return "E)";
				break;	
			case 6:
				return "F)";
				break;
			case 7:
				return "G)";
				break;	
			case 8:
				return "H)";
				break;																				
			default:
				return "-)";	
				break;
		}
	}

$app->group('/inciso', function () use ($app)	{

 	/*
	27)
 		/get id pregunta
 	*/
	$app->get('/:id', function ($id) use ($app) {
		/*Consulta a la base*/
		$permiso = ORM::for_table('inciso')
			->select('inciso.*')
			->where('id_pregunta',$id)
			->order_by_asc('inciso.secuencia')			
			->find_many();

		$response = array();	
		foreach ($permiso as $key => $value) {
			$permiso = array(
				'id'=>$value->id_inciso,
				'nombre' =>$value->nombre,
				'ruta_imagen' => $value->ruta_imagen,
				'inciso_letra' =>letra($value->secuencia),				
				'secuencia' => $value->secuencia,
				'id_pregunta' => $value->id_pregunta,
				'codificacion' => $value->codificacion,
				'salta_a_la_seccion_id' => $value->salta_a_la_seccion_id,
				'activo' => $value->activo,
				);
			$response[] = $permiso;
		}

		/*Respuesta del servicio*/
		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
	});

	/*Respuesta del post*/
	$app->options('/:id', function ($id) use ($app){
		$app->response->setStatus(200);
		$app->response->setBody(json_encode(array('message' => 'ok')));
	});

 	/*
	28)
 		/get ultima secuencia del id
 	*/
	$app->get('/ultima/:id', function ($id) use ($app) {

		/*Consulta a la base*/
		try{
			$permiso = ORM::for_table('inciso')
				->select('inciso.*')
				->where('id_pregunta',$id)
				->order_by_desc('inciso.secuencia')			
				->find_many();

				$response = [];	
				$response = array(
					'ultimo_inciso'=>$permiso[0]->secuencia,
				);
		}catch (Exception $e){

				$response = [];	
				$response = array(
					'ultimo_inciso'=>0,
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
	29)
 		/registra un nuevo inciso para la pregunta id
 	*/
	$app->post('/:id', function ($id) use ($app) {
		try{

			 //Consultamos la ultima secuencia
			 $ch = curl_init();
			 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/inciso/ultima/" . $id);
			 curl_setopt($ch, CURLOPT_HEADER, 0);
			 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			 $raw_data = curl_exec($ch);
			 curl_close($ch);
			 $data = json_decode($raw_data);
			 $secuencia = $data->ultimo_inciso+1;

			/*Creacion del registro*/
			$rol_permiso=ORM::for_table('inciso')->create();
			$rol_permiso->id_pregunta=$id;
			$rol_permiso->secuencia = $secuencia;
			$rol_permiso->save();

			/*Respuesta del servidor*/
			$response[] = array(
				'mensaje'=>"se agrego el inciso a la pregunta " // . $secuencia
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
	32)
 		/actualiza un id por su id_inciso
 	*/
	$app->put('/:id', function ($id) use ($app) {
		// try{
			$rules=array(
				'nombre' =>array(false, "string", 1, 99), 	
				'ruta_imagen' =>array(false, "string", 1, 99), 
				'codificacion' =>array(false, "string", 1, 99),
				'salta_a_la_seccion_id' =>array(false, "string", 1, 99),		 			 		
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

		 	ORM::configure('id_column_overrides', array('inciso' => 'id_inciso'));				
		 	$update= ORM::for_table('inciso')->find_one($id);

		 	if(!$update){
		 		$app->response->setStatus(400);
		 		$error = array('error'=>array('correo'=>"El id del inciso no es correcto"));
		 		$app->response->setBody(json_encode($error));
		 		$app->stop();
		 	}

		 	$update->set('nombre',$params['nombre']);
		 	$update->set('ruta_imagen',$params['ruta_imagen']);
		 	$update->set('codificacion',$params['codificacion']);
		 	$update->set('salta_a_la_seccion_id',$params['salta_a_la_seccion_id']);
		 	$update->save();
			/*Respuesta del servidor*/
			$response[] = array(
				'mensaje'=>"se actualizo correctamente el inciso " // . $secuencia
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
	30)
 		/elimina el inciso por su id
 	*/
	$app->delete('/:id', function ($id) use ($app) {
		try{

		$permiso = ORM::for_table('inciso')
			->select('inciso.*')
			->where('id_inciso',$id)		
			->find_one();
		$pregunta = $permiso->id_pregunta;
			/*Eliminacion del registro*/
			$rol = ORM::for_table('inciso')
			->where('id_inciso',$id)			
			->delete_many();

			/*Verificamos si se borro el registro*/
			if($rol){
				 //Consultamos la ultima secuencia
				 $ch = curl_init();
				 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/inciso/consecutiva/" . $pregunta);
				 curl_setopt($ch, CURLOPT_HEADER, 0);
				 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
				 $raw_data = curl_exec($ch);
				 curl_close($ch);
				 $data = json_decode($raw_data);

				$response[] = array(
					'mensaje'=>"se elimino el inciso a la pregunta"
					);
			}else{
				$response[] = array(
					'mensaje'=>"no existe el inciso a eliminar"
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
	31)
 		/Reordenar las secuecia de los incisos
 	*/

	$app->get('/consecutiva/:id', function ($id) use ($app) {
		$count =1;
		//Intercambiamos las secuencias
	 	ORM::configure('id_column_overrides', array('inciso' => 'id_inciso'));				
	 	$update= ORM::for_table('inciso')
	 		->select('inciso.*')
	 		->where('id_pregunta',$id)
			->order_by_asc('inciso.secuencia')
			->order_by_asc('inciso.id_inciso')		
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
