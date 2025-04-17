#!/bin/bash

# 1 e 2. Verifica se è stato fornito un argomento (il file di log)
if [ $# -eq 0 ]; then
  echo "Errore: devi fornire il percorso di un file di log come argomento."
  echo "Uso: $0 /percorso/del/file.log"
  exit 1
fi

# 3. Assegna il nome del file di log a una variabile
log_file="$1"

# 4. Verifica se il file di log esiste
if [ ! -f "$log_file" ]; then
  echo "Errore: il file '$log_file' non esiste."
  exit 1
fi

# 5. Chiede all'utente di inserire una parola chiave
read -p "Inserisci la parola chiave da cercare: " keyword

# 6 e 7. Cerca nel file le righe che contengono la parola chiave e le salva in log_filtrato.txt
grep "$keyword" "$log_file" > log_filtrato.txt

# 8. Conta il numero di righe trovate
righe_trovate=$(wc -l < log_filtrato.txt)

# Mostra il numero totale di righe trovate
echo "Sono state trovate $righe_trovate righe contenenti la parola '$keyword'."
