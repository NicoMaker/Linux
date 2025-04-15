#!/bin/bash
# Definizione del nome del file da analizzare
filename="etc/passwd"

# Mostra il numero di righe del file
echo "Number of lines".
wc -l $filename     # '-l' per contare le righe
echo "##################"

# Mostra il numero di parole del file
echo "Number of words".
wc -w $filename     # '-w' per contare le parole
echo "##################"

# Mostra il numero di caratteri del file
echo "Number of characters".
wc -c $filename     # '-c' per contare i caratteri (che corrispondono ai byte nel caso di file ASCII)
echo "##################"

# Mostra il numero di byte del file
echo "Number of bytes".
wc -m $filename     # '-m' per contare i caratteri multibyte (utile per UTF-8)
echo "##################"
