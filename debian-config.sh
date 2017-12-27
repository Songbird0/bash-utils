#!/bin/bash

. python3_installer.sh
. java_installer.sh

# Configuration d'une distribution Debian pour obtenir un environnement
# rédigé en français et encodé en UTF-8.
if [ "$(whoami)" != 'root' ]
then
    echo "You're not logged in as user root. Please run this script with root."
    exit 1
fi
apt-get update && apt-get dist-upgrade
if [ "$LANG" != "fr_FR.UTF-8" ]
then
    echo "Sélection de l'encodage de la langue: "
    dpkg-reconfigure locales
else
    echo 'La langue principale du système est le Français.'
fi
# Installation de quelques paquets essentiels
# Il ne s'agit plus simplement d'installer les paquets pour un environnement configuré en français,
# mais aussi des paquets utiles au quotidien et dont l'installation manuelle est, en générale, contre-productive.
apt-get install manpages-fr manpages-fr-dev manpages-fr-extra man-db tree git dnsutils bzip2 gcc g++ make curl
( install_python3 )

# Les arguments peuvent être modifiés au besoin
install_java https://www.dropbox.com/s/uf81xyw3rf9ct4z/jdk-8u112-linux-x64.tar.gz?dl=1 jdk1.8.0_112
