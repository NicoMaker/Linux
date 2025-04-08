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
```

## Touch 

```bash
touch file # crea file
stat file # vedi info del 
touch -a file # aggiunge al file modifica tutti i dati 

touch -m file # aggiungi al file con data oggi ultima modifica
touch -m -t 202012300000 nomefile # aggiungi al file con data 30 dicembre 2020
```

