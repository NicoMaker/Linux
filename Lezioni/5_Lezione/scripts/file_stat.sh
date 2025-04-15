#!/bin/bash
# Definizione del nome del file da analizzare
filename="etc/passwd"  # 🔴 Manca uno slash iniziale! Dovrebbe essere "/etc/passwd"

# Mostra il numero di righe del file
echo "Number of lines:"
wc -l $filename     # '-l' per contare le righe (linee)
echo "##################"

# Mostra il numero di parole del file
echo "Number of words:"
wc -w $filename     # '-w' per contare le parole
echo "##################"

# Mostra il numero di caratteri (in byte, per file ASCII)
echo "Number of characters:"
wc -c $filename     # '-c' per contare i caratteri (equivale ai byte nei file di testo standard)
echo "##################"

# Mostra il numero di byte (o caratteri multibyte in UTF-8)
echo "Number of bytes:"
wc -m $filename     # '-m' per contare i caratteri, specialmente utile con file UTF-8
echo "##################"

# Mostra nuovamente il numero di caratteri (duplicato, ma lasciato come da richiesta)
echo "Number of characters (again):"
wc -m $filename
echo "##################"

# Mostra le prime 5 righe del file
echo "First 5 lines:"
head -n 5 $filename     # 'head -n 5' prende le prime 5 righe del file
echo "##################"

# Mostra le ultime 7 righe del file
echo "Last 7 lines:"
tail -n 7 $filename     # 'tail -n 7' prende le ultime 7 righe del file
echo "##################"
