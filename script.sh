#!/bin/bash

# Definir las variables de conexión a MySQL
MYSQL_USER="Cache3815"  # Usuario de MySQL
MYSQL_PASSWORD="z1fVrI&ZVfyonsZ"  # Contraseña de MySQL
DATABASE_NAME="CarConnect"  # Nombre de la base de datos a crear

# Ingresar al shell de MySQL y crear la base de datos
echo "Creando la base de datos '$DATABASE_NAME'..."
mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"

# Conectar a la base de datos y crear las tablas
echo "Creando las tablas en la base de datos '$DATABASE_NAME'..."

mysql -u $MYSQL_USER -p$MYSQL_PASSWORD $DATABASE_NAME <<EOF
CREATE TABLE IF NOT EXISTS usuarios (
    email VARCHAR(200) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(100) NOT NULL UNIQUE,
    img VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS vehiculos (
    matricula VARCHAR(100) PRIMARY KEY,
    email VARCHAR(200),
    marca VARCHAR(25) NOT NULL,
    modelo VARCHAR(25) NOT NULL,
    color VARCHAR(25) NOT NULL,
    img VARCHAR(100),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mensajes (
    matricula VARCHAR(100),
    ID_vehiculos INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Añadir las claves foráneas
ALTER TABLE mensajes
ADD CONSTRAINT fk_vehiculo FOREIGN KEY (matricula)
REFERENCES vehiculos(matricula);

ALTER TABLE vehiculos
ADD CONSTRAINT fk_usuario FOREIGN KEY (email)
REFERENCES usuarios(email);

EOF

# Verificar si las tablas se crearon correctamente
if [ $? -eq 0 ]; then
  echo "Las tablas y claves foráneas se crearon exitosamente en la base de datos '$DATABASE_NAME'."
else
  echo "Hubo un error al crear las tablas o claves foráneas."
fi
