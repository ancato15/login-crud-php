<?php
session_start();
session_unset();
session_destroy();
header("Location: ../vista/login.php");
exit;
?>
