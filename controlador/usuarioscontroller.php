<?php
session_start();
include_once '../modelo/conexion.php';
include_once '../modelo/usuario.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $db = (new Conexion())->getConexion();
    $usuario = new Usuario($db);

    $usuario->usuario = $_POST['usuario'];
    $usuario->password = $_POST['password'];

    $resultado = $usuario->validarUsuario();

    if ($resultado) {
        $_SESSION['usuario'] = $resultado['usuario'];
        header("Location: ../vista/index.php");
        exit;
    } else {
        $error = "Usuario o contraseña incorrectos.";
        header("Location: ../vista/login.php?error=" . urlencode($error));
        exit;
    }
}
?>