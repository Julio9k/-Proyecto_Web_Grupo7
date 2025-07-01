
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS licoreria_estacion;
USE licoreria_estacion;

-- Tabla de categorías
CREATE TABLE categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla de productos

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(255),
    categoria_id INT NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    activo TINYINT(1) NOT NULL DEFAULT 1,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Crear tabla de roles
CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

-- Crear tabla de usuarios
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES roles(id)
);
-- Tabla de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    direccion VARCHAR(255)
);

-- Tabla de carritos
CREATE TABLE carritos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estado ENUM('activo', 'comprado') DEFAULT 'activo',
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabla de items del carrito
CREATE TABLE carrito_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    FOREIGN KEY (carrito_id) REFERENCES carritos(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Tabla de ofertas
CREATE TABLE ofertas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    descripcion VARCHAR(255),
    descuento DECIMAL(5,2),
    fecha_inicio DATE,
    fecha_fin DATE,
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Insertar categorías
INSERT INTO categorias (nombre) VALUES
('Vino'),
('Licor'),
('Cerveza'),
('Agua Tónica'),
('Espumante');

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    usuario_id INT, -- el que realizó la venta (puede ser un vendedor)
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE detalle_ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venta_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (venta_id) REFERENCES ventas(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);
-- Insertar usuario administrador


-- Vinos (20)

INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock) VALUES
('Vino Tinto Tabernero Gran Tinto 750ml', 22.50, 'Public/img/vinos/vino_tabernero_gran_tinto.png', 1, 20),
('Vino Tinto Intipalka Syrah 750ml', 39.90, 'Public/img/vinos/vino_intipalka_syrah.png', 1, 15),
('Vino Blanco Intipalka Sauvignon Blanc 750ml', 39.90, 'Public/img/vinos/vino_intipalka_sauv_blanc.png', 1, 18),
('Vino Tinto Concha y Toro Reservado Cabernet Sauvignon 750ml', 29.90, 'Public/img/vinos/vino_concha_cab_sauv.png', 1, 25),
('Vino Blanco Concha y Toro Reservado Sauvignon Blanc 750ml', 29.90, 'Public/img/vinos/vino_concha_sauv_blanc.png', 1, 22),
('Vino Tinto Gato Negro Cabernet Sauvignon 750ml', 23.50, 'Public/img/vinos/vino_gato_negro_cab.png', 1, 30),
('Vino Rosé Barton & Guestier Rosé Anjou 750ml', 55.00, 'Public/img/vinos/vino_barton_rose.png', 1, 10),
('Vino Blanco Frontera Chardonnay 750ml', 19.90, 'Public/img/vinos/vino_frontera_chardonnay.png', 1, 18),
('Vino Tinto Navarro Correas Malbec 750ml', 42.00, 'Public/img/vinos/vino_navarro_malbec.png', 1, 12),
('Vino Tinto Santa Helena Merlot 750ml', 18.90, 'Public/img/vinos/vino_santa_merlot.png', 1, 17),
('Vino Tinto Tacama Don Manuel 750ml', 60.00, 'Public/img/vinos/vino_tacama_don_manuel.png', 1, 8),
('Vino Blanco Tacama Blanco de Blancos 750ml', 35.00, 'Public/img/vinos/vino_tacama_blanco.png', 1, 9),
('Vino Tinto Nieto Senetiner Malbec 750ml', 49.00, 'Public/img/vinos/vino_nieto_malbec.png', 1, 13),
('Vino Tinto Escorihuela Gascón Cabernet Franc 750ml', 78.00, 'Public/img/vinos/vino_escorihuela_franc.png', 1, 6),
('Vino Tinto Trapiche Roble Malbec 750ml', 34.00, 'Public/img/vinos/vino_trapiche_roble.png', 1, 11),
('Vino Tinto Las Moras Cabernet Sauvignon 750ml', 29.00, 'Public/img/vinos/vino_las_moras.png', 1, 14),
('Vino Tinto Finca La Linda Malbec 750ml', 38.00, 'Public/img/vinos/vino_la_linda_malbec.png', 1, 16),
('Vino Blanco Viña Maipo Chardonnay 750ml', 24.00, 'Public/img/vinos/vino_maipo_chardonnay.png', 1, 20),
('Vino Rosado Sunrise Rosé 750ml', 22.50, 'Public/img/vinos/vino_sunrise_rose.png', 1, 15),
('Vino Blanco Gato Negro Sauvignon Blanc 750ml', 23.50, 'Public/img/vinos/vino_gato_sauv.png', 1, 18);

