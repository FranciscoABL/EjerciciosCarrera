//Ejemplo De Curso De Crud con Php y Mysql -- https://www.youtube.com/watch?v=ZN_iBnos3dE&ab_channel=Inform%C3%A1ticaDP
//Barraza Lugo
<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();
$data=null;
$_POST = json_decode(file_get_contents("php://input"), true);

function permisos() {  
  if (isset($_SERVER['HTTP_ORIGIN'])){
      header("Access-Control-Allow-Origin: *");
      header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
      header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
      header('Access-Control-Allow-Credentials: true');      
  }  
  if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS'){
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))          
        header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
    exit(0);
  }
}
permisos();


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$promedio = (isset($_POST['promedio'])) ? $_POST['promedio'] : '';
$edad = (isset($_POST['edad'])) ? $_POST['edad'] : '';

switch($opcion){
	case 1:
        $consulta = "SELECT id, nombre, promedio, edad FROM alumnos";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 2:
        $consulta = "INSERT INTO alumnos (nombre, promedio, edad) VALUES('$nombre', '$promedio', '$edad') ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                
        break;
    case 3:
        $consulta = "UPDATE alumnos SET nombre='$nombre', promedio='$promedio', edad='$edad' WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 4:
        $consulta = "DELETE FROM alumnos WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                           
        break;         
    
}
print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;