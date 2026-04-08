#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm jre-openjdk openssl

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME

# If the application needs to be manually built that has to be done down here
wget https://downloadirpf.receita.fazenda.gov.br/irpf/2026/irpf/arquivos/IRPF2026-1.0.zip
bsdtar -xvf IRPF2026-1.0.zip --strip-components=1
rm -f *.zip

mkdir -p ./AppDir/bin
mv -v lib lib-modulos irpf.jar IRPF.acb offline.png online.png pgd-updater-1.0.0.jar ./AppDir/bin
