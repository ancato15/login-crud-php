<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Eliminar Contacto</title>
    <link rel="stylesheet" href="../asset/estilos.css">
</head>
<body>
    <header>
        <h1>Eliminar Contacto</h1>
        <nav>
            <ul>
                <li><a href="index.php">Volver a la Lista</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <form action="../controlador/contactocontroller.php" method="POST">
            <input type="hidden" name="action" value="eliminar">
            <input type="text" name="idcontacto" placeholder="ID del Contacto a Eliminar" required>
            <button type="submit">Eliminar</button>
        </form>
    </main>

    <footer>
        <p>&copy; 2024 Mi Aplicativo de Contactos</p>
    </footer>
</body>
</html>
