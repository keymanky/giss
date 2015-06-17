 <?php

 $app->group('/engine', function () use ($app)	{

 	/*
	7)
 		/Retorna la informacion de la secuencia, pregunta y los incisos 
 		todo por el id pregunta
 	*/

 		$app->get('/:id', function ($id) use ($app) {							

		ORM::configure('id_column_overrides', array('pregunta' => 'id_pregunta'));

		//Inicia por primera vez el cuestionario
		if($id == 9998){

			$secuencia = 1;

		}else{

			$pregunta_ultima = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('id_pregunta',$id)	
				->find_one();

			//(1) Si la pregunta no existe
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

			//(2) Si la pregunta es la ultima en su seccion
			if(!$pregunta_a_mostrar){
				$response = array(
					"mensaje" => "NOS VAMOS A SECCION"
					);
				$response[] = $permiso;
				$app->response->setBody(json_encode($response));			
				$app->response->setStatus(200);
				$app->stop();



			//(3) Muestre la siguiente pregunta
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
