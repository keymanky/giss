INSERT INTO
	entidad_federativa (id_identidad_federativa, nombre)
VALUES
	(1,'Aguascalientes'),
	(2,'Baja California'),
	(3,'Baja California Sur'),
	(4,'Campeche'),
	(5,'Coahuila de Zaragoza'),
	(6,'Colima'),
	(7,'Chiapas'),
	(8,'Chihuahua'),
	(9,'Distrito Federal'),
	(10,'Durango'),
	(11,'Guanajuato'),
	(12,'Guerrero'),
	(13,'Hidalgo'),
	(14,'Jalisco'),
	(15,'México'),
	(16,'Michoacán de Ocampo'),
	(17,'Morelos'),
	(18,'Nayarit'),
	(19,'Nuevo León'),
	(20,'Oaxaca'),
	(21,'Puebla'),
	(22,'Querétaro'),
	(23,'Quintana Roo'),
	(24,'San Luis Potosí'),
	(25,'Sinaloa'),
	(26,'Sonora'),
	(27,'Tabasco'),
	(28,'Tamaulipas'),
	(29,'Tlaxcala'),
	(30,'Veracruz'),
	(31,'Yucatán'),
	(32,'Zacatecas');

INSERT INTO `direccion` (id_direccion, calle, num_ext, num_int, colonia, codigo_postal, localidad, ciudad, telefono_particular, id_entidad_federativa)
VALUES
(1,'Av. de los Barrios','1',NULL,'Los reyes Ixtacala','54090','Zona metropolitana','Tlalnepantla','56231333',14),
(2,'Av. de los Barrios','1',NULL,'Los reyes Ixtacala','54090','Zona metropolitana','Tlalnepantla','5538169364',14),
(3,'Desconocido','S/N',NULL,'Azcapotzalco','02070','Zona metropolitana','Azcapotzalco','5527651866',8),
(4,'Desconocido','24',NULL,'Acueducto de Tenayuca','54150','Zona metropolitana','Tlalnepantla','5534748105',14),
(5,'Av. Alcanfores y San Juan Totoltepec','S/N',NULL,'Santa Cruz Acatlán','53150','Zona metropolitana','Tlalnepantla','5531984102',14);


INSERT INTO `persona` VALUES
(1,'susana','robles','montijo','susana@campus.iztacala.unam.mx',NULL,1,1),
(2,'breatriz','frías','arroyo','bety.frias@gmail.com',NULL,1,2),
(3,'yuma','yoaly','pérez','yoaly_yu@hotmail.com',NULL,1,3),
(4,'jorge','salgado','mendoza','keymanky@hotmail.com','1991-01-16',2,4),
(5,'dyana erika','marrón','luna','dyana.marron@gmail.com',NULL,1,5);


INSERT INTO `permiso` VALUES
(1,'creacion',1),
(2,'modificacion',1),
(3,'eliminacion logica o fisica segun aplique',1),
(4,'lectura',1),
(5,'totales',1);


INSERT INTO `usuario` VALUES
(1,1,'susana','susana',1,NULL,NULL,2,NULL),
(2,2,'bety','bety',1,NULL,NULL,2,NULL),
(3,3,'yuma','yuma',1,NULL,NULL,2,NULL),
(4,4,'jorge','jorge',1,NULL,NULL,1,NULL),
(5,5,'diana','diana',1,NULL,NULL,1,NULL),
(6,NULL,'ejemplo','ejemplo',1,NULL,NULL,3,NULL);


INSERT INTO `permiso` VALUES
	(1,'lectura'),
	(2,'creacion y modificacion')


INSERT INTO `rol` VALUES
	(1,'joven con discapacidad','Jóven con discapacidad auditiva y contesta el cuestionario'),
	(2, 'asistente o investigador', 'encargado de dar mantenimiento al catalogo de secciones, preguntas e incisos')
	(3, 'administrador', 'encargado de dar mantenimiento general al sistema')


INSERT INTO `rol_permiso` (id_rol, id_permiso) VALUES
	(1,1),
	(2,1),
	(2,2),
	(3,3)

INSERT INTO `seccion` (id_seccion,nombre,descripcion,ruta_imagen,ruta_video,secuencia,es_final,estatus)
	VALUES
	(1,'SECCIÓN I: DATOS GENERALES','',NULL,'https://www.youtube.com/watch?v=19cvczdD1Ps',1,0,1),
	(2,'SECCIÓN II: COMUNICACIÓN CON PADRES','',NULL,'https://www.youtube.com/watch?v=PTyP6666OTA',2,0,1),
	(3,'SECCIÓN III: COMPORTAMIENTO SEXUAL','',NULL,'https://www.youtube.com/watch?v=I11qo90VUT0',3,0,1),
	(4,'SECCIÓN III: COMPORTAMIENTO SEXUAL ÚLTIMOS 6 MESES','',NULL,'https://www.youtube.com/watch?v=5pa8sehzXWU',4,0,1),
	(5,'SECCIÓN IV:  CONOCIMIENTOS','',NULL,'https://www.youtube.com/watch?v=jzEOwQRKoAE',5,0,1),
	(6,'Gracias Por ayudar','Gracias Por ayudar',NULL,'https://www.youtube.com/watch?v=PLcn0U-iJrw',6,1,1);


