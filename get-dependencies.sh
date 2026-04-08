#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm jre17-openjdk openssl

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

echo "Getting app..."
echo "---------------------------------------------------------------"
VERSION=1.5
echo "$VERSION" > ~/version
wget https://downloadirpf.receita.fazenda.gov.br/irpf/2026/irpf/arquivos/IRPF2026-${VERSION}.zip
bsdtar -xvf ./*.zip --strip-components=1
rm -f ./*.zip

mkdir -p ./AppDir/bin
sed -i 's|\./jre/bin/java -jar irpf.jar|exec java -jar "$APPDIR/bin/irpf.jar" "$@"|' exec.sh
mv -v exec.sh lib lib-modulos irpf.jar IRPF.acb offline.png online.png pgd-updater-1.0.0.jar ./AppDir/bin
