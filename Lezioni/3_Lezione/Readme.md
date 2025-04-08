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
ls -l -t cartella # ordina dal piu recente al piu vecchio
ls -l -v cartella # ordina dal piu vecchio al piu recente
```

Ecco il tuo file Markdown con i comandi richiesti:

````markdown
# Comandi per Ordinare i File per Data

## Ordinare i file dalla data più recente alla più vecchia

```bash
ls -l -t cartella
```
````

Questo comando mostra una lista di file nella cartella specificata (`cartella`), ordinandoli dalla data di modifica più recente alla più vecchia.

## Ordinare i file dalla data più vecchia alla più recente

```bash
ls -l -tr cartella
```

Questo comando ordina i file in base alla data di modifica dalla più vecchia alla più recente. L'opzione `-t` ordina per data, mentre l'opzione `-r` inverte l'ordine.
