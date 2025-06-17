<?php

class Database
{
    private $host = "localhost:3309";
    private $db_name = "licoreria_estacion";
    private $username = "root";
    private $password = "";
    private $pdo;

    public function getConnection()
    {
        $this->pdo = null;

        try {
            $cadena = "mysql:host=" . $this->host . ";dbname=" . $this->db_name . ";charset=utf8mb4";
            $this->pdo = new PDO($cadena, $this->username, $this->password);
            $this->pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            
            echo "Error de conexión: " . $e->getMessage();
        }

        return $this->pdo;
    }
}
?>