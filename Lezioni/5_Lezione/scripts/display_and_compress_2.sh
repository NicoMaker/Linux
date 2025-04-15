#!/bin/bash

# Verifica se è stato passato un argomento
if [ -z "$1" ]; then
  echo "Errore: devi specificare un file o una directory da mostrare e comprimere."
  echo "Uso: $0 <nome_file_o_cartella>"
  exit 1
fi

# Mostra il contenuto del file
echo "Visualizzazione del contenuto di $1 ..."
sleep 2

# Se è un file, usa cat, altrimenti mostra il contenuto con ls
if [ -f "$1" ]; then
  cat "$1"
elif [ -d "$1" ]; then
  ls "$1"
else
  echo "Errore: $1 non è un file o una directory valida."
  exit 1
fi

echo

# Comprimi usando tar con compressione bzip2
echo "Compressione di $1 ..."
sleep 2
tar -cjvf "$1.tar.bz2" "$1"

echo "Compressione completata: $1.tar.bz2"
