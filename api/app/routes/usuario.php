 <?php

 $app->group('/usuario', function () use ($app)	{

 	/*
	8)
 		/permiso get ALL
 	*/

		$app->get('/', function () use ($app) {

			/*Consulta a la base*/
			$permiso = ORM::for_table('usuario')
				->select('usuario.*')
				->where('estatus',1)
				->find_many();

				$response = array();	
				foreach ($permiso as $key => $value) {
					$permiso = array(
						'id'     => $value->id_usuario,
						'id_persona' => $value->id_persona,
						'name_login'     => $value->name_login,
						'password' => $value->password,	
						'estatus' => $value->estatus,										
						'tipo' => $value->tipo,			
						'ultima_pregunta_contestada_id' => $value->ultima_pregunta_contestada_id,	
						'id_rol' => $value->id_rol,																		
					);
					$response[] = $permiso;
				}

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
 	/*
 		9)
 		/usuario/id GET
 	*/
		$app->get('/:id', function ($id) use ($app) {

			/*Consulta a la base*/
			$usuario = ORM::for_table('usuario')
				->select('usuario.*')		
				->select('rol.nombre','rnombre')					
				->select('persona.nombre','pnombre')
				->select('persona.apellido_paterno','ppaterno')	
				->select('persona.apellido_materno','pmaterno')		
				->select('persona.email','pemail')	
				->select('persona.fecha_nacimiento','pfecha')	
				->select('persona.id_direccion','id_direccion')				
				->select('direccion.id_entidad_federativa','id_entidadf')	
				->select('direccion.calle','calle')		
				->select('direccion.num_ext','num_ext')													
				->select('direccion.num_int','num_int')					
				->select('direccion.codigo_postal','codigo_postal')					
				->select('direccion.colonia','colonia')					
				->select('direccion.localidad','localidad')					
				->select('direccion.ciudad','ciudad')				
				->select('direccion.telefono_particular','telefono_particular')	
				->select('entidad_federativa.nombre','efnombre')					
				->join('persona', array('usuario.id_persona','=','persona.id_persona'))
				->join('rol', array('usuario.id_rol','=','rol.id_rol'))				
				->join('direccion', array('persona.id_direccion','=','direccion.id_direccion'))		
				->join('entidad_federativa', array('direccion.id_entidad_federativa','=','entidad_federativa.id_identidad_federativa'))		
				->where('id_usuario',$id)			
				->find_one();

			$response = array();	
			$response = array(
				'id'     => $usuario->id_usuario,
				'id_persona' => $usuario->id_persona,
				'name_login'     => $usuario->name_login,
				'password' => $usuario->password,	
				'estatus' => $usuario->estatus,										
				'tipo' => $usuario->tipo,			
				'ultima_pregunta_contestada_id' => $usuario->ultima_pregunta_contestada_id,	
				'id_rol' => $usuario->id_rol,
				'rnombre' => $usuario->rnombre,				
				'pnombre'=>$usuario->pnombre,
				'ppaterno'=>$usuario->ppaterno,				
				'pmaterno'=>$usuario->pmaterno,				
				'pemail'=>$usuario->pemail,				
				'pfecha'=>$usuario->pfecha,			
				'id_direccion'=>$usuario->id_direccion,		
				'id_entidadf'=>$usuario->id_entidadf,
				'calle'=>$usuario->calle,
				'num_ext'=>$usuario->num_ext,
				'num_int'=>$usuario->num_int,
				'codigo_postal'=>$usuario->codigo_postal,
				'colonia'=>$usuario->colonia,
				'ciudad'=>$usuario->ciudad,
				'telefono_particular'=>$usuario->telefono_particular,	
				'efnombre'=>$usuario->efnombre																							
			);

			if(empty($response)){
				$response = array (
					'mensaje' => "El rol no tiene permisos aun"
				);
			}
			/*Respuesta del servicio*/
			$app->response->setBody(json_encode($response));			
			$app->response->setStatus(200);
			$app->stop();

		});

		/*Respuesta del get id*/
		$app->options('/:id', function () use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});

 	/*
 		10)
 		/usuario/id PUT
 	*/

	 	$app->put('/', function () use ($app) {
	 		// try{
	 			$rules=array(
	 				//Estos solo para actualizar
		 			'id' =>array(false, "integer", 1, 99), 	 					 					
		 			'id_persona' =>array(false, "integer", 1, 99),
		 			'id_direccion' =>array(false, "integer", 1, 99),		 			 	
		 			//todos estos para nuevo registro
		 			'name_login' =>array(false, "string", 1, 99), 	
		 			'password' =>array(false, "string", 1, 99), 
		 			'estatus' =>array(false, "string", 1, 99), 
		 			'tipo' =>array(false, "string", 1, 99),
		 			'id_rol' =>array(false, "string", 1, 99),	 						 						
		 			'pnombre' =>array(false, "string", 1, 99), 					 				
		 			'ppaterno' =>array(false, "string", 1, 99), 
		 			'pmaterno' =>array(false, "string", 1, 99), 
		 			'pemail' =>array(false, "string", 1, 99), 		 					 					 			
		 			'pfecha' =>array(false, "string", 1, 99), 		 					 			
		 			'id_entidadf' =>array(false, "string", 1, 99), 		 			
		 			'calle' =>array(false, "string", 1, 99), 
		 			'num_ext' =>array(false, "string", 1, 99),
		 			'num_int' =>array(false, "string", 1, 99),
		 			'codigo_postal' =>array(false, "string", 1, 99),
		 			'colonia' =>array(false, "string", 1, 99),	
		 			'localidad'	=>array(false, "string", 1, 99), 					 					 			
		 			'ciudad' =>array(false, "string", 1, 99),	
		 			'telefono_particular' =>array(false, "string", 1, 99),			 			 		
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

				if(empty($params['id'])){
		 			//Insertamos un nuevo registro				
					$direccion = ORM::for_table('direccion')->create();
					$direccion->id_entidad_federativa = $params['id_entidadf'];
					$direccion->calle = $params['calle'];
					$direccion->num_ext = $params['num_ext'];
					$direccion->num_int = $params['num_int'];
					$direccion->codigo_postal = $params['codigo_postal'];		
					$direccion->colonia = $params['colonia'];								
					$direccion->localidad = $params['localidad'];					
					$direccion->ciudad = $params['ciudad'];		
					$direccion->telefono_particular = $params['telefono_particular'];
					$direccion->save();	
					$id_direccion = $direccion->id();

					$persona = ORM::for_table('persona')->create();
					$persona->nombre = $params['pnombre'];
					$persona->apellido_paterno = $params['ppaterno'];
					$persona->apellido_materno = $params['pmaterno'];
					$persona->email = $params['pemail'];		
					$persona->fecha_nacimiento = $params['pfecha'];												
					$persona->id_direccion = $id_direccion ;							
					$persona->save();
					$id_persona = $persona->id();

					$usuario = ORM::for_table('usuario')->create();
					$usuario->name_login = $params['name_login'];
					$usuario->password = $params['password'];
					$usuario->estatus = $params['estatus'];
					$usuario->tipo = $params['tipo'];		
					$usuario->id_persona = $id_persona;
					$usuario->save();					
					$response = array(
							'mensaje' =>"Se agrego correctamente el usuario",
							'id' =>$usuario->id(),
							'id_persona' =>$id_persona,
							'id_direccion' => $id_direccion,
					);	
				}else{
					//Actualizamos con el id
					ORM::configure('id_column_overrides', array('usuario' => 'id_usuario'));				
					$updateu= ORM::for_table('usuario')->find_one($params['id']);
					if(!$updateu){
						$app->response->setStatus(400);
						$error = array('error'=>array('correo'=>"El id del usuario es incorrecto"));
						$app->response->setBody(json_encode($error));
						$app->stop();
					}					
					$updateu->set('name_login',$params['name_login']);
					$updateu->set('password',$params['password']);
					$updateu->set('estatus',$params['estatus']);
					$updateu->set('tipo',$params['tipo']);
					$updateu->set('id_rol',$params['id_rol']);
					$updateu->save();	

					ORM::configure('id_column_overrides', array('persona' => 'id_persona'));
					$persona = ORM::for_table('persona')->find_one($params['id_persona']);
					$persona->set('nombre',$params['pnombre']);
					$persona->set('apellido_paterno',$params['ppaterno']);
					$persona->set('apellido_materno',$params['pmaterno']);
					$persona->set('email',$params['pemail']);		
					$persona->set('fecha_nacimiento',$params['pfecha']);
					$persona->set('id_direccion', $params['id_direccion']);		
					$persona->save();

					ORM::configure('id_column_overrides', array('direccion' => 'id_direccion'));	
					$update = ORM::for_table('direccion')->find_one($params['id_direccion']);

					$update->set('id_entidad_federativa', $params['id_entidadf']);
					$update->set('calle',$params['calle']);
					$update->set('num_ext',$params['num_ext']);
					$update->set('num_int',$params['num_int']);
					$update->set('codigo_postal',$params['codigo_postal']);		
					$update->set('colonia',$params['colonia']);								
					$update->set('localidad',$params['localidad']);					
					$update->set('ciudad',$params['ciudad']);		
					$update->set('telefono_particular',$params['telefono_particular']);
					$update->save();	


					$response = array(
							'mensaje' =>"Se actualizo correctamente el usuario "
					);	
				}
	

			 	$app->response->setStatus(200);
			 	$app->response->setBody(json_encode($response));	

	 		// }catch (Exception $e){			
			 // 	$app->response->setStatus(500);
			 // 	$app->response->setBody(json_encode(array("mensaje" => "error al procesar la peticion: " .$e)));	 			
	 		// }

		});

	 	/*Respuesta del put*/
		$app->options('/', function () use ($app){
			$app->response->setStatus(200);
			$app->response->setBody(json_encode(array('message' => 'ok')));
	 	});

 	/*
	40)
 		/Retorna 1 si es valido, 0 en caso de que el uusario es invalido,
 		Se dice que un usuario es invalido cuando:
 			->Esta inactivo
 			->Ya contesto todas las respuestas
 			->El password es incorrecto
 	*/

		$app->get('/valido/:pass', function ($pass) use ($app) {
 			// try{
				/*Consulta a la base*/
				$permiso = ORM::for_table('usuario')
					->select('usuario.*')
					->where('name_login','folio')				
					->where('password',$pass)
					->find_one();

				//Es incorrecto el folio
				if($permiso== false){
					$permiso = array(
						"mensaje" => "El folio es incorrecto"
						);
					$app->response->setBody(json_encode($permiso));			
					$app->response->setStatus(200);
					$app->stop();
				}
				//Si completo el cuestionario
				if($permiso->ultima_pregunta_contestada_id == 9999){
					$permiso = array(
						"mensaje" => "El cuestionario ya fue contestado en su totalidad"
						);
					$app->response->setBody(json_encode($permiso));			
					$app->response->setStatus(200);
					$app->stop();
				}	

				if(!$permiso->estatus){
					$permiso = array(
						"mensaje" => "El folio esta inactivo"
						);				
					$app->response->setBody(json_encode($permiso));			
					$app->response->setStatus(200);
					$app->stop();
				}						


				if($permiso->id_rol != 1){
					$permiso = array(
						"mensaje" => "El rol es incorrecto"
						);				
					$app->response->setBody(json_encode($permiso));			
					$app->response->setStatus(200);
					$app->stop();
				}

				if(!$permiso->ultima_pregunta_contestada_id)
					$uultima = 9998;
				else
					$uultima = $permiso->ultima_pregunta_contestada_id;

				$response = array();	
				// foreach ($permiso as $key => $value) {
					$permiso = array(
						'id'     => $permiso->id_usuario,
						'id_persona' => $permiso->id_persona,
						'name_login'     => $permiso->name_login,
						'password' => $permiso->password,	
						'estatus' => $permiso->estatus,										
						'tipo' => $permiso->tipo,			
						'ultima_pregunta_contestada_id' => $uultima,	
						'id_rol' => $permiso->id_rol,																		
						);

				// }

				/*Respuesta del servicio*/
				$app->response->setBody(json_encode($permiso));			
				$app->response->setStatus(200);
				$app->stop();

		// }catch(Exception $e){
		// 	$response = array(
		// 		"mensaje" => "El folio es incorrecto ddd"
		// 		);
		// 	$app->response->setBody(json_encode($response));			
		// 	$app->response->setStatus(200);
		// 	$app->stop();
		// }


		});
		/*Respuesta del post*/
		$app->options('/valido/:pass', function ($pass) use ($app){
		 	$app->response->setStatus(200);
		 	$app->response->setBody(json_encode(array('message' => 'ok')));
		});		

});
?>
