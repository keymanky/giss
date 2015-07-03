<?php

$app->group('/exportar', function () use ($app)	{


	/* 47 */

		 	/*
		 		//Genera un json para exportar

		 	*/

		 	$app->get('/', function () use ($app) {

			//Recuperamos todos los usuarios
		 		ORM::configure('id_column_overrides', array('usuario_respuesta' => 'id_usuario_respuesta'));
		 		$usuarios = ORM ::for_table('usuario_respuesta')	
		 		->select('usuario_respuesta.*')
		 		->group_by('id_usuario')
		 		->order_by_asc('id_usuario')
		 		->find_many();

		 		$us = array();
		 		foreach ($usuarios as $key => $value) {
		 			$parcial = array(
		 				'id_usuario' => $value->id_usuario,
		 				);
		 			$us[] = $parcial;
		 		}

			//Recuperamos todas las preguntas
		 		$preguntas = ORM ::for_table('pregunta')	
		 		->select('pregunta.*')
		 		->where('estatus',1)
		 		->order_by_asc('pregunta.id_seccion')				
		 		->order_by_asc('pregunta.secuencia')			
		 		->find_many();


			//Para cada preguntar recuperamos las respuestas de todos los usuarios				
		 		$rp = array();
		 		$parcial = array();
		 		$i=0;
		 		$j=0;
		 		$res= array();

		 		foreach ($preguntas as $keyy => $valuee) {
		 			$res = array();
		 			for ($z=0; $z < count($us) ; $z++) { 

			 			$respuesta = ORM ::for_table('usuario_respuesta')	
			 			->select('usuario_respuesta.*')
			 			->select('usuario.password', 'nu')
			 			->select('codificacion', 'codificacion')
			 			->join('usuario',array('usuario.id_usuario','=','usuario_respuesta.id_usuario'))		 			
			 			->left_outer_join('inciso',array('inciso.id_inciso','=','usuario_respuesta.id_inciso'))
			 			->where('id_pregunta', $valuee->id_pregunta)
			 			->where('id_usuario', $us[$z]['id_usuario'])
			 			->order_by_asc('id_usuario')		 			
			 			->find_one();		 				
		 			
			 			if(!$respuesta){
			 				$respuesta_final = 99;
			 			}else{
			 				if($respuesta->id_inciso)
			 					$respuesta_final= $respuesta->codificacion;
			 				else
			 					$respuesta_final= $respuesta->comentario;
			 			}

		 				$permiso = array(
		 					'caso' => $value->nu,
		 					'respuesta_final'=> $respuesta_final,
		 					);

			 			$res[] = $permiso; 
		 			}


		 			$rp[] = array(
		 				'pregunta'=> $valuee->nombre,
		 				'respuesta' => $res,
		 				);


		 		}


			 $app->response->setBody(json_encode($rp));			
			 $app->response->setStatus(200);
			 $app->stop();
			});


			$app->options('/', function () use ($app){
				$app->response->setStatus(200);
				$app->response->setBody(json_encode(array('message' => 'ok')));
			});

});

?>
