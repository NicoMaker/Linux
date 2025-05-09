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

## Vedo elementi del file

```bash
cat file # visualizzo il contenuto di un file dei comandi che ho fatto io
cat -n file # visualizzo il contenuto di un file dei comandi che ho fatto io con numero vicino
cat -b file # visualizzo il contenuto di un file dei comandi che ho fatto io
head file # visualizzo il contenuto di un file dei comandi che ho fatto io
tail file # visualizzo il contenuto di un file dei comandi che ho fatto io
```

## comandi opzioni dei file

```bash

file /run /* # tipi di file che comandi che posso vedere

file /etc/ssh/sshd_config # tipi di file che comandi che posso vedere

file /etc/ssh/sshd_config # tipi di file che comandi che posso vedere
```

## Concateni contenuto file in uno

```bash
cat percorso_file percorso_file > nome file nuovo # concateno il contenuto di due file
```

## LESS

/q esce
g inizio file
G fine file

```bash
less percorso_file # visualizzo il contenuto di un file dei comandi che ho fatto io
less percorso_file # visualizzo il contenuto di un file dei comandi ch8e ho fatto io
```

## Tail

```bash
tail -n numero_righe percorso_file # ultime due rige di un file
tail -n +20 percorso_file # dalla riga 20 in avanti
tail -f percorso_file # vedi dati dei file in tempo reale

tail percorso_file # ultime 10 righe
```

## Head

```bash
head -n numero_righe percorso_file # prime due rige di un file
head -n +20 percorso_file # dalla riga 20 in avanti
head -f percorso_file # vedi dati dei file in tempo reale

head percorso_file # primo 10 righe
```

## Watch

```bash
watch nome comando # visualizzo file
```

## Creazione cartella

```bash
mkdir cartella
```

## Creazione cartelle di più

```bash
mkdir cartella1 cartella2 cartella3
```

## Copi file

```bash
cp percorso_file percorso_file # copio il file
cp percorso_file percorso_file # copio il file
```

## Copi cartella

```bash
cp -r percorso_file percorso_file # copio il file,b
cp -r percorso_file percorso_file # copio il file


cp percorso-file percorso-file # copio il file
cp -i percorso_file percorso_file # copio il file dove dentro c'erano gli utenti
```

## Mv (move)

Certo! Ecco come funziona il comando `mv` (abbreviazione di **move**) nel terminale Bash, ed è usato sia per **spostare** che per **rinominare** file o directory.

### 📁 Rinomina un file

Per rinominare un file o una cartella:

```bash
mv vecchio_nome nuovo_nome
```

🔹 Esempio:

```bash
mv relazione.txt relazione_finale.txt
```

> ✅ Il file `relazione.txt` viene **rinominato** in `relazione_finale.txt`.

---

### 📂 Sposta un file in un'altra directory

```bash
mv file.txt /nuova/cartella/
```

🔹 Esempio:

```bash
mv immagine.jpg ~/Immagini/
```

> ✅ Il file `immagine.jpg` viene **spostato** nella cartella `Immagini`.

---

### 📝 Entrambi: spostare e rinominare insieme

```bash
mv documento.txt ~/Documenti/documento_finale.txt
```

> ✅ Il file viene **spostato** nella cartella `Documenti` e **rinominato** in `documento_finale.txt`.

---

### ❌ Il tuo esempio sistemato:

Nel tuo esempio ci sono due comandi `mv` identici (che non fanno nulla). Ecco un esempio corretto con commenti:

```bash
mv file.txt file_backup.txt   # Rinomina il file
mv file_backup.txt ~/Backup/ # Sposta il file rinominato nella cartella Backup
```

## Elimina file e cartelle

```bash
rm file # elimina file
rm -r cartella # elimina cartella
rm -f file # elimina file
```

## Update 

sposto solo se il file è più aggiornato dell'altro 

```bash
mv -u percorso_file percorso_file # sposto solo se il file é maggior
```


## Rinomina file 

```bash
mv percorso_file percorso_file # rinomina
```

## Elimini con SGRED

```bash
sgred percorso_file # elimina
```

