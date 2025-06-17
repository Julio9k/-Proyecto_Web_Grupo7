<?php
require_once 'database.php';
class productsModel{
     private $pdo;

   public function __construct() {
     $conexionDB = new Database();           
     $this->pdo = $conexionDB->getConnection(); 
    }


    // Obtener todos los productos
    public function obtenerTodos() {
        $stmt = $this->pdo->query("SELECT * FROM productos");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    // Obtener solo una cantidad limitada de nombres
    public function obtenerNombresLimitados($cantidad) {
        $stmt = $this->pdo->prepare("SELECT nombre FROM productos LIMIT ?");
        $stmt->bindValue(1, $cantidad, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_COLUMN); // Solo devuelve la columna 'nombre'
    }

    // Agregar producto
    public function agregar($nombre, $precio, $imagen_url, $categoria_id, $stock) {
        $sql = "INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock)
                VALUES (?, ?, ?, ?, ?)";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([$nombre, $precio, $imagen_url, $categoria_id, $stock]);
    }

    // Obtener producto por ID
    public function obtenerPorId($id) {
        $stmt = $this->pdo->prepare("SELECT * FROM productos WHERE id = ?");
        $stmt->execute([$id]);
        return $stmt->fetch(PDO::FETCH_ASSOC);
    }

    // Eliminar producto
    public function eliminar($id) {
        $stmt = $this->pdo->prepare("DELETE FROM productos WHERE id = ?");
        return $stmt->execute([$id]);
    }

    // Actualizar producto
    public function actualizar($id, $nombre, $precio, $imagen_url, $categoria_id, $stock) {
        $sql = "UPDATE productos SET nombre = ?, precio = ?, imagen_url = ?, categoria_id = ?, stock = ?
                WHERE id = ?";
        $stmt = $this->pdo->prepare($sql);
        return $stmt->execute([$nombre, $precio, $imagen_url, $categoria_id, $stock, $id]);
    }
    // Obtener productos por categoría con límite
    public function obtenerPorCategoriaConLimite($categoria_id, $limite) {
        $stmt = $this->pdo->prepare("    SELECT p.*, c.nombre AS categoria_nombre 
                FROM productos p
                INNER JOIN categorias c ON p.categoria_id = c.id
                WHERE p.categoria_id = ? AND p.activo = 1  LIMIT ?");
        $stmt->bindValue(1, $categoria_id, PDO::PARAM_INT);
        $stmt->bindValue(2, $limite, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

}
?>