#!/bin/bash

# Configuración de la base de datos
DB_HOST="localhost"
DB_USER="sea"
DB_PASS="Pr0j3cts3@"
DB_NAME="coaching"

# Consultas SQL para insertar registros
SQL="INSERT INTO ESPECIALISTA_ESPECIALIDAD (ID_Especialista_EspeEspe, ID_Especialidad_EspeEspe) VALUES
('1', '1'),
('2', '2'),
('3', '3'),
('4', '4'),
('5', '5'),
('6', '6'),
('7', '7'),
('8', '8'),
('9', '1');"

# Ejecutar las consultas
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$SQL"

if [ $? -eq 0 ]; then
  echo "Registros insertados correctamente."
else
  echo "Error al insertar registros."
fi
