#!/bin/bash

# Controllo del numero di parametri
if [ $# -ne 2 ]; then
  echo "Uso: $0 [opzione] [nome_file]"
  echo "Opzioni disponibili:"
  echo "  -c    Crea il file (se non esiste)"
  echo "  -e    Verifica se il file esiste"
  echo "  -d    Elimina il file (se esiste)"
  exit 1
fi

opzione="$1"
nome_file="$2"

case "$opzione" in
  -c)
    if [ -e "$nome_file" ]; then
      echo "Il file '$nome_file' esiste già."
    else
      touch "$nome_file"
      echo "File '$nome_file' creato con successo."
    fi
    ;;
  -e)
    if [ -e "$nome_file" ]; then
      echo "Il file '$nome_file' esiste."
    else
      echo "Il file '$nome_file' non esiste."
    fi
    ;;
  -d)
    if [ -e "$nome_file" ]; then
      rm "$nome_file"
      echo "File '$nome_file' eliminato."
    else
      echo "Il file '$nome_file' non esiste, quindi non può essere eliminato."
    fi
    ;;
  *)
    echo "Opzione non valida: '$opzione'"
    echo "Uso corretto: $0 -c|-e|-d nome_file"
    ;;
esac
