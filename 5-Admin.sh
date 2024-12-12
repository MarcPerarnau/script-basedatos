#!/bin/bash

# Configuración de la base de datos
DB_HOST="localhost"
DB_USER="sea"
DB_PASS="Pr0j3cts3@"
DB_NAME="coaching"

# Consulta SQL para insertar el registro
SQL="INSERT INTO CLIENTES (DNI_Cliente, Nombre_Cliente, Apellido_Cliente, FechaNacimiento_Cliente, NumTelefono_Cliente, Correo_Cliente, TipoVia_Cliente, NombreVia_Cliente, NumeroVia_Cliente, Contrasena_Cliente, Tipo) VALUES ('11111111A', 'Admin', 'Admin', '1111-11-11', '111111111', 'admin@admin.com', 'Admin', 'Admin', '1', 'Admin', 'Admin');"

# Ejecutar la consulta
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$SQL"

if [ $? -eq 0 ]; then
  echo "Registro insertado correctamente."
else
  echo "Error al insertar el registro."
fi