-- Cervezas (15)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock) VALUES
('Cerveza Cusqueña Dorada Botella 620ml', 6.00, 'Public/img/cerveza/cerveza_cusquena_dorada.png', 3, 50),
('Cerveza Pilsen Callao Lata 355ml', 4.00, 'Public/img/cerveza/cerveza_pilsen_lata.png', 3, 45),
('Cerveza Cristal Lata 355ml', 4.00, 'Public/img/cerveza/cerveza_cristal_lata.png', 3, 60),
('Cerveza Corona Extra Botella 355ml', 7.50, 'Public/img/cerveza/cerveza_corona.png', 3, 40),
('Cerveza Heineken Lata 473ml', 7.00, 'Public/img/cerveza/cerveza_heineken.png', 3, 35),
('Cerveza Budweiser Lata 355ml', 6.00, 'Public/img/cerveza/cerveza_budweiser.png', 3, 38),
('Cerveza Tres Cruces Lager 355ml', 5.50, 'Public/img/cerveza/cerveza_tres_cruces.png', 3, 25),
('Cerveza Barbarian Red Ale 330ml', 10.00, 'Public/img/cerveza/cerveza_barbarian_red.png', 3, 20),
('Cerveza Sierra Andina Shaman IPA 330ml', 11.00, 'Public/img/cerveza/cerveza_shaman_ipa.png', 3, 15),
('Cerveza Stella Artois Botella 330ml', 8.00, 'Public/img/cerveza/cerveza_stella.png', 3, 30),
('Cerveza Amstel Ultra Lata 355ml', 6.00, 'Public/img/cerveza/cerveza_amstel_ultra.png', 3, 28),
('Cerveza Cusqueña Negra Botella 620ml', 6.50, 'Public/img/cerveza/cerveza_cusquena_negra.png', 3, 32),
('Cerveza Becks Lata 473ml', 7.00, 'Public/img/cerveza/cerveza_becks.png', 3, 26),
('Cerveza Paulaner Hefe-Weissbier 500ml', 12.00, 'Public/img/cerveza/cerveza_paulaner.png', 3, 12),
('Cerveza Delirium Tremens 330ml', 18.00, 'Public/img/cerveza/cerveza_delirium.png', 3, 8);

-- Agua Tónica (10)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock) VALUES 
('Evervess Agua Tónica 500 ml', 3.50, 'Public/img/agua-tonica/evervess.png', 4, 25),
('Ginger Ale Fanta 355 ml', 4.20, 'Public/img/agua-tonica/ginger_ale.png', 4, 20),
('Nordic Mist Agua Tónica 500 ml', 4.70, 'Public/img/agua-tonica/nordic_mist.png', 4, 18),
('Fentimans Tonic Water 200 ml', 7.80, 'Public/img/agua-tonica/fentimans.png', 4, 10),
('Q Tonic Water 200 ml', 7.00, 'Public/img/agua-tonica/q_tonic.png', 4, 12),
('Indi & Co Tónica 200 ml', 6.80, 'Public/img/agua-tonica/indi_co.png', 4, 14),
('Boylan Tonic Water 355 ml', 6.00, 'Public/img/agua-tonica/boylan.png', 4, 13),
('Whole Earth Tonic 275 ml', 5.50, 'Public/img/agua-tonica/whole_earth.png', 4, 15),
('Thomas Henry Tonic 200 ml', 6.30, 'Public/img/agua-tonica/thomas_henry.png', 4, 9),
('Double Dutch Indian Tonic 200 ml', 6.90, 'Public/img/agua-tonica/double_dutch.png', 4, 11);


