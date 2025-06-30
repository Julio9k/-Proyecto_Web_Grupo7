<?php
require_once 'database.php';
class cartModel{
     private $pdo;

   public function __construct() {
     $conexionDB = new Database();           
     $this->pdo = $conexionDB->getConnection(); 
    }

    public function crearCarrito() {
        $stmt = $this->pdo->prepare("INSERT INTO carritos (estado) VALUES ('activo')");
        $stmt->execute();
        return $this->pdo->lastInsertId();
    }

    public function agregarProducto($carrito_id, $producto_id, $cantidad) {
        $stmt = $this->pdo->prepare("SELECT id, cantidad FROM carrito_items WHERE carrito_id = ? AND producto_id = ?");
        $stmt->execute([$carrito_id, $producto_id]);
        $item = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($item) {
            $nueva_cantidad = $item['cantidad'] + $cantidad;
            $stmt = $this->pdo->prepare("UPDATE carrito_items SET cantidad = ? WHERE id = ?");
            $stmt->execute([$nueva_cantidad, $item['id']]);
        } else {
            $stmt = $this->pdo->prepare("INSERT INTO carrito_items (carrito_id, producto_id, cantidad) VALUES (?, ?, ?)");
            $stmt->execute([$carrito_id, $producto_id, $cantidad]);
        }
    }

    public function obtenerProductos($carrito_id) {
        $stmt = $this->pdo->prepare("SELECT p.id, p.nombre, p.precio, p.imagen_url, ci.cantidad FROM carrito_items ci JOIN productos p ON ci.producto_id = p.id WHERE ci.carrito_id = ?");
        $stmt->execute([$carrito_id]);
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function contarProductos($carrito_id) {
    if (!$carrito_id) return 0;    
    $stmt = $this->pdo->prepare("SELECT sum(cantidad) as total FROM carrito_items WHERE carrito_id = ?");
    $stmt->execute([$carrito_id]);
    $row = $stmt->fetch(PDO::FETCH_ASSOC);

    return $row && $row['total'] ? (int)$row['total'] : 0;
}
public function actualizarProductos($carrito_id, $cantidades) {
    foreach ($cantidades as $producto_id => $cantidad) {
        $stmt = $this->pdo->prepare("UPDATE carrito_items SET cantidad = ? WHERE carrito_id = ? AND producto_id = ?");
        $stmt->execute([$cantidad, $carrito_id, $producto_id]);
    }
}
    

}