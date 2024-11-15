<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Contacto</title>
    <link rel="stylesheet" href="../asset/estilos.css">
</head>
<body>
    <header>
        <h1>Modificar Contacto</h1>
        <nav>
            <ul>
                <li><a href="contactos.php">Volver a la Lista</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="center-contact-form">
            <?php
            include_once '../modelo/conexion.php';
            include_once '../modelo/contacto.php';

            $db = (new Conexion())->getConexion();
            $contacto = new Contacto($db);

            // Verificar si se pasó el ID del contacto
            if (isset($_GET['idcontacto'])) {
                $contacto->idcontacto = $_GET['idcontacto'];
                $query = "SELECT * FROM contacto WHERE idcontacto = :idcontacto";
                $stmt = $db->prepare($query);
                $stmt->bindParam(':idcontacto', $contacto->idcontacto);
                $stmt->execute();
                $row = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($row) {
                    // Mostrar el formulario con los datos actuales del contacto
                    ?>
                    <form action="../controlador/contactocontroller.php" method="POST">
                        <input type="hidden" name="action" value="modificar">
                        <input type="hidden" name="idcontacto" value="<?php echo $row['idcontacto']; ?>">
                        <input type="text" name="cedula" placeholder="Cédula" value="<?php echo $row['cedula']; ?>" required>
                        <input type="text" name="nombre" placeholder="Nombre" value="<?php echo $row['nombre']; ?>" required>
                        <input type="text" name="apellido" placeholder="Apellido" value="<?php echo $row['apellido']; ?>" required>
                        <input type="text" name="direccion" placeholder="Dirección" value="<?php echo $row['direccion']; ?>" required>
                        <input type="text" name="celular" placeholder="Celular" value="<?php echo $row['celular']; ?>" required>
                        <button type="submit">Modificar</button>
                    </form>
                    <?php
                } else {
                    echo "<p>Contacto no encontrado.</p>";
                }
            } else {
                echo "<p>ID de contacto no especificado.</p>";
            }
            ?>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Mi Aplicativo de Contactos</p>
    </footer>
</body>
</html>
