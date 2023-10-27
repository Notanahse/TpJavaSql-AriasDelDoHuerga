    <?php
	$nombre= $_GET["Nombre"];
    $mail = $_GET["Mail"];
	$queja = $_GET["Queja"];
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
        $resultado=mysqli_query($conexion,"insert into Cliente values(NULL,'$nombre',NULL,NULL, '$mail');");
		$resultado = mysqli_query($conexion,"select IdCliente from Cliente where Nombre='$nombre' and mail='$mail';");
        $nombre=mysqli_fetch_assoc($resultado);
        $resultado=mysqli_query($conexion,"insert into Soporte values(NUll,'$queja',)")

        
        echo $nombre;
        while($fila=mysqli_fetch_assoc($resultado)){ // recorremos cada fila obtenida y mostramos el nombre y el apellido
            ?>
            <p><?php echo $fila['nombre']. " " .$fila['apellido']?></p>
            <?php
        }
    }
    mysqli_close($conexion);
?>
