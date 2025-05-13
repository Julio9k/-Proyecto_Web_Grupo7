
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
    nombre VARCHAR(255) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    imagen_url VARCHAR(255),
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

-- Tabla de usuarios (administradores o clientes con login)
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    es_admin BOOLEAN DEFAULT FALSE
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

-- Insertar usuario administrador
INSERT INTO usuarios (nombre, correo, contrasena, es_admin) VALUES
('Admin', 'admin@licoreria.pe', 'admin123', TRUE);

-- Vinos (20)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id) VALUES
('Vino Tinto Tabernero Gran Tinto 750ml', 22.50, 'img/vino_tabernero_gran_tinto.png', 1),
('Vino Tinto Intipalka Syrah 750ml', 39.90, 'img/vino_intipalka_syrah.png', 1),
('Vino Blanco Intipalka Sauvignon Blanc 750ml', 39.90, 'img/vino_intipalka_sauv_blanc.png', 1),
('Vino Tinto Concha y Toro Reservado Cabernet Sauvignon 750ml', 29.90, 'img/vino_concha_cab_sauv.png', 1),
('Vino Blanco Concha y Toro Reservado Sauvignon Blanc 750ml', 29.90, 'img/vino_concha_sauv_blanc.png', 1),
('Vino Tinto Gato Negro Cabernet Sauvignon 750ml', 23.50, 'img/vino_gato_negro_cab.png', 1),
('Vino Rosé Barton & Guestier Rosé Anjou 750ml', 55.00, 'img/vino_barton_rose.png', 1),
('Vino Blanco Frontera Chardonnay 750ml', 19.90, 'img/vino_frontera_chardonnay.png', 1),
('Vino Tinto Navarro Correas Malbec 750ml', 42.00, 'img/vino_navarro_malbec.png', 1),
('Vino Tinto Santa Helena Merlot 750ml', 18.90, 'img/vino_santa_merlot.png', 1),
('Vino Tinto Tacama Don Manuel 750ml', 60.00, 'img/vino_tacama_don_manuel.png', 1),
('Vino Blanco Tacama Blanco de Blancos 750ml', 35.00, 'img/vino_tacama_blanco.png', 1),
('Vino Tinto Nieto Senetiner Malbec 750ml', 49.00, 'img/vino_nieto_malbec.png', 1),
('Vino Tinto Escorihuela Gascón Cabernet Franc 750ml', 78.00, 'img/vino_escorihuela_franc.png', 1),
('Vino Tinto Trapiche Roble Malbec 750ml', 34.00, 'img/vino_trapiche_roble.png', 1),
('Vino Tinto Las Moras Cabernet Sauvignon 750ml', 29.00, 'img/vino_las_moras.png', 1),
('Vino Tinto Finca La Linda Malbec 750ml', 38.00, 'img/vino_la_linda_malbec.png', 1),
('Vino Blanco Viña Maipo Chardonnay 750ml', 24.00, 'img/vino_maipo_chardonnay.png', 1),
('Vino Rosado Sunrise Rosé 750ml', 22.50, 'img/vino_sunrise_rose.png', 1),
('Vino Blanco Gato Negro Sauvignon Blanc 750ml', 23.50, 'img/vino_gato_sauv.png', 1);
-- Cervezas (15)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id) VALUES
('Cerveza Cusqueña Dorada Botella 620ml', 6.00, 'img/cerveza_cusquena_dorada.png', 3),
('Cerveza Pilsen Callao Lata 355ml', 4.00, 'img/cerveza_pilsen_lata.png', 3),
('Cerveza Cristal Lata 355ml', 4.00, 'img/cerveza_cristal_lata.png', 3),
('Cerveza Corona Extra Botella 355ml', 7.50, 'img/cerveza_corona.png', 3),
('Cerveza Heineken Lata 473ml', 7.00, 'img/cerveza_heineken.png', 3),
('Cerveza Budweiser Lata 355ml', 6.00, 'img/cerveza_budweiser.png', 3),
('Cerveza Tres Cruces Lager 355ml', 5.50, 'img/cerveza_tres_cruces.png', 3),
('Cerveza Barbarian Red Ale 330ml', 10.00, 'img/cerveza_barbarian_red.png', 3),
('Cerveza Sierra Andina Shaman IPA 330ml', 11.00, 'img/cerveza_shaman_ipa.png', 3),
('Cerveza Stella Artois Botella 330ml', 8.00, 'img/cerveza_stella.png', 3),
('Cerveza Amstel Ultra Lata 355ml', 6.00, 'img/cerveza_amstel_ultra.png', 3),
('Cerveza Cusqueña Negra Botella 620ml', 6.50, 'img/cerveza_cusquena_negra.png', 3),
('Cerveza Becks Lata 473ml', 7.00, 'img/cerveza_becks.png', 3),
('Cerveza Paulaner Hefe-Weissbier 500ml', 12.00, 'img/cerveza_paulaner.png', 3),
('Cerveza Delirium Tremens 330ml', 18.00, 'img/cerveza_delirium.png', 3);

