#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm jre-openjdk

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
wget https://downloadirpf.receita.fazenda.gov.br/irpf/2026/irpf/arquivos/IRPF2026-1.0.zip
bsdtar -xvf IRPF2026-1.0.zip

mkdir -p ./AppDir/bin
