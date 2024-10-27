<?php
class Conexion {
    private $host = 'localhost';
    private $db_name = 'agenda';
    private $username = 'root';
    private $password = '12345678';
    public $conn;

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