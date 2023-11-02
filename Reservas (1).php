<?php
	$nombre= $_GET["Nombre"];
    $apellido=$_GET["Apellido"];
    $mail = $_GET["Mail"];
    $celular=$_GET["celular"];
	$numero = $_GET["Numreo"];
    $cantPersonas=$_GET["CantPer"];
    $fecha=$_GET["Fecha"];
    $sucursal=$_GET["Sucursal"];
    $hora=$_GET["Hora"];
    $servername = "127.0.0.1";
    $database = "PiazzaGaucha";
    $username = "alumno"; 
    $password = "alumnoipm";
    
    $conexion = mysqli_connect($servername, $username, $password, $database); // se crea la conexion


    if (!$conexion) {
        die("Conexion fallida: " . mysqli_connect_error());
    }
    else{
        //insertamos el resultado del formulario
        $resultado=mysqli_query($conexion,"insert into Cliente values(NULL,'$nombre','$apellido','$numero', '$mail', '$celular');");
        $resultado = mysqli_query($conexion,"select IdCliente from Cliente where Nombre='$nombre' and mail='$mail';");
        $nombre=mysqli_fetch_assoc($resultado);
        $resultado=mysqli_query($conexion,"insert into Reserva values(NULL,$cantPersonas,$fecha,$sucursal,$hora)";)
    
        
        echo $nombre;
        while($fila=mysqli_fetch_assoc($resultado)){ // recorremos cada fila obtenida y mostramos el nombre y el apellido
            ?>
            <p><?php echo $fila['nombre']. " " .$fila['apellido']?></p>
            <?php
        }
    }
    mysqli_close($conexion);
?>
