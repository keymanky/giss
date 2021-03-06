<?php
date_default_timezone_set('America/Mexico_City');
require 'app/lib/Slim/Slim.php';
require 'app/vendor/idiorm.php'; 
require 'app/lib/Validator.php';


\Slim\Slim::registerAutoloader();
$config = require 'config.php';

$app = new \Slim\Slim($config["slim"]);

ORM::configure('mysql:host=localhost;dbname=giss;charset=utf8');
ORM::configure('username', 'root');
ORM::configure('password', '12345');

ORM::configure('return_result_sets', true);
ORM::configure('id_column_overrides', array('direccion'               => 'id_direccion'));
ORM::configure('id_column_overrides', array('entidad_federativa'      => 'id_entidad_federativa'));
ORM::configure('id_column_overrides', array('inciso'                  => 'id_inciso'));
ORM::configure('id_column_overrides', array('pantalla_de_instruccion' => 'id_pantalla_de_instruccion'));
ORM::configure('id_column_overrides', array('permiso'                 => 'id_permiso'));
ORM::configure('id_column_overrides', array('persona'                 => 'id_persona'));
ORM::configure('id_column_overrides', array('pregunta'                => 'id_pregunta'));
ORM::configure('id_column_overrides', array('rol'                     => 'id_rol'));
ORM::configure('id_column_overrides', array('rol_permiso'             => 'id_rol_permiso'));
ORM::configure('id_column_overrides', array('usuario'                 => 'id_usuario'));
ORM::configure('id_column_overrides', array('usuario_respuesta'       => 'id_usuario_respuesta'));
ORM::configure('id_column_overrides', array('seccion'                 => 'id_seccion'));
ORM::configure('id_column_overrides', array('contrasena'              => 'id_contrasena'));

// routes //
require 'app/routes/permiso.php';
require 'app/routes/rol.php';
require 'app/routes/entidadfederativa.php';
require 'app/routes/usuario.php';
require 'app/routes/cuestionario.php';
require 'app/routes/seccion.php';
require 'app/routes/pregunta.php';
require 'app/routes/inciso.php';
require 'app/routes/pantalla.php';
require 'app/routes/engine.php';
require 'app/routes/exportar.php';
require 'app/routes/login.php';
require 'app/routes/contrasena.php';

$app->contentType('application/json');

// CORS headers
$app->response->headers->set('Access-Control-Allow-Origin', '*');
$app->response->headers->set('Access-Control-Allow-Methods', 'GET,PUT,POST,DELETE,OPTIONS');
$app->response->headers->set('Access-Control-Allow-Headers', 'X-CSRF-Token, X-Requested-With, Accept, Accept-Version, Content-Length, Content-MD5, Content-Type, Date, X-Api-Version');

$app->run();