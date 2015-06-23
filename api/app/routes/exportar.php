<?php

 $app->group('/exportar', function () use ($app)	{


		/* 47 */

		 	/*
		 		//Genera un json para exportar

		 	*/

		$app->get('/', function () use ($app) {

			ORM::configure('id_column_overrides', array('usuario_respuesta' => 'id_usuario_respuesta'));
			$respuestas = ORM ::for_table('usuario_respuesta')	
				->select('usuario_respuesta.*')
				->select('usuario.password', 'nu')
				->join('usuario',array('usuario.id_usuario','=','usuario_respuesta.id_usuario'))
				->find_many();
			

			$ri= array();
			foreach ($respuestas as $key => $value) {

				$seccion = array(
					'caso' => $value->nu,
					'id_usuario_respuesta' => $value->id_usuario_respuesta,
					'id_usuario' => $value->id_usuario,
					'id_pregunta' => $value->id_pregunta,
					'id_inciso' =>$value->id_inciso,
					'comentario' =>$value->comentario,
				);

				$ri[] = $seccion;
			}				


			$preguntas = ORM ::for_table('pregunta')	
				->select('pregunta.*')
				->where('estatus',1)
				->order_by_asc('pregunta.id_seccion')				
				->order_by_asc('pregunta.secuencia')			
				->find_many();
			$rp = array();
			$i = 0;
			foreach ($preguntas as $key => $value) {
				$rp[] = array('id_pregunta' => $value->id_pregunta, 'pregunta' => $value->nombre);
				$i++;
			}




			$gina = array();
			$ginita = array();
			//array_push($gina, $ginita)
			foreach ($rp as $key => $value) {				
				foreach ($ri as $keyy => $valuee) {
					if ($value['id_pregunta'] == $keyy['id_pregunta']) {
						$gina[] = array('usuario' => $valuee);
					}
				}
				$ginita = array('pregunta' => $value, 'respuestas' => $gina);
				//print_r(json_encode($value));
				//$ginita[] = $gina;
			}
				print_r(json_encode($ginita));
				$app->stop();
			
			//$app->stop();
			// $app->response->setBody(json_encode($gina));			
			// $app->response->setStatus(200);
			// $app->stop();
		});

		/*Respuesta del get*/
		$app->options('/', function () use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});


	});

?>
