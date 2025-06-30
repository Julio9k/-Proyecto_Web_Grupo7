<?php
session_start();
$controlador = $_GET['controlador'] ?? 'inicio';
$accion = $_GET['accion'] ?? 'mostrarInicio';


require_once "Controller/" . $controlador . "Controller.php";
// Crear instancia del controlador
$nombreClase = $controlador . "Controller";
$instancia = new $nombreClase();
// Verificar si la acción existe en el controlador
// Ejecutar la acción
if (method_exists($instancia, $accion)) {
    $instancia->$accion();
} else {
    echo "Acción no encontrada.";
}