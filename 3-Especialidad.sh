#!/bin/bash

# Configuración de la base de datos
DB_HOST="localhost"
DB_USER="sea"
DB_PASS="Pr0j3cts3@"
DB_NAME="coaching"

# Consultas SQL para insertar registros
SQL="INSERT INTO ESPECIALIDAD (Especialidad_Especialista) VALUES \
('Coaching Empresarial'), \
('Coaching Personal'), \
('Coaching con Inteligencia Emocional'), \
('Coaching Deportivo'), \
('Coaching Ontológico'), \
('Coaching Cognitivo'), \
('Coaching PNL (Programación Neurolingüística)'), \
('Coaching Coercitivo');"

# Ejecutar las consultas
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$SQL"

if [ $? -eq 0 ]; then
  echo "Registros insertados correctamente."
else
  echo "Error al insertar registros."
fi