-- Agua Tónica (10)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id) VALUES 
('Evervess Agua Tónica 500 ml', 3.50, 'imagenes/agua_tonica/evervess.png', 4),
('Ginger Ale Fanta 355 ml', 4.20, 'imagenes/agua_tonica/ginger_ale.png', 4),
('Nordic Mist Agua Tónica 500 ml', 4.70, 'imagenes/agua_tonica/nordic_mist.png', 4),
('Fentimans Tonic Water 200 ml', 7.80, 'imagenes/agua_tonica/fentimans.png', 4),
('Q Tonic Water 200 ml', 7.00, 'imagenes/agua_tonica/q_tonic.png', 4),
('Indi & Co Tónica 200 ml', 6.80, 'imagenes/agua_tonica/indi_co.png', 4),
('Boylan Tonic Water 355 ml', 6.00, 'imagenes/agua_tonica/boylan.png', 4),
('Whole Earth Tonic 275 ml', 5.50, 'imagenes/agua_tonica/whole_earth.png', 4),
('Thomas Henry Tonic 200 ml', 6.30, 'imagenes/agua_tonica/thomas_henry.png', 4),
('Double Dutch Indian Tonic 200 ml', 6.90, 'imagenes/agua_tonica/double_dutch.png', 4);

-- Espumantes (10)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id) VALUES 
('Freixenet Carta Nevada 750 ml', 49.00, 'imagenes/espumantes/freixenet_nevada.png', 5),
('Martini Asti Espumante 750 ml', 55.00, 'imagenes/espumantes/martini_asti.png', 5),
('Chandon Brut 750 ml', 60.00, 'imagenes/espumantes/chandon_brut.png', 5),
('Juvé & Camps Cinta Púrpura Reserva 750 ml', 89.00, 'imagenes/espumantes/juve_camps.png', 5),
('Codorníu Clásico Brut 750 ml', 45.00, 'imagenes/espumantes/codorniu_clasico.png', 5),
('Riccadonna Asti Espumante 750 ml', 48.00, 'imagenes/espumantes/riccadonna_asti.png', 5),
('Anna de Codorníu Brut 750 ml', 50.00, 'imagenes/espumantes/anna_codorniu.png', 5),
('Valdivieso Brut 750 ml', 52.00, 'imagenes/espumantes/valdivieso.png', 5),
('Bosca Anniversario 750 ml', 42.00, 'imagenes/espumantes/bosca_anniversario.png', 5),
('Don Pascual Espumante Brut 750 ml', 40.00, 'imagenes/espumantes/don_pascual.png', 5),
('Cinzano Asti 750 ml', 53.00, 'imagenes/espumantes/cinzano_asti.png', 5),
('Baron B Extra Brut 750 ml', 70.00, 'imagenes/espumantes/baron_b.png', 5),
('Fiorelli Asti Espumante 750 ml', 46.00, 'imagenes/espumantes/fiorelli.png', 5),
('La Chamiza Espumante Extra Brut 750 ml', 47.00, 'imagenes/espumantes/la_chamiza.png', 5),
('Valmarone Moscato Espumante 750 ml', 44.00, 'imagenes/espumantes/valmarone.png', 5);

-- Licores hasta 20 (incluye Pisco, Furloko, Whisky, Ron, Vodka, etc.)
INSERT INTO productos (nombre, precio, imagen_url, categoria_id) VALUES 
('Pisco Quebranta Tabernero 750 ml', 49.00, 'imagenes/licores/pisco_quebranta.png', 6),
('Pisco Italia Cuatro Gallos 750 ml', 52.00, 'imagenes/licores/pisco_italia.png', 6),
('Pisco Portón Mosto Verde 750 ml', 80.00, 'imagenes/licores/pisco_porton.png', 6),
('Four Loko Blue Razz 473 ml', 9.50, 'imagenes/licores/four_loko_blue.png', 6),
('Four Loko Sandía 473 ml', 9.50, 'imagenes/licores/four_loko_sandia.png', 6),
('Anís del Mono Dulce 1 Lt', 35.00, 'imagenes/licores/anis_mono.png', 6),
('Ron Cartavio Black 750 ml', 36.00, 'imagenes/licores/cartavio_black.png', 6),
('Ron Abuelo Añejo 750 ml', 55.00, 'imagenes/licores/ron_abuelo.png', 6),
('Ron Flor de Caña 5 años 750 ml', 62.00, 'imagenes/licores/flor_cana.png', 6),
('Whisky Johnnie Walker Red Label 750 ml', 75.00, 'imagenes/licores/johnnie_red.png', 6),
('Whisky Jack Daniel’s 750 ml', 120.00, 'imagenes/licores/jack_daniels.png', 6),
('Vodka Absolut 750 ml', 68.00, 'imagenes/licores/absolut.png', 6),
('Vodka Smirnoff 750 ml', 47.00, 'imagenes/licores/smirnoff.png', 6),
('Tequila José Cuervo Especial 750 ml', 89.00, 'imagenes/licores/jose_cuervo.png', 6),
('Tequila Patrón Silver 750 ml', 220.00, 'imagenes/licores/patron_silver.png', 6),
('Licor Baileys 750 ml', 75.00, 'imagenes/licores/baileys.png', 6),
('Amaretto Disaronno 700 ml', 82.00, 'imagenes/licores/disaronno.png', 6),
('Jägermeister 700 ml', 70.00, 'imagenes/licores/jagermeister.png', 6),
('Furloko Uva 473 ml', 9.50, 'imagenes/licores/furloko_uva.png', 6),
('Furloko Lima Limón 473 ml', 9.50, 'imagenes/licores/furloko_limon.png', 6);