-- Espumantes (15)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock) VALUES 
('Freixenet Carta Nevada 750 ml', 49.00, 'Public/img/espumantes/freixenet_nevada.png', 5, 10),
('Martini Asti Espumante 750 ml', 55.00, 'Public/img/espumantes/martini_asti.png', 5, 12),
('Chandon Brut 750 ml', 60.00, 'Public/img/espumantes/chandon_brut.png', 5, 8),
('Juvé & Camps Cinta Púrpura Reserva 750 ml', 89.00, 'Public/img/espumantes/juve_camps.png', 5, 6),
('Codorníu Clásico Brut 750 ml', 45.00, 'Public/img/espumantes/codorniu_clasico.png', 5, 9),
('Riccadonna Asti Espumante 750 ml', 48.00, 'Public/img/espumantes/riccadonna_asti.png', 5, 7),
('Anna de Codorníu Brut 750 ml', 50.00, 'Public/img/espumantes/anna_codorniu.png', 5, 8),
('Valdivieso Brut 750 ml', 52.00, 'Public/img/espumantes/valdivieso.png', 5, 10),
('Bosca Anniversario 750 ml', 42.00, 'Public/img/espumantes/bosca_anniversario.png', 5, 11),
('Don Pascual Espumante Brut 750 ml', 40.00, 'Public/img/espumantes/don_pascual.png', 5, 9),
('Cinzano Asti 750 ml', 53.00, 'Public/img/espumantes/cinzano_asti.png', 5, 10),
('Baron B Extra Brut 750 ml', 70.00, 'Public/img/espumantes/baron_b.png', 5, 5),
('Fiorelli Asti Espumante 750 ml', 46.00, 'Public/img/espumantes/fiorelli.png', 5, 6),
('La Chamiza Espumante Extra Brut 750 ml', 47.00, 'Public/img/espumantes/la_chamiza.png', 5, 7),
('Valmarone Moscato Espumante 750 ml', 44.00, 'Public/img/espumantes/valmarone.png', 5, 8);

-- Licores (20)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id, stock) VALUES 
('Pisco Quebranta Tabernero 750 ml', 49.00, 'Public/img/licores/pisco_quebranta.png', 2, 20),
('Pisco Italia Cuatro Gallos 750 ml', 52.00, 'Public/img/licores/pisco_italia.png', 2, 18),
('Pisco Portón Mosto Verde 750 ml', 80.00, 'Public/img/licores/pisco_porton.png', 2, 10),
('Four Loko Blue Razz 473 ml', 9.50, 'Public/img/licores/four_loko_blue.png', 2, 25),
('Four Loko Sandía 473 ml', 9.50, 'Public/img/licores/four_loko_sandia.png', 2, 22),
('Anís del Mono Dulce 1 Lt', 35.00, 'Public/img/licores/anis_mono.png', 2, 15),
('Ron Cartavio Black 750 ml', 36.00, 'Public/img/licores/cartavio_black.png', 2, 19),
('Ron Abuelo Añejo 750 ml', 55.00, 'Public/img/licores/ron_abuelo.png', 2, 14),
('Ron Flor de Caña 5 años 750 ml', 62.00, 'Public/img/licores/flor_cana.png', 2, 11),
('Whisky Johnnie Walker Red Label 750 ml', 75.00, 'Public/img/licores/johnnie_red.png', 2, 16),
('Whisky Jack Daniel’s 750 ml', 120.00, 'Public/img/licores/jack_daniels.png', 2, 9),
('Vodka Absolut 750 ml', 68.00, 'Public/img/licores/absolut.png', 2, 13),
('Vodka Smirnoff 750 ml', 47.00, 'Public/img/licores/smirnoff.png', 2, 17),
('Tequila José Cuervo Especial 750 ml', 89.00, 'Public/img/licores/jose_cuervo.png', 2, 12),
('Tequila Patrón Silver 750 ml', 220.00, 'Public/img/licores/patron_silver.png', 2, 5),
('Licor Baileys 750 ml', 75.00, 'Public/img/licores/baileys.png', 2, 10),
('Amaretto Disaronno 700 ml', 82.00, 'Public/img/licores/disaronno.png', 2, 8),
('Jägermeister 700 ml', 70.00, 'Public/img/licores/jagermeister.png', 2, 9),
('Furloko Uva 473 ml', 9.50, 'Public/img/licores/furloko_uva.png', 2, 21),
('Furloko Lima Limón 473 ml', 9.50, 'Public/img/licores/furloko_limon.png', 2, 19);
