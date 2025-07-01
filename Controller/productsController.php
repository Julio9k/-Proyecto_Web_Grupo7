<?php

include_once "Model/productsModel.php";

class ProductsController 
{
    private $modelo;

    public function __construct() {
        $this->modelo = new ProductsModel();
    }
    public function mostrarProductosPorCategoria()
    {
        $categoriaId = $_GET['categoriaId'] ?? null;
        // Obtener productos por categoría con límite
        $productos = $this->modelo->obtenerTodosPorCategoria($categoriaId);
        $categoria = $this->modelo->obtenerCategoriaPorId($categoriaId);
        // Incluir la vista para mostrar los productos
        if ($categoriaId == 6) {
            include(__DIR__ . '/../View/'. $categoria['nombre'] . '/index.php');
            return;
        }
            include(__DIR__ . '/../View/product-category/'. $categoria['nombre'] . '/index.php');
    }
}
?>