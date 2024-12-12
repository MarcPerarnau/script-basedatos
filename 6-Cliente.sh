#!/bin/bash

# Configuración de la base de datos
DB_HOST="localhost"
DB_USER="sea"
DB_PASS="Pr0j3cts3@"
DB_NAME="coaching"

# Consultas SQL para insertar clientes
SQL="INSERT INTO CLIENTES (DNI_Cliente, Nombre_Cliente, Apellido_Cliente, FechaNacimiento_Cliente, NumTelefono_Cliente, Correo_Cliente, TipoVia_Cliente, NombreVia_Cliente, NumeroVia_Cliente, Contrasena_Cliente) VALUES
('55456797W', 'Carlos', 'Sánchez', '1985-03-14', '665489023', 'csanchez@gmail.com', 'C/', 'd Aribau', '282', 'carlossanchez'),
('82785707J', 'María', 'Pérez', '1979-11-05', '630598870', 'mperez@gmail.com', 'C/.', 'del Dr Roux', '28', 'mariaperez'),
('97917286F', 'Miguel', 'Fernández', '1980-06-22', '662306699','mfernandez@gmail.com', 'C/', 'de Juan de la Cierva', '22', 'miguelfernandez'),
('49375969Y', 'Ana', 'Martínez', '1990-09-13', '605480051','amartinez@gmail.com', 'C/', 'de Lluís Millet', '12', 'anamartinez'),
('84021693W', 'Luis', 'García', '1983-12-01', '602445566', 'lgarcia@gmail.com', 'C/', 'de l Ateneu', '3', 'luisgarcia'),
('85072594X','Amanda', 'Cabrera', '1994-05-09', '601930002', 'acabrera@gmail.com', 'C/', 'de Daora', '11', 'amandacabrera'),
('96070610R', 'Juan', 'Morales', '1988-04-25', '693265510', 'jmorales@gmail.com', 'C/', 'del Cobalt', '57', 'juanmorales'),
('03580336H', 'Isabel', 'Álvarez', '2000-01-30', '608597712', 'ialvarez@gmail.com', 'C/', 'de la l Estany de la Murtra', '1', 'isabelalvarez'),
('19974725F', 'Antonio', 'Díaz', '1995-02-18', '609836511', 'adiaz@gmail.com', 'Av.', 'del Carrilet', '292', 'antoniodiaz'),
('14570092Y', 'Ricard', 'Vázquez', '1997-07-21', '608000220', 'rvazquez@gmail.com', 'C/', 'de Massenet', '59', 'ricardvazquez');"

# Ejecutar las consultas
mysql -h "$DB_HOST" -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$SQL"

if [ $? -eq 0 ]; then
  echo "Clientes insertados correctamente."
else
  echo "Error al insertar clientes."
fi
