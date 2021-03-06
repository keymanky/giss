 <?php

 $app->group('/engine', function () use ($app)	{

		/* 41 */
 		$app->get('/:id', function ($id) use ($app) {	

		 	/*
		 		//Retorna toda la informacion de la pregunta siguiente

		 		Si el id 
		 			Es Invalido -> mensaje = "abortar"
		 			Es el mayor en secuencia de la seccion  -> mensaje = "ir a seccion"
		 			Es 9998 retorna la informacion de la primera pregunta de la primera seccion -> mensaje ok, arreglo info
		 			Existe una pregunta con la siguiente secuencia -> mensaje ok, arreglo con la info
		 	*/

			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));

			if($id == 9998){
				$secuencia = 1;
				$id_seccion = 1;
			}else{
				$pregunta_ultima = ORM ::for_table('pregunta')	
					->select('pregunta.*')
					->select('seccion.secuencia', 'sec_seccion')
					->join('seccion', array('pregunta.id_seccion', '=', 'seccion.id_seccion'))
					->where('id_pregunta',$id)	
					->find_one();
				if(!$pregunta_ultima){
					$response = array(
						"mensaje" => "abortar"
					);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}
				$secuencia = $pregunta_ultima->secuencia+1;
				$id_seccion = $pregunta_ultima->id_seccion;
			}


			 $ch = curl_init();
			 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/pregunta/ultima/" . $id_seccion);
			 curl_setopt($ch, CURLOPT_HEADER, 0);
			 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			 $raw_data = curl_exec($ch);
			 curl_close($ch);
			 $data = json_decode($raw_data);
			 $num_preguntas = $data->ultima_pregunta;


			$pregunta_a_mostrar = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('secuencia',$secuencia)	
				->where('id_seccion',$id_seccion)
				->find_one();

			if($pregunta_a_mostrar){

				$secciones = ORM ::for_table('seccion')	
					->select('seccion.*')
					->where('id_seccion',$pregunta_a_mostrar->id_seccion)	
					->find_one();

					$incisos_pregunta = ORM::for_table('inciso')
						->select('inciso.*')
						->where('id_pregunta',$pregunta_a_mostrar->id_pregunta)
						->order_by_asc('inciso.secuencia')			
						->find_many();

					$incisos_en_pregunta = array();	
					if($incisos_pregunta){
						foreach ($incisos_pregunta as $key => $value) {
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
							$incisos_en_pregunta[] = $permiso;
						}
					}

					if(count($incisos_en_pregunta) > 0)
						$pregunta_incisos = 1;
					else
						$pregunta_incisos = 0;

					$response = array(
						'mensaje' => "ok",
						'pregunta' =>1,
						'pregunta_incisos' => $pregunta_incisos,
						'id_pregunta' =>$pregunta_a_mostrar->id_pregunta,
						'nombre' =>$pregunta_a_mostrar->nombre,
						'ruta_imagen' =>$pregunta_a_mostrar->ruta_imagen,
						'ruta_video' => $pregunta_a_mostrar->ruta_video,	
						'secuencia' => $pregunta_a_mostrar->secuencia,												
						'estatus' => $pregunta_a_mostrar->estatus,	
						'descripcion' => $pregunta_a_mostrar->descripcion,	
						'id_seccion'     => $secciones->id_seccion,
						'nombre_seccion' => $secciones->nombre,
						'descripcion_seccion' => $secciones->descripcion,
						'ruta_imagen_seccion' => $secciones->ruta_imagen,
						'ruta_video_seccion' => $secciones->ruta_video,	
						'secuencia_seccion' => $secciones->secuencia,										
						'es_final_seccion' => $secciones->es_final,			
						'estatus_seccion' => $secciones->estatus,	
						'descripcion_seccion' => $secciones->descripcion,	
						'incisos' => $incisos_en_pregunta,								
					);

			}elseif ($num_preguntas == $secuencia-1) {
					$response = array (
						'mensaje' => "ir a seccion",
						'secuencia' => $pregunta_ultima->sec_seccion
					);
			} 
			else{
					$response = array (
						'mensaje' => "abortar"
					);
			}


			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
 		});

 		$app->options('/:id', function ($id) use ($app){
 			$app->response->setStatus(200);
 			$app->response->setBody(json_encode(array('message' => 'ok')));
 		});

		/* 42 */
		$app->get('/seccion/:id', function ($id) use ($app) {

		 	/*
		 		//Retorna toda la informacion de la seccion actual identificada por el id, 
		 		Si el id 
		 			Es Invalido -> mensaje = "abortar"
		 			El id pertenece a una seccion invalida -> mensaje = "abortar" 
		 			Es valido -> mensaje = "ok"
		 	*/

			ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
			$secciones = ORM ::for_table('seccion')	
				->select('seccion.*')
				->where('id_seccion',$id)
				->where('estatus',1)	
				->find_one();


				if(!$secciones){
					$response = array(
						"mensaje" => "abortar"
						);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}

			$pantallas = ORM::for_table('pantalla_de_instruccion')
				->select('pantalla_de_instruccion.*')
				->where('id_seccion',$id)
				->find_many();


			$datos_seccion = array(
				'id'     => $secciones->id_seccion,
				'nombre' => $secciones->nombre,
				'ruta_imagen' => $secciones->ruta_imagen,
				'ruta_video' => $secciones->ruta_video,	
				'secuencia' => $secciones->secuencia,										
				'es_final' => $secciones->es_final,			
				'estatus' => $secciones->estatus,	
				'descripcion' => $secciones->descripcion,																							
			);

			$response[] =  $datos_seccion;				

				foreach ($pantallas as $key => $value) {
					$pantallas = array(
						'id'     => $value->id_pantalla_de_instruccion,
						'nombre' => $value->nombre,
						'ruta_imagen' => $value->ruta_imagen,
						'ruta_video' => $value->ruta_video,
						'secuencia' => $value->secuencia,
						'estatus' => $value->estatus,
						'id_seccion' => $value->id_seccion,
						'descripcion' => $value->descripcion,
					);
					$response[] = $pantallas;
				}

				$send = array(
					'mensaje' => "ok",
					'seccion' => 1,
					'numero' => count($response),
					'pantallas' => $response,
				);

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($send));			
			$app->response->setStatus(200);
			$app->stop();
		});

		$app->options('/seccion/:id', function ($id) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});

		/* 43 */
		$app->get('/seccion_sig/:secuencia', function ($secuencia) use ($app) {

		 	/*
		 		//Retorna toda la informacion de la seccion inmediata siguiente de acuerdo a la secuencia enviada, 
		 		Si la secuencia enviada
		 			Es Invalida -> mensaje = "abortar"
		 			No existe una seccion activa mayor a la secuencia enviada -> mensaje = "abortar"
		 			Exito ->mensaje = "ok" y la info de toda la seccion
		 	*/

			ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));

			$i=1;

			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/seccion/ultima/");
			curl_setopt($ch, CURLOPT_HEADER, 0);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$raw_data = curl_exec($ch);
			curl_close($ch);
			$data = json_decode($raw_data);
			$maxima = $data->ultima_seccion;

			do{
				if($i == $maxima)
					break;

				$secciones = ORM ::for_table('seccion')	
					->select('seccion.*')
					->where('secuencia',$secuencia+$i)
					->where('estatus',1)	
					->find_one();

				$i++;
			}while(!$secciones);


				if(!$secciones){
					$response = array(
						"mensaje" => "abortar"
						);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}

			$pantallas = ORM::for_table('pantalla_de_instruccion')
				->select('pantalla_de_instruccion.*')
				->where('id_seccion',$secciones->id_seccion)
				->find_many();


			$datos_seccion = array(
				'id'     => $secciones->id_seccion,
				'nombre' => $secciones->nombre,
				'ruta_imagen' => $secciones->ruta_imagen,
				'ruta_video' => $secciones->ruta_video,	
				'secuencia' => $secciones->secuencia,										
				'es_final' => $secciones->es_final,			
				'estatus' => $secciones->estatus,	
				'descripcion' => $secciones->descripcion,																							
			);

			$response[] =  $datos_seccion;				

				foreach ($pantallas as $key => $value) {
					$pantallas = array(
						'id'     => $value->id_pantalla_de_instruccion,
						'nombre' => $value->nombre,
						'ruta_imagen' => $value->ruta_imagen,
						'ruta_video' => $value->ruta_video,
						'secuencia' => $value->secuencia,
						'estatus' => $value->estatus,
						'id_seccion' => $value->id_seccion,
						'descripcion' => $value->descripcion,
					);
					$response[] = $pantallas;
				}

				$send = array(
					'mensaje' => "ok",
					'seccion' => 1,
					'numero' => count($response),
					'pantallas' => $response,
				);

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($send));			
			$app->response->setStatus(200);
			$app->stop();
		});

		$app->options('/seccion_sig/:secuencia', function ($secuencia) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});

		/* 44 */

		 	/*
		 		//Retorna toda la informacion de la primera pregunta activa al comienzo de una seccion, 
		 		El parametro "id" significa la secuencia de la seccion actual
		 		Si 
		 			No existen preguntas activas para la seccion inmediata siguiente -> mensaje = "abortar"
		 			Exito ->mensaje = "ok" y la info de toda la seccion
		 	*/

		$app->get('/primera_pregunta_activa/:id', function ($id) use ($app) {

			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
			$pregunta_a_mostrar = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->select('seccion.secuencia', 'sec_seccion')
				->join('seccion', array('pregunta.id_seccion', '=', 'seccion.id_seccion'))
				->where('seccion.secuencia',$id+1)	
				->where('pregunta.estatus',1)
				->order_by_asc('pregunta.secuencia')	
				->find_many();

				if(!$pregunta_a_mostrar){
					$response = array(
						"mensaje" => "abortar"
						);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}

				if (count($pregunta_a_mostrar) < 1) {
					$response = array(
						"mensaje" => "abortar"
						);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();					
				}

				$secciones = ORM ::for_table('seccion')	
					->select('seccion.*')
					->where('id_seccion',$pregunta_a_mostrar[0]->id_seccion)	
					->find_one();

					$incisos_pregunta = ORM::for_table('inciso')
						->select('inciso.*')
						->where('id_pregunta',$pregunta_a_mostrar[0]->id_pregunta)
						->order_by_asc('inciso.secuencia')			
						->find_many();

					$incisos_en_pregunta = array();	
					if($incisos_pregunta){
						foreach ($incisos_pregunta as $key => $value) {
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
							$incisos_en_pregunta[] = $permiso;
						}
					}

					if(count($incisos_en_pregunta) > 0)
						$pregunta_incisos = 1;
					else
						$pregunta_incisos = 0;

					$response = array(
						'mensaje' => "ok",
						'pregunta' =>1,
						'pregunta_incisos' => $pregunta_incisos,
						'id_pregunta' =>$pregunta_a_mostrar[0]->id_pregunta,
						'nombre' =>$pregunta_a_mostrar[0]->nombre,
						'ruta_imagen' =>$pregunta_a_mostrar[0]->ruta_imagen,
						'ruta_video' => $pregunta_a_mostrar[0]->ruta_video,	
						'secuencia' => $pregunta_a_mostrar[0]->secuencia,												
						'estatus' => $pregunta_a_mostrar[0]->estatus,	
						'descripcion' => $pregunta_a_mostrar[0]->descripcion,	
						'id_seccion'     => $secciones->id_seccion,
						'nombre_seccion' => $secciones->nombre,
						'descripcion_seccion' => $secciones->descripcion,
						'ruta_imagen_seccion' => $secciones->ruta_imagen,
						'ruta_video_seccion' => $secciones->ruta_video,	
						'secuencia_seccion' => $secciones->secuencia,										
						'es_final_seccion' => $secciones->es_final,			
						'estatus_seccion' => $secciones->estatus,	
						'descripcion_seccion' => $secciones->descripcion,	
						'incisos' => $incisos_en_pregunta,								
					);

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
		});

		/*Respuesta del get*/
		$app->options('/primera_pregunta_activa/:id', function ($id) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});

		/* 45 */

		 	/*
		 		//Guardar respuesta usuario
		 		El parametro "id" significa la secuencia de la seccion actual
		 		Si 
		 			No existen preguntas activas para la seccion inmediata siguiente -> mensaje = "abortar"
		 			Exito ->mensaje = "ok" y la info de toda la seccion
		 	*/

		$app->post('/guardar/', function () use ($app) {

			$rules=array(
				'id_usuario' =>array(false, "string", 1, 99), 	 					 							 			 	
				'id_pregunta' =>array(false, "string", 1, 99), 	
				'id_inciso' =>array(false, "string", 1, 99), 	
				'comentario' =>array(false, "string",1, 99),	
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

			//ORM::configure('id_column_overrides', array('usuario_respuesta' => 'id_usuario_respuesta'));

			$respuesta = ORM ::for_table('usuario_respuesta')->create();
			$respuesta->id_usuario = $params['id_usuario'];
			$respuesta->id_pregunta = $params['id_pregunta'];
			if($params['id_inciso'] != 0)
				$respuesta->id_inciso = $params['id_inciso'];
			else
				$respuesta->comentario = $params['comentario'];		
			$respuesta->save();										


			if($params['id_inciso'] != 0){
				$inciso = ORM::for_table('inciso')
					->select('inciso.*')
					->where('id_inciso',$params['id_inciso'])			
					->find_one();

				ORM::configure('id_column_overrides', array('usuario' => 'id_usuario'));				
				$updateu= ORM::for_table('usuario')->find_one($params['id_usuario']);				
				$updateu->set('ultima_pregunta_contestada_id',$params['id_pregunta']);
				$updateu->save();	

				if($inciso->salta_a_la_seccion_id || $inciso->salta_a_la_seccion_id>0){

					 $ch = curl_init();
					 curl_setopt($ch, CURLOPT_URL, "http://localhost/giss/api/engine/auto/" . $params['id_usuario'] . "/" . $params['id_pregunta']);
					 curl_setopt($ch, CURLOPT_HEADER, 0);
					 curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
					 $raw_data = curl_exec($ch);
					 curl_close($ch);
					 $data = json_decode($raw_data);

				 	$response = array(
				 		'mensaje' =>"ir a seccion"
				 	);
				}else{
				 	$response = array(
				 		'mensaje' =>"ok"
				 	);
				}
			}else{
				$response = array(
			 		'mensaje' =>"ok"
			 	);
			}

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();
		});

		/*Respuesta del get*/
		$app->options('/guardar/', function () use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


		/* 46 */

		 	/*
		 		//Contesta todas las pregutas siguientes de esa seccion con 98

		 	*/

		$app->get('/auto/:id_usuario/:id_pregunta', function ($id_usuario, $id_pregunta) use ($app) {

			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
			$pregunta = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('id_pregunta', $id_pregunta)	
				->find_one();

			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));
			$preguntas = ORM ::for_table('pregunta')				
				->select('pregunta.*')
				->where('id_seccion',$pregunta->id_seccion)
				->where_gt('secuencia', $pregunta->secuencia)
	      		->find_many();

	
			foreach ($preguntas as $key => $value) {

				//ORM::configure('id_column_overrides', array('usuario_respuesta' => 'id_usuario_respuesta'));
				$respuesta = ORM ::for_table('usuario_respuesta')->create();
				$respuesta->id_usuario = $id_usuario;
				$respuesta->id_pregunta = $value->id_pregunta;
				$respuesta->comentario = 98;		
				$respuesta->save();

			}

				$response = array(
			 		'mensaje' =>"ok"
			 	);

				$app->response->setBody(json_encode($response));			
				$app->response->setStatus(200);
				$app->stop();
		});

		/*Respuesta del get*/
		$app->options('/auto/:id_usuario/:id_pregunta', function ($id_usuario, $id_pregunta) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


 	});
 	?>
