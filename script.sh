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

EOF

# Verificar si las tablas se crearon correctamente
if [ $? -eq 0 ]; then
  echo "Las tablas y claves foráneas se crearon exitosamente en la base de datos '$DATABASE_NAME'."
else
  echo "Hubo un error al crear las tablas o claves foráneas."
fi
