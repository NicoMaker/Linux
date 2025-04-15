#!/bin/bash

# Crea la directory 'dir1' se non esiste già
mkdir -p dir1

# Stampa una stringa a schermo
echo "ITS ALTO ADRIATCO"

# Elenca i file presenti nella directory 'dir1' con dettagli
ls -l dir1

# Cerca di leggere un file che non è stato creato, quindi darà errore
cat dir1/comunicazioni.txt
