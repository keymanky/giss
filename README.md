# Sistema de Cuestionarios. Utilizando php (api rest full), angular js (frontend) y mysql (data)

Sistema de cuestionarios con el cual los usuarios pueden contestar de acuerdo a la configuración del cuestionario. 

# Características del sistema
1) CRUD del cuestionario, secciones, pantallas de instrucciones,  preguntas y opciones de respuesta, reacomodo y reasignación.
2) Engine del cuestionario (paginación por pregunta) que muestra el elemento siguiente de acuerdo a la configuración y las respuestas del usuario.
3) Administración de usuarios, contraseñas y folios.


# Algunos aspectos de la configuración incluyen:
Las preguntas pueden contener  de 2 tipos, libres (esperan un valor de usuario) o de opción múltiple
Los cuestionarios, pantalla de instrucciones y secciones contienen ademas de las descripción una imagen o video.
Las opciones de respuesta contienen ademas de la descripción una imagen.
Las opciones de respuesta se pueden configurar para brincar las preguntas siguientes de la misma sección.
El cuestionario tiene 3 usuarios: Administrador: Encargado de dar de alto usuario y roles. Admnistrativo: Encargado de dar mantenimiento a los catalogos y usuario que contesta el cuestionario.

# Organización del proyecto
api : contiene los servicios que explotan la base de datos
public: Contiene los elementos html
other: Respaldo de colecciones en postman de la api y respaldo de la base de datos

# Configuración del entorno
Intalar los módulos de php y mysql 'apt-get install libapache2-mod-php5 php5-mcrypt' y 'apt-get install php5-mysql'.
Activar el rewrite de apache 'a2enmod rewrite' 
Permitir el listado de archivos en el archivo 'apache2.conf'

'<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>'

En caso de ser necesario especificar el socket en el archivo php.ini, el socket que se puede localizar con el comando desde consola de mysql 'show variables like %socket%' 
Reiniciar el servidor apache