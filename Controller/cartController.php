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

public function eliminarDelCarrito() {
    $producto_id = $_POST['producto_id'] ?? null;
    $carrito_id = $_SESSION['carrito_id'] ?? null;

    if ($producto_id && $carrito_id) {
        $this->modelo->eliminarProducto($carrito_id, $producto_id);
        echo "ok";
    } else {
        echo "error";
    }
}

    public function mostrarCheckout() {
        // Validar si hay un carrito activo
        if (!isset($_SESSION['carrito_id'])) {
        }

        $carrito_id = $_SESSION['carrito_id'];

        // Obtener los productos del carrito
        $items = $this->modelo->obtenerItemsDelCarrito($carrito_id);

        // Calcular subtotales y total
        $subtotal_general = 0;
            foreach ($items as $i => $item) {
                $items[$i]['subtotal'] = $item['precio'] * $item['cantidad'];
                $subtotal_general += $items[$i]['subtotal'];
            }

        $envio = 15.00;
        $total = $subtotal_general + $envio;
        
        include(__DIR__ . '/../View/checkout/index.php');
    }
public function procesarPedido() {
    if (!isset($_SESSION['carrito_id'])) {
        header("Location: index.php?controlador=cart&accion=mostrarCarrito1");
        exit;
    }

    $carrito_id = $_SESSION['carrito_id'];
    
    $this->modelo->procesarPedido($carrito_id);

     $_SESSION['mensaje_pedido'] = "¡Tu pedido fue realizado con éxito!";
    header("Location: index.php?controlador=inicio&accion=mostrarInicio");
}
    
}
