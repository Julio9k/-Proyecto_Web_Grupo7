<?php

$controlador = $_GET['controlador'] ?? 'producto';
$accion = $_GET['accion'] ?? 'listar';

// Cargar el controlador
require_once "controladores/" . ucfirst($controlador) . "Controlador.php";

// Crear instancia del controlador
$nombreClase = ucfirst($controlador) . "Controlador";
$instancia = new $nombreClase();

// Ejecutar la acción
if (method_exists($instancia, $accion)) {
    $instancia->$accion();
} else {
    echo "Acción no encontrada.";
}
