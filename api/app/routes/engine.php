 <?php

 $app->group('/engine', function () use ($app)	{

 	/*
 		//Retorna toda la informacion de la pregunta siguiente

 		Si el id 
 			Es Invalido -> mensaje = "abortar"
 			Es el mayor en secuencia de la seccion  -> mensaje = "ir a seccion"
 			Es 9998 retorna la informacion de la primera pregunta de la primera seccion -> mensaje ok, arreglo info
 			Existe una pregunta con la siguiente secuencia -> mensaje ok, arreglo con la info
 	*/

 		$app->get('/:id', function ($id) use ($app) {							
			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));

			if($id == 9998){
				$secuencia = 1;
				$id_seccion = 1;
			}else{
				$pregunta_ultima = ORM ::for_table('pregunta')	
					->select('pregunta.*')
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
						'mensaje' => "ir a seccion"
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

		$app->get('/seccion/:id', function ($id) use ($app) {

			/*Consulta a la base*/
			ORM::configure('id_column_overrides', array('seccion' => 'id_seccion'));
			$secciones = ORM ::for_table('seccion')	
				->select('seccion.*')
				->where('id_seccion',$id)
				->where('estatus',1)	
				->find_one();


				if(!$secciones){
					$response = array(
						"seccion" => 0
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
					'seccion' => 1,
					'numero' => count($response),
					'pantallas' => $response,
				);

			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($send));			
			$app->response->setStatus(200);
			$app->stop();
		});

		/*Respuesta del get*/
		$app->options('//seccion/:id', function ($id) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


 	});
 	?>
