 <?php

 $app->group('/engine', function () use ($app)	{

 	/*
 		//Retorna toda la informacion (cuestionario, secccion, pregunta, incisos) a partir del id pregunta
 		  Si nunca se ha constestado el id pregunta es 9998

 		//las banderas enviadas para distinguir que tipo de informacion pintar son:
 		  CASO A
 		  Si la secuencia de la pregunta siguiente existe 
 		  		pregunta = 1
 		  		Si esa pregunta tiene mas de 1 inciso
 		  			pregunta_incisos = 1
 		  		No tiene incisos
 		  			pregunta_incisos = 0
 		  CASO B
 		  Si la pregunta es la ultima en la seccion
 		  		Si existe una seccion siguiente con preguntas
 		  			seccion = 1
 		  		No existe una seccion siguiente
 		  			message
 		//
 	*/

 		$app->get('/:id', function ($id) use ($app) {							
			ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));

			//RECUPERAMOS LA SECUENCIA QUE SIGUE
			if($id == 9998){
				$secuencia = 0;
			}else{
				$pregunta_ultima = ORM ::for_table('pregunta')	
					->select('pregunta.*')
					->where('id_pregunta',$id)	
					->find_one();
				if(!$pregunta_ultima){
					$response = array(
						"mensaje" => "La pregunta no existe"
					);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}
				$secuencia = $pregunta_ultima->secuencia+1;
			}


			$pregunta_a_mostrar = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('secuencia',$secuencia)	
				->find_one();

			//CASO B
			if(!$pregunta_a_mostrar){

				//recuperamos la seccion siguiente
				if($id == 9998){
					$seccion = ORM ::for_table('seccion')	
						->select('seccion.*')
						->where('secuencia', 1)	
						->find_one();
					$secuencia = 0;
				}else{
					$id_seccion_actual = $pregunta_ultima->id_seccion;
					$seccion = ORM ::for_table('seccion')	
						->select('seccion.*')
						->where('id_seccion', $id_seccion_actual)	
						->find_one();
					$secuencia = $seccion->secuencia;						
				}

				//
				if($seccion->es_final){
					$response = array(
						"mensaje" => "Ha terminado de contestar el cuestionario"
					);
					$app->response->setBody(json_encode($response));			
					$app->response->setStatus(200);
					$app->stop();
				}

				$sig_seccion = $secuencia+1;
				$seccion = ORM ::for_table('seccion')	
					->select('seccion.*')
					->where('secuencia', $sig_seccion)	
					->find_one();

				$response = array(
					'seccion' => 1,
					'pagina_seccion' =>0,
					'id_seccion'     => $seccion->id_seccion,
					'nombre_seccion' => $seccion->nombre,
					'descripcion_seccion' => $seccion->descripcion,
					'ruta_imagen_seccion' => $seccion->ruta_imagen,
					'ruta_video_seccion' => $seccion->ruta_video,	
					'secuencia_seccion' => $seccion->secuencia,										
					'es_final_seccion' => $seccion->es_final,			
					'estatus_seccion' => $seccion->estatus,	
					'descripcion_seccion' => $seccion->descripcion,								
				);

				$app->response->setBody(json_encode($response));			
				$app->response->setStatus(200);
				$app->stop();

			//CASO A
			}else{
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
			}


		$app->response->setBody(json_encode($response));			
		$app->response->setStatus(200);
		$app->stop();
 		});

 		$app->options('/:id', function ($id) use ($app){
 			$app->response->setStatus(200);
 			$app->response->setBody(json_encode(array('message' => 'ok')));
 		});



 	});
 	?>
