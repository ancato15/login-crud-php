<?php
class Conexion {
    private $host;
    private $db_name;
    private $username;
    private $password;
    public $conn;

    public function __construct() {
        // Asegurarse de que las variables de entorno están definidas
        $this->host = isset($_ENV["DB_HOST"]) ? $_ENV["DB_HOST"] : 'localhost';
        $this->db_name = isset($_ENV["DB_NAME"]) ? $_ENV["DB_NAME"] : 'agenda';
        $this->username = isset($_ENV["DB_USER"]) ? $_ENV["DB_USER"] : 'root';
        $this->password = isset($_ENV["DB_PASSWORD"]) ? $_ENV["DB_PASSWORD"] : '12345678';
    }
    

    public function getConexion() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host={$this->host};dbname={$this->db_name}", $this->username, $this->password);
            $this->conn->exec("set names utf8");
        } catch (PDOException $exception) {
            echo "Error de conexión: " . $exception->getMessage();
        }

        return $this->conn;
    }
}
?>