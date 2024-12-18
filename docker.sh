#!/bin/bash

# Actualitza els repositoris del sistema
sudo apt-get update

# Instal·la les dependències necessàries
sudo apt-get install -y ca-certificates curl

# Crea el directori per a les claus GPG
sudo install -m 0755 -d /etc/apt/keyrings

# Descarrega i afegeix la clau GPG oficial de Docker
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Afegeix el repositori de Docker a les fonts d'Apt
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Torna a actualitzar la llista de repositoris
sudo apt-get update

# Instal·la els paquets de Docker
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verifica la instal·lació executant el contenidor "hello-world"
sudo docker run hello-world
