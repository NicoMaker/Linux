#!/bin/bash

# Controlla se l'argomento è un file
if [ -f "$1" ]   # Spazio mancante tra "$1" e "]" è stato aggiunto
then
    echo "The argument $1 is a file, displaying it"  # Messaggio più chiaro
    echo "step 1"                                     # Corretto "steo" in "step"
    cat "$1"                                          # Mostra il contenuto del file

# Controlla se l'argomento è una directory
elif [ -d "$1" ]
then
    echo "The argument $1 is a directory, displaying its contents"
    echo "step 1"                                     # Anche qui corretto da "step"
    ls -l "$1"                                        # Lista dettagliata della directory

# Se non è né un file né una directory
else
    echo "The argument $1 is not a file or directory"
    exit 1
fi