INSERT INTO `pregunta`
VALUES
(1,'Tú:',NULL,'https://youtu.be/XZlTZZk9Kxs',1,'Tipo o nivel de la discapacidad',1,1),
(2,'Tú sordo o hipoacusia ASÍ NACIÓ o cuando NIÑO tu sordo o hipoacusia cuántos años:',NULL,'https://youtu.be/HuxambPX51s',2,'Edad inicial de la discapacidad',1,1),
(3,'Tú:',NULL,'https://youtu.be/u83VEzXy6PE',3,'Sexo',1,1),
(4,'Tú cuántos años ahorita:',NULL,'https://youtu.be/cNsdll_3VCY',4,'Edad actual',1,1),
(5,'Tú:',NULL,'https://youtu.be/vV0yLjwXhyI',5,'Estado civil',1,1),
(6,'Tú nivel estudios hasta:',NULL,'https://youtu.be/a9_23iN89dA',6,'Nivel Estudios',1,1),
(7,'¿Tu PAPÁ vive?',NULL,'https://youtu.be/NUm8FepkG5A',7,'Vive papá',1,1),
(8,'¿Tu PAPÁ tiene discapacidad:',NULL,'https://youtu.be/Ztcrk--o-Fg',8,'Discapacidad del papá',1,1),
(9,'¿Tu MAMÁ vive?',NULL,'https://youtu.be/G_cCjeXizaM',9,'Vive mamá',1,1),
(10,'¿Tu MAMÁ tiene discapacidad?',NULL,'video\\Pregunta 10.mov',10,'Discapacidad de la mamá',1,1),
(11,'¿Tu PAPÁ y MAMÁ viven:',NULL,'https://youtu.be/jMaarggeBdI',11,'Papá y mamá viven juntos o separados',1,1),
(12,'Tu PAPÁ cuántos años ahorita:',NULL,'https://youtu.be/PiUfnqmZ1c4',12,'Edad del papá',1,1),
(13,'Tu MAMÁ cuántos años ahorita:',NULL,'https://youtu.be/ZOCN9kSp3y4',13,'Edad de la mamá',1,1),
(14,'Tu PAPÁ nivel estudios:',NULL,'https://youtu.be/9sE9e0AmjWc',14,'Nivel de estudios del papá',1,1),
(15,'Tu MAMÁ nivel estudios:',NULL,'https://youtu.be/nkXn4Y8qDu0',15,'Nivel de estudios de la mamá',1,1),
(16,'¿TÚ ahorita dónde vives?',NULL,'https://youtu.be/Ny2gTVLtJvM',16,'Con quién vive el participante',1,1),
(17,'Tu PAPÁ trabaja',NULL,'https://youtu.be/PIrtg8rAD04',17,'El papá trabaja',1,1),
(18,'Tu MAMÁ trabaja',NULL,'https://youtu.be/_GovMSYp4-c',18,'La mamá trabaja',1,1),
(19,'TÚ trabajas',NULL,'https://youtu.be/1PyFsazgy0U',19,'Trabaja el participante',1,1),
(20,'TÚ y tu PAPÁ cuánto platicar\n\"bien o mal cuando hay sexo\"',NULL,'https://www.youtube.com/watch?v=MsKRvuqCPcs',1,'Papá - Ventajas y desventajas de tener relaciones sexuales',2,1),
(21,'TÚ y tu PAPÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"',NULL,'',2,'Papá - Posponer encuentro sexual',2,1),
(22,'TÚ y tu PAPÁ cuánto platicar\n\"tú decir SÍ o NO quiere sexo\"',NULL,'https://www.youtube.com/watch?v=x17IEyTkvcs',3,'Papá - Tener relaciones sexuales por decisión propia',2,1),
(23,'TÚ y tu PAPÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"',NULL,'https://www.youtube.com/watch?v=yf_XUUkoyBQ',4,'Papá - No permitir abuso sexual ',2,1),
(24,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"',NULL,'https://www.youtube.com/watch?v=tZWSrShHy00',5,'Papá - Cómo evitar un embarazo',2,1),
(25,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"',NULL,'https://www.youtube.com/watch?v=cXYkijL_q2E',6,'Papá - Cómo se contraen las ETS',2,1),
(26,'TÚ y tu PAPÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para no embarazo, condón, dispositivo.',NULL,'https://www.youtube.com/watch?v=kNnf4b0L4hU',7,'Papá - Comunicación sobre métodos anticonceptivos',2,1),
(27,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"',NULL,'https://www.youtube.com/watch?v=7vmrYKGnUzc',8,'Papá - Cómo usar condón masculino ',2,1),
(28,'TÚ y tu PAPÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"',NULL,'https://www.youtube.com/watch?v=MKlDUrq7xE4',9,'Papá - Cómo usar condón femenino',2,1),
(29,'TÚ y tu PAPÁ cuánto platicar\n\"DÓNDE comprar o personas regalar CONDONES\"',NULL,'https://www.youtube.com/watch?v=Hc2nf--Ix4s',10,'Papá - Dónde comprar o adquirir condones',2,1),
(30,'TÚ y tu PAPÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo o no embarazo\"',NULL,'https://www.youtube.com/watch?v=MBulP3EJc18',11,'Papá - Efectividad del condón para prevenir infecciones y embarazos',2,1),
(31,'TÚ y tu MAMÁ cuánto platicar\n\"bien o mal cuando hay sexo\"',NULL,'https://www.youtube.com/watch?v=plqx2--EHww',12,'Mamá - Ventajas y desventajas de tener relaciones sexuales',2,1),
(32,'TÚ y tu MAMÁ cuánto platicar\n\"tú esperar después para sexo, ahorita NO\"',NULL,'https://www.youtube.com/watch?v=x8wYBxW7XRU',13,'Mamá - posponer encuentro sexual',2,1),
(33,'TÚ y tu MAMÁ cuánto platicar\n\"tú decir SI o NO quiere sexo\"',NULL,'https://www.youtube.com/watch?v=iMnLRojtjDE',14,'Mamá - Tener relaciones sexuales por decisión propia',2,1),
(34,'TÚ y tu MAMÁ cuánto platicar\n\"OTRA PERSONA tocar tuyo cuerpo o quiere sexo a fuerza y TÚ NO quiere sexo, tú decir NO\"',NULL,'https://www.youtube.com/watch?v=yBVRjjtZjEk',15,'Mamá - No permitir el abuso sexual',2,1),
(35,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO cuidar para NO embarazo\"',NULL,'https://www.youtube.com/watch?v=8dO4mSqtyhQ',16,'Mamá - Cómo evitar un embarazo',2,1),
(36,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO pega las infecciones sexo y SIDA\"',NULL,'https://www.youtube.com/watch?v=PI7dNozIpPo',17,'Mamá - Cómo se contraen las ETS',2,1),
(37,'TÚ y tu MAMÁ cuánto platicar\n\"Métodos anticonceptivos\"\nEjemplo: Pastillas para NO embarazo, condón, dispositivo.',NULL,'https://www.youtube.com/watch?v=XZm7GxcgYGA',18,'Mamá - Comunicación sobre métodos anticonceptivos',2,1),
(38,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN HOMBRE\"',NULL,'https://www.youtube.com/watch?v=z4pF8mFt75s',19,'Mamá - Cómo usar condón masculino',2,1),
(39,'TÚ y tu MAMÁ cuánto platicar\n\"CÓMO usar CONDÓN MUJER\"',NULL,'https://www.youtube.com/watch?v=xB7ZW-ZYMIU',20,'Mamá - Cómo usar condón femenino',2,1),
(40,'TÚ y tu MAMÁ cuánto platicar, \n\"DÓNDE comprar o personas regalar CONDONES\"',NULL,'https://www.youtube.com/watch?v=mHDCviFRZqc',21,'Mamá - Dónde comparar o adquirir condones',2,1),
(41,'TÚ y tu MAMÁ cuánto platicar\n\"CONDÓN bueno seguro no pegar infección sexo y no embarazo\"',NULL,'https://www.youtube.com/watch?v=a5RJgLnC0AE',22,'Mamá - Efectividad del condón para prevenir infecciones y embarazos',2,1),
(42,'Tu PAPÁ ayuda para TÚ aprender cosas sexo',NULL,'https://www.youtube.com/watch?v=Tdt2kaJ0Wuc',23,'Papá - Apoyo educación sexual',2,1),
(43,'Tu MAMÁ ayuda para TÚ aprender cosas sexo',NULL,'https://www.youtube.com/watch?v=SL66kXGtSw4',24,'Mamá - Apoyo en educación sexual',2,1),
(44,'Tu PAPÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo',NULL,'https://www.youtube.com/watch?v=U-n4VfPhL6U',25,'Papá - Contribución en Bienestar y Salud',2,1),
(45,'Tu MAMÁ ayuda para TÚ bien, salud y sexo cuidado NO infección sexo, NO embarazo',NULL,'https://www.youtube.com/watch?v=SQNfcurMnZs',26,'Mamá - Contribución en Bienestar y Salud',2,1),
(46,'Tu PAPÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)',NULL,'https://www.youtube.com/watch?v=MJXYE1aFse4',27,'Padre al pendiente de su hijo',2,1),
(47,'Tu MAMÁ cuida, platica, pregunta cosas TU escuela o amigos o novio(a)',NULL,'https://www.youtube.com/watch?v=OiUOC5p9s0E',28,'Madre al pendiente de su hijo',2,1),
(48,'¿TÚ ya antes hay sexo?',NULL,'https://www.youtube.com/watch?v=euml4GrU_5Q',1,'Tener relaciones sexuales',3,1),
(49,'¿TÚ cuántos años cuando PRIMERO sexo?',NULL,'https://www.youtube.com/watch?v=4yCg_0NV59I',2,'Edad primera relación sexual',3,1),
(50,'TÚ cuál persona PRIMERO sexo',NULL,'https://www.youtube.com/watch?v=BqBSbO3TIJc',3,'Primer persona sexo',3,1),
(51,'TÚ PRIMERO relación sexo otra persona A FUERZA y TÚ no gusta o no quiere',NULL,'https://www.youtube.com/watch?v=7leGCbOu8Qk',4,'Primera relación sexual forzada',3,1),
(52,'TÚ piensa dónde, cómo y cuándo PRIMERO relación sexo',NULL,'https://www.youtube.com/watch?v=IPxifKjlCyI',5,'Planeación de la primera relación sexual',3,1),
(53,'TÚ dónde PRIMERO sexo',NULL,'https://www.youtube.com/watch?v=svGUVrq6cms',6,'Lugar de la primera relación sexual',3,1),
(54,'TÚ PRIMERO sexo tú USAR método anticonceptivo\nEjemplo: condón, pastilla no embarazo, dispositivo',NULL,'https://www.youtube.com/watch?v=wGENP7xcvhU',7,'Uso de métodos anticonceptivos en primera relación sexual',3,1),
(55,'TÚ cuál USAR PRIMERO relación sexo',NULL,'https://www.youtube.com/watch?v=h3qTyxHpa1I',8,'Método anticonceptivo usado en primera relación sexual',3,1),
(56,'TÚ cuántas veces tener relaciones sexo hasta ahora ',NULL,'https://www.youtube.com/watch?v=YrGcc50sAvA',9,'Número de relaciones sexuales en toda la vida',3,1),
(57,'TÚ cuántas veces usar condón hasta ahora ',NULL,'https://www.youtube.com/watch?v=YcUp3Phipkc',10,'Número de veces que usó condón en toda la vida',3,1),
(58,'TÚ cuántas veces relaciones sexo últimos 3 meses ',NULL,'https://www.youtube.com/watch?v=zncWppCHhFY',11,'Número relaciones últimos 3 meses',3,1),
(59,'TÚ cuántas veces usar condón últimos 3 meses',NULL,'https://www.youtube.com/watch?v=v3zdDpCB1nU',12,'Número de veces usó condón últimos 3 meses',3,1),
(60,'TÚ cuántas parejas (novio/a, esposo/a, amigo/a) para sexo hasta ahora',NULL,'https://www.youtube.com/watch?v=iLKNgdv0ap0',13,'Número de parejas sexuales en toda la vida',3,1),
(61,'TÚ cuántas veces tener relaciones sexo personas otras NO novio o novia',NULL,'https://www.youtube.com/watch?v=xzVS6ZvS-r4',14,'Número de relaciones sexuales con desconocidos',3,1),
(62,'TÚ tener relaciones sexo otra persona NO novios o novias cuántas veces USAR CONDÓN',NULL,'https://www.youtube.com/watch?v=TqOG9U-tSW4',15,'Número de veces usó condón con personas desconocidas',3,1),
(63,'TÚ después PRIMERO relación sexo de tu primera relación sexual otra persona a fuerza y TÚ NO gusta o NO quiere',NULL,'https://www.youtube.com/watch?v=JhTCv0gzVuY',16,'Relaciones forzadas subsecuentes',3,1),
(64,'TÚ ya antes embarazada o TÚ embarazar tu novia',NULL,'https://www.youtube.com/watch?v=M9qE2UBSz6k',17,'Haber tenido un embarazo',3,1),
(65,'TÚ o tu novia aborto bebé',NULL,'https://www.youtube.com/watch?v=YU1srl4wvf4',18,'Haber tenido un aborto',3,1),
(66,'TÚ antes o ahora hay sexo homosexual (gay, lesbiana)',NULL,'https://www.youtube.com/watch?v=Y4zwIt_gwJM',19,'Relaciones homosexuales',3,1),
(67,'TÚ ya antes o ahora ir laboratorio prueba para ver hay INFECCIÓN sexo',NULL,'https://www.youtube.com/watch?v=t08D1cIMzRM',20,'Hacerse pruebas para ITS',3,1),
(68,'TÚ hay antes o ahora INFECCIÓN sexo',NULL,'https://www.youtube.com/watch?v=_jVI_8itoKk',21,'Haber tenido alguna ITS',3,1),
(69,'PERSONA tocar TU CUERPO (partes íntimas) a fuerza TÚ NO gusta o NO quiere',NULL,'https://www.youtube.com/watch?v=w_URLcM4VMM',22,'Tocar partes íntimas a fuerza',3,1),
(70,'PERSONA dice TÚ tocar tu cuerpo a fuerza, TÚ NO quiere o NO gusta',NULL,'https://www.youtube.com/watch?v=LMgcBWQDyms',23,'Alguien te pide que a fuerza toques tus partes íntimas',3,1),
(71,'PERSONA dice TÚ quitar ropa para ver cuerpo a fuerza, TÚ NO quiere o NO gusta',NULL,'https://www.youtube.com/watch?v=bdQB4U-9Z6E',24,'Alguien te ha forzado a quitarte la ropa para ver tu cuerpo',3,1),
(72,'TÚ y tu novio(a) poner condón al revés y después voltea condón para poner bien',NULL,'https://www.youtube.com/watch?v=F9qaX_z9aUg',1,'Falla 1: ponerse el condón al revés',4,1),
(73,'TÚ y tu novio(a) hay sexo SIN condón y ANTES eyacular (moco blanco hombre) poner condón pene',NULL,'https://www.youtube.com/watch?v=tuJw1Z9Q7HI',2,'Falla 2: ponerse el condón después de penetración',4,1),
(74,'TÚ y tu novio(a) poner condón cuando pene NO erecto (NO duro).',NULL,'https://www.youtube.com/watch?v=lee_Tpcr_nQ',3,'Falla 3: Poner condón cuando pene no está erecto',4,1),
(75,'TÚ antes usar condón ver fecha para NO viejo',NULL,'https://www.youtube.com/watch?v=TLP0uBMdFXY',4,'Falla 4: Revisar fecha caducidad',4,1),
(76,'TÚ y tu novio(a) quitar condón pene DÉBIL, DORMIDO (NO ERECTO)',NULL,'https://www.youtube.com/watch?v=RTujj_tRKuA',5,'Falla 5: Quitar condón cuando pene no está erecto',4,1),
(77,'TÚ y tu novio(a) poner condón pene deja  aire punta',NULL,'https://www.youtube.com/watch?v=xxv-H6Dy2Mk',6,'Falla 6: poner condón dejando aire en la punta',4,1),
(78,'TÚ y tu novio(a) rompe condón cuando hay sexo',NULL,'https://www.youtube.com/watch?v=2grUyHDnbr0',7,'Ruptura del condón',4,1),
(79,'TÚ y tu novio(a) hay sexo condón adentro vagina, pene no tiene condón',NULL,'https://www.youtube.com/watch?v=1JCGPIAPddk',8,'Deslizamiento del condón',4,1),
(80,'TÚ piensa cuando CONDÓN calor sol, guardar pantalón o cartera (dinero) ya no sirve',NULL,'https://www.youtube.com/watch?v=OjxgkU4BtMc',1,'Conocimientos uso condón 1. Exponer condones al calor.',5,1),
(81,'CONDÓN cuya fecha de caducidad vence en año puede usarse sin riesgo de que se rompa',NULL,'https://www.youtube.com/watch?v=aHKr_HxnCz8',2,'Conocimiento uso condón 2. Condón que está por vencer su caducidad en un año',5,1),
(82,'Antes abrir bolsa dentro condón TÚ baja condón con dedos, después abrir para no romper condón',NULL,'https://www.youtube.com/watch?v=TyTkY6cspgM',3,'Conocimiento uso condón 3. Recorrer el condón para evitar que se dañe',5,1),
(83,'Los lubricantes a base de agua deben usarse sólo con condones de látex',NULL,'https://www.youtube.com/watch?v=5DEKJT3IVfA',4,'Conocimiento uso condón 4. Lubricantes a base de agua y condones de látex',5,1),
(84,'Cuando se coloca un condón en el pene NO dejar aire punta',NULL,'https://www.youtube.com/watch?v=Ac9jy06kdJk',5,'Conocimiento uso condón 5. No dejar espacio en la punta del condón',5,1),
(85,'Es necesario colocar el condón hasta la base del pene porque si no se desliza durante el acto sexual',NULL,'https://www.youtube.com/watch?v=QvFgYhlYUyE',6,'Conocimiento uso condón 6. Poner condón hasta la base del pene',5,1),
(86,'Infeccion VIH hay diarrea, calentura, sudar noche y pierde peso (flaco)',NULL,'https://www.youtube.com/watch?v=nODMauQK3d8',7,'Conocimiento ETS 1. Síntomas VIH',5,1),
(87,'VIH pega usar jeringas desechables y esterilizadas',NULL,'https://www.youtube.com/watch?v=YfDLvD-OPic',8,'Conocimiento ETS 2. Transmisión VIH por jeringas desechables',5,1),
(88,'Tener relaciones sexuales con la misma pareja sana disminuye el riesgo de infectarse con VIH',NULL,'https://www.youtube.com/watch?v=in57smE3u7s',9,'Conocimiento ETS 3. Relaciones sexuales con la misma pareja',5,1),
(89,'Gonorrea, Clamidia y Tricomoniasis INFECCIONES SEXO no puede curar doctor',NULL,'https://www.youtube.com/watch?v=WeOcCA-ekuc',10,'Conocimiento ETS 4. ETS que no pueden curarse con tratamiento médico',5,1),
(90,'Métodos anticonceptivos, PASTILLAS PARA NO BEBÉ ayuda para NO INFECCIONES SEXO',NULL,'https://www.youtube.com/watch?v=1RRLXThABBA',11,'Conocimiento ETS 5. Métodos anticonceptivos orales y enfermedades de transmisión sexual',5,1),
(91,'Tener relaciones sexuales sin penetración evita contraer algunas infecciones de transmisión sexual',NULL,'https://www.youtube.com/watch?v=xATcNyxK6ew',12,'Conocimientos ETS 6. Relaciones sexuales sin penetración',5,1),
(92,'Mujer hay INFECCIÓN SEXO puede aborto bebé o bebé nace antes. Hombre o mujer NO PUEDE HIJOS después',NULL,'https://www.youtube.com/watch?v=ovNTpiFD9XQ',13,'Conocimiento ETS 7. Infecciones de transmisión sexual provocan abortos, partos prematuros',5,1),
(93,'Virus del papiloma humano puede CÁNCER',NULL,'https://www.youtube.com/watch?v=wIBauZx4seM',14,'Conocimientos ETS 8. Virus papiloma humano provoca cáncer',5,1);


INSERT
	INTO `pantalla_de_instruccion`
VALUES
	(1,'Instrucciones',NULL,'https://youtu.be/8CRP0rqJyPM',1,1,1,'Instrucciones de llenado')

INSERT INTO `inciso` VALUES
(2,'Hipoacúsico','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 2.jpg',1,1,1,NULL,1),
(3,'Sordo','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 3.jpg',2,1,2,NULL,1),
(4,'Hombre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 4.jpg',1,3,1,NULL,1),
(5,'Mujer','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 5.jpg',2,3,2,NULL,1),
(6,'Soltero','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 6.jpg',1,5,1,NULL,1),
(7,'Casado','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 7.jpg',2,5,2,NULL,1),
(8,'Unión Libre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 8.jpg',3,5,3,NULL,1),
(9,'Otro','',4,5,4,NULL,1),
(10,'No tiene escuela','',1,6,1,NULL,1),
(11,'Aprender oficio','',2,6,2,NULL,1),
(12,'Primaria','',3,6,3,NULL,1),
(13,'Secundario o Carrera Técnica','',4,6,4,NULL,1),
(14,'Preparatoria','',5,6,5,NULL,1),
(15,'Universidad','',6,6,6,NULL,1),
(16,'Sí','',1,7,1,NULL,1),
(17,'No','',2,7,2,NULL,1),
(18,'Visual','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 18.jpg',1,8,1,NULL,1),
(19,'Auditiva','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 19.jpg',2,8,2,NULL,1),
(20,'Motriz','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 20.jpg',3,8,3,NULL,1),
(21,'Otra','',4,8,4,NULL,1),
(22,'NO tiene discapacidad','',5,8,5,NULL,1),
(23,'Sí','',1,9,1,NULL,1),
(24,'No','',2,9,2,NULL,1),
(25,'Visual','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 25.jpg',1,10,1,NULL,1),
(26,'Auditiva','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 26.jpg',2,10,2,NULL,1),
(27,'Motriz','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 27.jpg',3,10,3,NULL,1),
(28,'Otra','',4,10,4,NULL,1),
(29,'NO tiene discapacidad','',5,10,5,NULL,1),
(30,'Juntos','',1,11,1,NULL,1),
(31,'Separados','',2,11,2,NULL,1),
(32,'No hay estudios','',1,14,1,NULL,1),
(33,'Aprender oficio','',2,14,2,NULL,1),
(34,'Primaria','',3,14,3,NULL,1),
(35,'Secundario o Carrera Técnica','',4,14,4,NULL,1),
(36,'Preparatoria','',5,14,5,NULL,1),
(37,'Universidad','',6,14,6,NULL,1),
(38,'No hay estudios','',1,15,1,NULL,1),
(39,'Aprender oficio','',2,15,2,NULL,1),
(40,'Primaria','',3,15,3,NULL,1),
(41,'Secundario o Carrera Técnica','',4,15,4,NULL,1),
(42,'Preparatoria','',5,15,5,NULL,1),
(43,'Universidad','',6,15,6,NULL,1),
(44,'Casa papá y mamá','',1,16,1,NULL,1),
(45,'Casa mamá','',2,16,2,NULL,1),
(46,'Casa papá','',3,16,3,NULL,1),
(47,'Casa otra persona mi familia','',4,16,4,NULL,1),
(48,'Internado - Casa gobierno','',5,16,5,NULL,1),
(49,'Casa yo dueño','',6,16,6,NULL,1),
(50,'Sí','',1,17,1,NULL,1),
(51,'No','',2,17,2,NULL,1),
(52,'Sí','',1,18,1,NULL,1),
(53,'No','',2,18,2,NULL,1),
(54,'Sí','',1,19,1,NULL,1),
(55,'No','',2,19,2,NULL,1),
(56,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 56.jpg',1,20,1,NULL,1),
(57,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 57.jpg',2,20,2,NULL,1),
(58,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 58.jpg',3,20,3,NULL,1),
(59,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 59.jpg',4,20,4,NULL,1),
(60,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 60.jpg',5,20,5,NULL,1),
(61,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 61.jpg',1,21,1,NULL,1),
(62,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 62.jpg',2,21,2,NULL,1),
(63,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 63.jpg',3,21,3,NULL,1),
(64,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 64.jpg',4,21,4,NULL,1),
(65,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 65.jpg',5,21,5,NULL,1),
(66,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 66.jpg',1,22,1,NULL,1),
(67,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 67.jpg',2,22,2,NULL,1),
(68,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 68.jpg',3,22,3,NULL,1),
(69,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 69.jpg',4,22,4,NULL,1),
(70,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 70.jpg',5,22,5,NULL,1),
(71,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 71.jpg',1,23,1,NULL,1),
(72,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 72.jpg',2,23,2,NULL,1),
(73,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 73.jpg',3,23,3,NULL,1),
(74,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 74.jpg',4,23,4,NULL,1),
(75,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 75.jpg',5,23,5,NULL,1),
(76,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 76.jpg',1,24,1,NULL,1),
(77,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 77.jpg',2,24,2,NULL,1),
(78,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 78.jpg',3,24,3,NULL,1),
(79,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 79.jpg',4,24,4,NULL,1),
(80,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 80.jpg',5,24,5,NULL,1),
(81,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 81.jpg',1,25,1,NULL,1),
(82,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 82.jpg',2,25,2,NULL,1),
(83,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 83.jpg',3,25,3,NULL,1),
(84,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 84.jpg',4,25,4,NULL,1),
(85,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 85.jpg',5,25,5,NULL,1),
(86,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 86.jpg',1,26,1,NULL,1),
(87,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 87.jpg',2,26,2,NULL,1),
(88,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 88.jpg',3,26,3,NULL,1),
(89,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 89.jpg',4,26,4,NULL,1),
(90,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 90.jpg',5,26,5,NULL,1),
(91,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 91.jpg',1,27,1,NULL,1),
(92,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 92.jpg',2,27,2,NULL,1),
(93,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 93.jpg',3,27,3,NULL,1),
(94,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 94.jpg',4,27,4,NULL,1),
(95,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 95.jpg',5,27,5,NULL,1),
(96,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 96.jpg',1,28,1,NULL,1),
(97,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 97.jpg',2,28,2,NULL,1),
(98,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 98.jpg',3,28,3,NULL,1),
(99,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 99.jpg',4,28,4,NULL,1),
(100,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 100.jpg',5,28,5,NULL,1),
(101,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 101.jpg',1,29,1,NULL,1),
(102,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 102.jpg',2,29,2,NULL,1),
(103,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 103.jpg',3,29,3,NULL,1),
(104,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 104.jpg',4,29,4,NULL,1),
(105,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 105.jpg',5,29,5,NULL,1),
(106,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 106.jpg',1,30,1,NULL,1),
(107,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 107.jpg',2,30,2,NULL,1),
(108,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 108.jpg',3,30,3,NULL,1),
(109,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 109.jpg',4,30,4,NULL,1),
(110,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 110.jpg',5,30,5,NULL,1),
(111,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 111.jpg',1,31,1,NULL,1),
(112,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 112.jpg',2,31,2,NULL,1),
(113,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 113.jpg',3,31,3,NULL,1),
(114,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 114.jpg',4,31,4,NULL,1),
(115,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 115.jpg',5,31,5,NULL,1),
(116,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 116.jpg',1,32,1,NULL,1),
(117,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 117.jpg',2,32,2,NULL,1),
(118,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 118.jpg',3,32,3,NULL,1),
(119,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 119.jpg',4,32,4,NULL,1),
(120,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 120.jpg',5,32,5,NULL,1),
(121,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 121.jpg',1,33,1,NULL,1),
(122,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 122.jpg',2,33,2,NULL,1),
(123,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 123.jpg',3,33,3,NULL,1),
(124,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 124.jpg',4,33,4,NULL,1),
(125,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 125.jpg',5,33,5,NULL,1),
(126,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 126.jpg',1,34,1,NULL,1),
(127,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 127.jpg',2,34,2,NULL,1),
(128,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 128.jpg',3,34,3,NULL,1),
(129,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 129.jpg',4,34,4,NULL,1),
(130,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 130.jpg',5,34,5,NULL,1),
(131,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 131.jpg',1,35,1,NULL,1),
(132,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 132.jpg',2,35,2,NULL,1),
(133,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 133.jpg',3,35,3,NULL,1),
(134,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 134.jpg',4,35,4,NULL,1),
(135,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 135.jpg',5,35,5,NULL,1),
(136,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 136.jpg',1,36,1,NULL,1),
(137,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 137.jpg',2,36,2,NULL,1),
(138,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 138.jpg',3,36,3,NULL,1),
(139,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 139.jpg',4,36,4,NULL,1),
(140,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 140.jpg',5,36,5,NULL,1),
(141,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 141.jpg',1,37,1,NULL,1),
(142,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 142.jpg',2,37,2,NULL,1),
(143,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 143.jpg',3,37,3,NULL,1),
(144,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 144.jpg',4,37,4,NULL,1),
(145,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 145.jpg',5,37,5,NULL,1),
(146,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 146.jpg',1,38,1,NULL,1),
(147,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 147.jpg',2,38,2,NULL,1),
(148,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 148.jpg',3,38,3,NULL,1),
(149,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 149.jpg',4,38,4,NULL,1),
(150,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 150.jpg',5,38,5,NULL,1),
(151,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 151.jpg',1,39,1,NULL,1),
(152,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 152.jpg',2,39,2,NULL,1),
(153,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 153.jpg',3,39,3,NULL,1),
(154,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 154.jpg',4,39,4,NULL,1),
(155,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 155.jpg',5,39,5,NULL,1),
(156,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 156.jpg',1,40,1,NULL,1),
(157,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 157.jpg',2,40,2,NULL,1),
(158,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 158.jpg',3,40,3,NULL,1),
(159,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 159.jpg',4,40,4,NULL,1),
(160,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 160.jpg',5,40,5,NULL,1),
(161,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 161.jpg',1,41,1,NULL,1),
(162,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 162.jpg',2,41,2,NULL,1),
(163,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 163.jpg',3,41,3,NULL,1),
(164,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 164.jpg',4,41,4,NULL,1),
(165,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 165.jpg',5,41,5,NULL,1),
(166,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 166.jpg',1,42,1,NULL,1),
(167,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 167.jpg',2,42,2,NULL,1),
(168,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 168.jpg',3,42,3,NULL,1),
(169,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 169.jpg',4,42,4,NULL,1),
(170,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 170.jpg',5,42,5,NULL,1),
(171,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 171.jpg',1,43,1,NULL,1),
(172,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 172.jpg',2,43,2,NULL,1),
(173,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 173.jpg',3,43,3,NULL,1),
(174,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 174.jpg',4,43,4,NULL,1),
(175,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 175.jpg',5,43,5,NULL,1),
(176,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 176.jpg',1,44,1,NULL,1),
(177,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 177.jpg',2,44,2,NULL,1),
(178,'A veces ','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 178.jpg',3,44,3,NULL,1),
(179,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 179.jpg',4,44,4,NULL,1),
(180,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 180.jpg',5,44,5,NULL,1),
(181,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 181.jpg',1,45,1,NULL,1),
(182,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 182.jpg',2,45,2,NULL,1),
(183,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 183.jpg',3,45,3,NULL,1),
(184,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 184.jpg',4,45,4,NULL,1),
(185,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 185.jpg',5,45,5,NULL,1),
(186,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 186.jpg',1,46,1,NULL,1),
(187,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 187.jpg',2,46,2,NULL,1),
(188,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 188.jpg',3,46,3,NULL,1),
(189,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 189.jpg',4,46,4,NULL,1),
(190,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 190.jpg',5,46,5,NULL,1),
(191,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 191.jpg',1,47,1,NULL,1),
(192,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 192.jpg',2,47,2,NULL,1),
(193,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 193.jpg',3,47,3,NULL,1),
(194,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 194.jpg',4,47,4,NULL,1),
(195,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 195.jpg',5,47,5,NULL,1),
(196,'Sí','',1,48,1,NULL,1),(197,'No','',2,48,2,4,1),
(198,'Novio o novia','',1,50,1,NULL,1),
(199,'Amigo o amiga','',2,50,2,NULL,1),
(200,'Un familiar','',3,50,3,NULL,1),
(201,'Alguien desconocido','',4,50,4,NULL,1),
(202,'Otro','',5,50,5,NULL,1),
(203,'Sí','',1,51,1,NULL,1),
(204,'No','',2,51,2,NULL,1),
(205,'Sí','',1,52,1,NULL,1),
(206,'No','',2,52,2,NULL,1),
(207,'Mi casa','',1,53,1,NULL,1),
(208,'Casa amigo o amiga','',2,53,2,NULL,1),
(209,'Casa mi novio o novia','',3,53,3,NULL,1),
(210,'Hotel','',4,53,4,NULL,1),
(211,'Casa familia','',5,53,5,NULL,1),
(212,'Sí','',1,54,1,NULL,1),
(213,'No','',2,54,2,NULL,1),
(214,'Nada','',1,55,1,NULL,1),
(215,'Condón hombre','',2,55,2,NULL,1),
(216,'Pastilas anticonceptivas o del día siguiente ( pastilla para NO bebé)','',3,55,3,NULL,1),
(217,'No eyacular (moco blanco hombre) NO adentro mujer','',4,55,4,NULL,1),
(218,'Sexo ano','',5,55,5,NULL,1),
(219,'Otro','',6,55,6,NULL,1),
(220,'1 (sólo una)','',1,60,1,NULL,1),
(221,'2 (dos)','',2,60,2,NULL,1),
(222,'3 (tres)','',3,60,3,NULL,1),
(223,'4 (cuatro o MÁS)','',4,60,4,NULL,1),
(224,'Sí','',1,63,1,NULL,1),
(225,'No','',2,63,2,NULL,1),
(226,'Sí','',1,64,1,NULL,1),
(227,'No','',2,64,2,NULL,1),
(228,'Sí','',1,65,1,NULL,1),
(229,'No','',2,65,2,NULL,1),
(230,'Sí','',1,66,1,NULL,1),
(231,'No','',2,66,2,NULL,1),
(232,'Sí','',1,67,1,NULL,1),
(233,'No','',2,67,2,NULL,1),
(234,'Sí','',1,68,1,NULL,1),
(235,'No','',2,68,2,NULL,1),
(236,'Sí','',1,69,1,NULL,1),
(237,'No','',2,69,2,NULL,1),
(238,'Sí','',1,70,1,NULL,1),
(239,'No','',2,70,2,NULL,1),
(240,'Sí','',1,71,1,NULL,1),
(241,'No','',2,71,2,NULL,1),
(242,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 242.jpg',1,72,1,NULL,1),
(243,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 243.jpg',2,72,2,NULL,1),
(244,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 244.jpg',3,72,3,NULL,1),
(245,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 245.jpg',4,72,4,NULL,1),
(246,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 246.jpg',5,72,5,NULL,1),
(247,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 247.jpg',1,73,1,NULL,1),
(248,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 248.jpg',2,73,2,NULL,1),
(249,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 249.jpg',3,73,3,NULL,1),
(250,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 250.jpg',4,73,4,NULL,1),
(251,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 251.jpg',5,73,5,NULL,1),
(252,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 252.jpg',1,74,1,NULL,1),
(253,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 253.jpg',2,74,2,NULL,1),
(254,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 254.jpg',3,74,3,NULL,1),
(255,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 255.jpg',4,74,4,NULL,1),
(256,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 256.jpg',5,74,5,NULL,1),
(257,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 257.jpg',1,75,1,NULL,1),
(258,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 258.jpg',2,75,2,NULL,1),
(259,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 259.jpg',3,75,3,NULL,1),
(260,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 260.jpg',4,75,4,NULL,1),
(261,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 261.jpg',5,75,5,NULL,1),
(262,'Nunca / Jamás','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 262.jpg',1,76,1,NULL,1),
(263,'Poco','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 263.jpg',2,76,2,NULL,1),
(264,'A veces','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 264.jpg',3,76,3,NULL,1),
(265,'Mucho','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 265.jpg',4,76,4,NULL,1),
(266,'Mucho más / Siempre','http://antares.iztacala.unam.mx/giss/sicud/Imagenes/Inciso 266.jpg',5,76,5,NULL,1),
(267,'Nunca / Jamás','',1,77,1,NULL,1),(268,'Poco','',2,77,2,NULL,1),
(269,'A veces','',3,77,3,NULL,1),(270,'Mucho','',4,77,4,NULL,1),
(271,'Mucho más / Siempre','',5,77,5,NULL,1),
(272,'Nunca / Jamás','',1,78,1,NULL,1),
(273,'Poco','',2,78,2,NULL,1),
(274,'A veces','',3,78,3,NULL,1),
(275,'Mucho','',4,78,4,NULL,1),
(276,'Mucho más / Siempre','',5,78,5,NULL,1),
(277,'Nunca / Jamás','',1,79,1,NULL,1),
(278,'Poco','',2,79,2,NULL,1),
(279,'A veces','',3,79,3,NULL,1),
(280,'Mucho','',4,79,4,NULL,1),
(281,'Mucho más / Siempre','',5,79,5,NULL,1),
(282,'Verdadero','',1,80,1,NULL,1),
(283,'Falso','',2,80,2,NULL,1),
(284,'No sé','',3,80,3,NULL,1),
(285,'Verdadero','',1,81,1,NULL,1),
(286,'Falso','',2,81,2,NULL,1),
(287,'No sé','',3,81,3,NULL,1),
(288,'Verdadero','',1,82,1,NULL,1),
(289,'Falso','',2,82,2,NULL,1),
(290,'No sé','',3,82,3,NULL,1),
(291,'Verdadero','',1,83,1,NULL,1),
(292,'Falso','',2,83,2,NULL,1),
(293,'No sé','',3,83,3,NULL,1),
(294,'Verdadero','',1,84,1,NULL,1),
(295,'Falso','',2,84,2,NULL,1),
(296,'No sé','',3,84,3,NULL,1),
(297,'Verdadero','',1,85,1,NULL,1),
(298,'Falso','',2,85,2,NULL,1),
(299,'No sé','',3,85,3,NULL,1),
(300,'Verdadero','',1,86,1,NULL,1),
(301,'Falso','',2,86,2,NULL,1),
(302,'No sé','',3,86,3,NULL,1),
(303,'Verdadero','',1,87,1,NULL,1),
(304,'Falso','',2,87,2,NULL,1),
(305,'No sé','',3,87,3,NULL,1),
(306,'Verdadero','',1,88,1,NULL,1),
(307,'Falso','',2,88,2,NULL,1),
(308,'No sé','',3,88,3,NULL,1),
(309,'Verdadero','',1,89,1,NULL,1),
(310,'Falso','',2,89,2,NULL,1),
(311,'No sé','',3,89,3,NULL,1),
(312,'Verdadero','',1,90,1,NULL,1),
(313,'Falso','',2,90,2,NULL,1),
(314,'No sé','',3,90,3,NULL,1),
(315,'Verdadero','',1,91,1,NULL,1),
(316,'Falso','',2,91,2,NULL,1),
(317,'No sé','',3,91,3,NULL,1),
(318,'Verdadero','',1,92,1,NULL,1),
(319,'Falso','',2,92,2,NULL,1),
(320,'No sé','',3,92,3,NULL,1),
(321,'Verdadero','',1,93,1,NULL,1),
(322,'Falso','',2,93,2,NULL,1),
(323,'No sé','',3,93,3,NULL,1);

INSERT INTO `usuario` (id_usuario,id_persona,name_login,password,estatus,tipo,id_rol,ultima_pregunta_contestada_id)
VALUES
(1,1,'susana','susana',1,1,2,NULL),
(2,2,'bety','bety',1,1,2,NULL),
(3,3,'yuma','yuma',1,1,2,NULL),
(4,4,'jorge','jorge',1,1,3,NULL),
(5,5,'diana','diana',1,1,3,NULL),
(6,NULL,'ejemplo','ejemplo',1,1,1,NULL);

CREATE USER 'giss'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON giss.* TO 'giss'@'localhost';
FLUSH PRIVILEGES;

DELETE FROM usuario where id_usuario>6;
DELETE FROM persona where id_persona>6;
DELETE FROM direccion where id_direccion>6;


SELECT *
	FROM
		entidad_federativa

TRUNCATE entidad_federativa

SELECT *
	FROM
		direccion

SELECT *
	FROM
		persona

SELECT *
	FROM
		usuario

SELECT *
	FROM
		permiso

SELECT *
	FROM
		rol

SELECT *
	FROM
		rol_permiso

SELECT *
	FROM
		seccion

SELECT *
	FROM
		pregunta

SELECT *
	FROM
		pantalla_de_instruccion

SELECT *
	FROM inciso


select * from pregunta
update pregunta set ruta_video = concat('./videos/Pregunta',id_pregunta,'.mp4') where id_pregunta > 0

select * from seccion
update seccion set ruta_video = concat('./videos/Seccion',id_seccion,'.mp4') where id_seccion > 0

select * from inciso
update inciso set ruta_imagen = concat('./imagen/Inciso',id_inciso,'.jpg') where id_inciso > 0


select i.codificacion from usuario_respuesta ur, inciso i where ur.id_inciso = i.id_inciso and id_usuario =9