#!/bin/bash
IMAGE="chimeralogo.png"

if [ ! -f "$IMAGE" ]; then
    echo "Erreur : Le fichier '$IMAGE' n'existe pas."
    exit 1
fi

if ! command -v chafa &> /dev/null; then
    echo "Erreur : chafa n'est pas installé. Installez-le (ex: sudo apt-get install chafa)."
    exit 1
fi

DIMENSIONS="60x30"

chafa --size=$DIMENSIONS "$IMAGE"

echo -e "\n"
echo -e "Utilisez ChimeraShift uniquement sur des systèmes qui vous appartiennent\nou pour lesquels vous disposez d'une autorisation explicite."
echo -e "\n"
echo "Auteur: Matéo HUBERT -> kalilinuxesirem@gmail.com"