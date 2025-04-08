[Vai al file Generale](../../README.md)

# Lezione 08 Aprile 2025

## Comandi LS

```bash
ls --help # visualizzo il contenuto di un file dei comandi che ho fatto io
man ls # visualizzo il contenuto di un file dei comandi che ho fatto io

ls -1 # visualizzo il contenuto di un file dei comandi che ho fatto io in 1 colonna

pwd # percorso dove sono

ls -l # lista elementi della cartella ma non i file
```

nei permessi vedi rwx cartella se invece \_ file

```bash
ls -l # lista elementi della cartella ma non i file
ls -ld  percorso # vedo contenuto cartella solo cartelle

ls -h # visualla i contenuti elementi umano con la misura

ls -la
la -l --all
```

file con . nascosti

## Dimensione cartella

```bash
sudo du -sh /etc # visualizzo dimensione cartella
sudo du -sh # visualizzo dimensione cartella
```

## Ordinamento file

```bash
ls -l -X cartella # ordina dal piu grande al piu piccolo
ls -l -r cartella # ordina dal piu piccolo al piu grande
ls -l -S cartella # ordina dal piu piccolo al piu grande
```

## CTIME

```bash
ls -l cartella # vedi data del file
ls -lt cartella # ordina dal piu recente al piu vecchio
ls -lu cartella # ultima volta accesso al file
ls -lc cartella # ultima volta modifica al file proprietario
ls -l --fulltime # visualizza data e ora ultima volta ma copleta

ls -lt # ordina per tempo
ls -l # ordina per nome 

ls -ltu # ordina per tempo di accesso 
ls -ltu --reverse # ordina per tempo di accesso in ordine decrescente
```

## Touch

```bash
touch file # crea file
stat file # vedi info del
touch -a file # aggiunge al file modifica tutti i dati

touch -m file # aggiungi al file con data oggi ultima modifica
touch -m -t 202012300000 nomefile # aggiungi al file con data 30 dicembre 2020
```

1. **Per leggere un file di testo:**

   ```bash
   cat nome_del_file.txt
   ```

2. **Per leggere una riga specifica di un file (ad esempio, la riga 5):**

   ```bash
   sed -n '5p' nome_del_file.txt
   ```

3. **Per leggere un file JSON (ad esempio, usando `jq` per analizzare e ottenere dati da un file JSON):**

   ```bash
   jq '.chiave' nome_del_file.json
   ```

   Dove `.chiave` è la chiave JSON che vuoi estrarre dal file.

4. **Per leggere un file CSV (se vuoi estrarre dati specifici, ad esempio dalla seconda colonna):**

   ```bash
   awk -F ',' '{print $2}' nome_del_file.csv
   ```

   Questo esempio separa i valori usando la virgola e stampa la seconda colonna.


