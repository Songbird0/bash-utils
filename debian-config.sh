#!/bin/bash

# Configuration d'une distribution Debian pour obtenir un environnement
# rédigé en français et encodé en UTF-8.

sudo apt-get update && sudo apt-get dist-upgrade
echo "Sélection de l'encodage de la langue: "
sudo dpkg-reconfigure locales
sudo apt-get install manpages-fr manpages-fr-dev manpages-fr-extra man-db tree git
