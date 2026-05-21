-- Eliminar la base de datos si existe en el SMBD
DROP DATABASE IF EXISTS mgbd;

-- Crear la base de datos
CREATE DATABASE mgbd;

-- Seleccionar la base de datos para trabajar con ella
USE mgbd;

-- Crear tablas
CREATE TABLE estudiante(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_completo VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL UNIQUE,
    telefono VARCHAR(20) NOT NULL
);

-- Insertar datos de ejemplo
INSERT INTO estudiante(
    nombre_completo,
    correo,
    telefono
)VALUES(
    'Juan Pérez',
    'juan.perez@example.com',
    '555-1234'
);

INSERT INTO estudiante(
    nombre_completo,
    correo,
    telefono
)VALUES(
    'María Gómez',  
    'maria.gomez@example.com',
    '555-5678'
);

