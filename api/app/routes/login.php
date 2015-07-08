 <?php

 $app->group('/login', function () use ($app)	{

 	/*
	47)
 		/post para ingresar al sistema
 		retorna en el campo mensaje 
 			=> ok:  Si las credenciales son validas
 			=> Verifique sus datos y el usuario se encuentra desactivado : Cuando el request es invalido
 	*/

 	$app->post('/', function () use ($app) {

		$rules=array(
			'name_login' =>array(false, "string", 1, 99), 	 					 							 			 	
			'password' =>array(false, "string", 1, 99),		 			 		
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

 		$login = ORM::for_table('usuario')
 		->select('usuario.*')
 		->where('name_login',$params['name_login'])
 		->where('password',$params['password'])		
 		->find_one();
 		
 		$usuario = array();

 		if($login){
 			if($login->estatus == 0)
 				$mensaje = "El usuario se encuentra desactivado";
 			else{
 				$mensaje = "ok";

				$usuario = array(
					'id'     => $login->id_usuario,
					'id_persona' => $login->id_persona,
					'name_login' => $login->name_login,
					'password' =>$login->password,																
					'estatus' =>$login->estatus,																
					'tipo' =>$login->tipo,																
					'ultima_pregunta_contestada_id' =>$login->ultima_pregunta_contestada_id,																
					'id_rol' =>$login->id_rol,																
				);
 			}
 		}else
 			$mensaje = "Verifique sus datos";

 		$response = array(
 				'mensaje'=> $mensaje,
 				'usuario' => $usuario
 			);

 		/*Respuesta del servicio*/
 		$app->response->setBody(json_encode($response));			
 		$app->response->setStatus(200);
 		$app->stop();
 	});

 	/*Respuesta del post*/
 	$app->options('/', function () use ($app){
 		$app->response->setStatus(200);
 		$app->response->setBody(json_encode(array('message' => 'ok')));
 	});


 });
 ?>
