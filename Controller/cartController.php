<?php 
require_once 'Model/cartModel.php';

class CartController
{
    private $modelo;

    public function __construct() {
        $this->modelo = new cartModel();
    }
    public function agregarAlCarrito(){
        if (!isset($_SESSION['carrito_id'])) {
            $carrito_id = $this->modelo->crearCarrito();
            $_SESSION['carrito_id'] = $carrito_id;
        }

        $carrito_id = $_SESSION['carrito_id'];
        $producto_id = $_POST['producto_id'];
        $cantidad = $_POST['cantidad'] ?? 1;

        $this->modelo->agregarProducto($carrito_id, $producto_id, $cantidad);
        
    }

    public function mostrar() {
        $carrito_id = $_SESSION['carrito_id'] ?? null;
        $items = $this->modelo->obtenerProductos($carrito_id);
        include 'View/cart/index.php';
    }
    public function obtenerCantidadProductos() {
    // Si no hay carrito aún, devuelve 0
    if (!isset($_SESSION['carrito_id'])) {
        echo 0;
        return;
    }

    $carrito_id = $_SESSION['carrito_id'];
    $cantidad = $this->modelo->contarProductos($carrito_id);

    // Devuelve el número de productos (solo el número)
    echo $cantidad;
}
public function actualizarCarrito() {
    $cantidades = $_POST['cantidades'] ?? [];
    $carrito_id = $_SESSION['carrito_id'] ?? null;

    if ($carrito_id) {
        $this->modelo->actualizarProductos($carrito_id, $cantidades);
    }

    echo "ok";
}
}