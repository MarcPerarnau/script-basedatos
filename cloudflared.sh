#!/bin/bash

# Descargar e instalar Cloudflared
echo "Descargando cloudflared..."
curl -L --output cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb

echo "Instalando cloudflared..."
sudo dpkg -i cloudflared.deb

# Instalar servicio con la clave proporcionada
echo "Instalando servicio Cloudflared..."
sudo cloudflared service install eyJhIjoiNzEzMTllMTNiMWQzMjlhYTc1NjZkZWIxNTQ5YzE1NTciLCJ0IjoiZjE1MzExMzUtNzY5Ni00NTE2LTgyMjYtMDMyYTRjZTgzYTQ2IiwicyI6Ik1XTTFNMlV3T0RVdFpXWTNaQzAwTVRVeUxXRmhabVV0TlRsbE0yRXlaV1F6WkdSaCJ9

echo "Cloudflared ha sido instalado y configurado correctamente."
