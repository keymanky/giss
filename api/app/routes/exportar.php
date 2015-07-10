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


	/* 49 */

		 	/*
		 		//Genera un json para exportar con la estructura siguiente
		 		//Nota muesta la info solo de usuarios, preguntas y secciones activas

		 		{
					[0]: 
						{
							"id_pregunta J": "XXX",
							"id_pregunta J+1" : "XXX",
							"id_pregunta J+2" : "XXX"
						}
					[1]:{
							"id_pregunta J": "XXX",
							"id_pregunta J+1" : "XXX",
							"id_pregunta J+2" : "XXX"
					}
					[2]:{
							"id_pregunta J": "XXX",
							"id_pregunta J+1" : "XXX",
							"id_pregunta J+2" : "XXX"
					}
					[i]:{
						
					}
					...
					...
					...
		 		}


			Donde [X] representa el conjunto de usuarios que han contestado al menos una pregunta
				i: EL usuario i ordenado por folio
			Donde "id_pregunta" representa el id de la pregunta ordenada por la secuencia de la seccion y la secuencia de la pregunta
				j: La pregunta j
				XXX: EL valor del inciso del usuario i en la pregunta j. Si no existe se escribe el valor se pone 99

		 	*/

		 	$app->get('/v2/', function () use ($app) {

			//Recuperamos todos los usuarios
		 		ORM::configure('id_column_overrides', array('usuario' => 'id_usuario'));
		 		$usuarios = ORM ::for_table('usuario')	
		 		->select('usuario.*')
		 		->where('name_login', 'folio')
		 		->order_by_asc('password')
		 		->find_many();

		 		$i=1;
		 		foreach ($usuarios as $key => $value) {
		 			$parcial[] = array(
		 				$i = $value->password,
		 				$i = $value->id_usuario,
		 				);
		 			$i++;
		 		}

			//Recuperamos todas las preguntas activas en secciones activas
		 	// 	$preguntas = ORM ::for_table('pregunta')	
		 	// 	->select('pregunta.*')
				// ->select('seccion.secuencia', 'sec_seccion')		 		
				// ->select('seccion.estatus', 'sec_estatus')		 		
				// ->select('usuario_respuesta.id_inciso', 'ur_id_inciso')		 		
				// ->select('usuario_respuesta.id_usuario', 'ur_id_usuario')		 		
				// ->join('seccion', array('pregunta.id_seccion', '=', 'seccion.id_seccion'))
				// ->left_outer_join('usuario_respuesta', array('pregunta.id_pregunta', '=', 'usuario_respuesta.id_pregunta'))
		 	// 	->where('estatus',1)
		 	// 	->where('seccion.estatus',1)
		 	// 	->order_by_asc('seccion.secuencia')				
		 	// 	->order_by_asc('pregunta.secuencia')			
		 	// 	->find_many();

				// $response = array();	
				// foreach ($preguntas as $key => $value) {
				// 	$pregunta = array(
				// 		'id'     => $value->id_pregunta,
				// 		'secuencia' => $value->secuencia,
				// 		'descripcion' => $value->descripcion,
				// 		'sec_seccion' =>$value->sec_seccion,
				// 		'ur_id_inciso' =>$value->ur_id_inciso,
				// 		'ur_id_usuario' =>$value->ur_id_usuario,
				// 	);
				// 	$response[] = $pregunta;
				// }


			// //Para cada preguntar recuperamos las respuestas de todos los usuarios				
		 // 		$rp = array();
		 // 		$parcial = array();
		 // 		$i=0;
		 // 		$j=0;
		 // 		$res= array();

		 // 		foreach ($preguntas as $keyy => $valuee) {
		 // 			$res = array();
		 // 			for ($z=0; $z < count($us) ; $z++) { 

			//  			$respuesta = ORM ::for_table('usuario_respuesta')	
			//  			->select('usuario_respuesta.*')
			//  			->select('usuario.password', 'nu')
			//  			->select('codificacion', 'codificacion')
			//  			->join('usuario',array('usuario.id_usuario','=','usuario_respuesta.id_usuario'))		 			
			//  			->left_outer_join('inciso',array('inciso.id_inciso','=','usuario_respuesta.id_inciso'))
			//  			->where('id_pregunta', $valuee->id_pregunta)
			//  			->where('id_usuario', $us[$z]['id_usuario'])
			//  			->order_by_asc('id_usuario')		 			
			//  			->find_one();		 				
		 			
			//  			if(!$respuesta){
			//  				$respuesta_final = 99;
			//  			}else{
			//  				if($respuesta->id_inciso)
			//  					$respuesta_final= $respuesta->codificacion;
			//  				else
			//  					$respuesta_final= $respuesta->comentario;
			//  			}

		 // 				$permiso = array(
		 // 					'caso' => $value->nu,
		 // 					'respuesta_final'=> $respuesta_final,
		 // 					);

			//  			$res[] = $permiso; 
		 // 			}


		 // 			$rp[] = array(
		 // 				'pregunta'=> $valuee->nombre,
		 // 				'respuesta' => $res,
		 // 				);


		 // 		}


			 $app->response->setBody(json_encode($parcial));			
			 $app->response->setStatus(200);
			 $app->stop();
			});


			$app->options('/v2/', function () use ($app){
				$app->response->setStatus(200);
				$app->response->setBody(json_encode(array('message' => 'ok')));
			});


});

?>
