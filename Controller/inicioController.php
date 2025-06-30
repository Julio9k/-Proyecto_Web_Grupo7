<?php
include_once "Model/productsModel.php";
class InicioController 
{
    private $modelo;

    public function __construct() {
        $this->modelo = new ProductsModel();
    }

    public function mostrarInicio()
    {
        // Obtener todos los productos
        $vino = $this->modelo->obtenerPorCategoriaConLimite(1, 10);
        $licor = $this->modelo->obtenerPorCategoriaConLimite(2, 10);
        $cerveza = $this->modelo->obtenerPorCategoriaConLimite(3, 10);
        $agua_tonica = $this->modelo->obtenerPorCategoriaConLimite(4, 10);
        $espumante = $this->modelo->obtenerPorCategoriaConLimite(5, 10);

        include(__DIR__ . '/../View/index.php');

    }
}
?>