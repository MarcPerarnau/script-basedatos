#!/bin/bash

# Variables de configuración
DB_HOST="localhost"
DB_USER="sea"
DB_PASS="Pr0j3cts3@"
DB_NAME="coaching"

# Crear la base de datos y las tablas
mysql -u "$db_user" -p"$db_password" -h "$db_host" <<EOF
CREATE SCHEMA IF NOT EXISTS \`$db_name\`;
USE \`$db_name\`;

CREATE TABLE CLIENTES(
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    DNI_Cliente VARCHAR(100) UNIQUE,
    Nombre_Cliente VARCHAR(100) NOT NULL,
    Apellido_Cliente VARCHAR(100) NOT NULL,
    FechaNacimiento_Cliente DATE NOT NULL,
    NumTelefono_Cliente VARCHAR(100) NOT NULL,
    Correo_Cliente VARCHAR(100) NOT NULL,
    TipoVia_Cliente ENUM('C/', 'Paseo', 'Av.') NULL,
    NombreVia_Cliente VARCHAR(100) NULL,
    NumeroVia_Cliente INT NULL,
    Contrasena_Cliente VARCHAR(100) NOT NULL,
    Tipo ENUM('cliente','admin') NOT NULL
);

CREATE TABLE ESPECIALISTAS(
    ID_Especialista INT AUTO_INCREMENT PRIMARY KEY,
    DNI_Especialista VARCHAR(100) UNIQUE NOT NULL,
    Nombre_Especialista VARCHAR(100) NOT NULL,
    Apellido_Especialista VARCHAR(100) NOT NULL,
    FechaNacimiento_Especialista INT NOT NULL,
    NumTelefono_Especialista INT NOT NULL,
    Correo_Especialista VARCHAR(100) NOT NULL,
    TipoVia_Especialista ENUM('C/', 'Paseo', 'Av.') NOT NULL,
    NombreVia_Especialista VARCHAR(100) NOT NULL,
    NumeroVia_Especialista INT NOT NULL,
    CuentaBancaria_Especialista VARCHAR(100) NOT NULL,
    Cuota_Especialista DECIMAL(5,2) NOT NULL,
    Contrasena_Especialista VARCHAR(100),
    Tipo ENUM('espe') NOT NULL
);

CREATE TABLE ESPECIALISTA_ESPECIALIDAD(
    ID_Especialista_EspeEspe INT,
    ID_Especialidad_EspeEspe INT,
    PRIMARY KEY (ID_Especialista_EspeEspe, ID_Especialidad_EspeEspe)
);

CREATE TABLE CITAS(
    ID_Cita INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_Cita DATE,
    Hora_Cita ENUM ('8:00-9:00','9:00-10:00','10:00-11:00','11:00-12:00','15:00-16:00','16:00-17:00','17:00-18:00','18:00-19:00',
        '19:00-20:00','20:00-21:00'),
    Coste_Cita DECIMAL NOT NULL,
    ID_Especialista_Cita INT,
    ID_Cliente_Cita INT
);

CREATE TABLE ESPECIALIDAD(
    ID_Especialidad INT AUTO_INCREMENT PRIMARY KEY,
    Especialidad_Especialista ENUM('Coaching Empresarial','Coaching Personal','Coaching con Inteligencia Emocional',
        'Coaching Deportivo','Coaching Ontológico','Coaching Cognitivo','Coaching PNL (Programación Neurolingüística)','Coaching Coercitivo')
);

CREATE TABLE PAGOS(
    ID_Pago INT AUTO_INCREMENT PRIMARY KEY,
    Estado_Pago BOOLEAN NOT NULL,
    Fecha_Pago DATE NOT NULL,
    ID_Pago_Cliente INT
);

CREATE TABLE DISPONIBILIDAD_ESPECIALISTA (
    ID_Dispo INT AUTO_INCREMENT PRIMARY KEY,
    Lunes BOOLEAN,
    Martes BOOLEAN,
    Miercoles BOOLEAN,
    Jueves BOOLEAN,
    Viernes BOOLEAN,
    Hora_Dispo ENUM('8:00-9:00', '9:00-10:00', '10:00-11:00', '11:00-12:00', 
        '15:00-16:00', '16:00-17:00', '17:00-18:00', '18:00-19:00', 
        '19:00-20:00', '20:00-21:00'),
    ID_Especialista_DispoEspe INT
);

-- Relaciones
ALTER TABLE ESPECIALISTA_ESPECIALIDAD ADD
    CONSTRAINT FK_ESPECIALISTA_ESPECIALIDAD_ESPECIALIDAD FOREIGN KEY (ID_Especialista_EspeEspe) REFERENCES ESPECIALISTAS (ID_Especialista) ON UPDATE CASCADE;
ALTER TABLE ESPECIALISTA_ESPECIALIDAD ADD
    CONSTRAINT FK_ESPECIALISTA_ESPECIALIDAD_ESPECIALISTA FOREIGN KEY (ID_Especialidad_EspeEspe) REFERENCES ESPECIALIDAD (ID_Especialidad) ON UPDATE CASCADE;

ALTER TABLE CITAS ADD
    CONSTRAINT FK_CITAS_ESPECIALISTAS FOREIGN KEY (ID_Especialista_Cita) REFERENCES ESPECIALISTAS (ID_Especialista) ON UPDATE CASCADE;
ALTER TABLE CITAS ADD
    CONSTRAINT FK_CITAS_CLIENTES FOREIGN KEY (ID_Cliente_Cita) REFERENCES CLIENTES (ID_Cliente) ON UPDATE CASCADE;

ALTER TABLE PAGOS ADD
    CONSTRAINT FK_PAGOS_CLIENTE FOREIGN KEY (ID_Pago_Cliente) REFERENCES CLIENTES (ID_Cliente) ON UPDATE CASCADE;

ALTER TABLE DISPONIBILIDAD_ESPECIALISTA ADD
    CONSTRAINT FK_DISPONIBILIDAD_ESPECIALISTA_ESPECIALISTAS FOREIGN KEY (ID_Especialista_DispoEspe) REFERENCES ESPECIALISTAS (ID_Especialista) ON UPDATE CASCADE;
EOF

echo "Base de datos '$db_name' y tablas creadas correctamente."