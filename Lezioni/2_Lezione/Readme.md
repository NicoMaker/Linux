[Vai al file Generale](../../README.md)

# Lezione 27 Marzo 2025

## Provi connettività di rete

```bash
ping 8.8.8.8 # ping google

ping -c3 8.8.8.8 # ping google 3 volte
ping -c3 www.google.com # ping google 3 volte
```

## Utente con comando sudo

```bash
sudo apt-get update # aggiorno la lista dei pacchetti
sudo apt full-upgrade # aggiorno tutti i pacchetti
sudo apt-get install open-vm-tools-desktop -y # scarico open-vm-tools-desktop sempre si
sudo reboot #riavvia il sistema
```

Terminal -> interfaccia dove inserisco i comandi -> si chiama terminal -> manda dati i comandi interpreter o shell (esegue solo se è valido) -> si chiama Shell

Comandi -> sono key sensitive

# Vedi commandi di visualizzazione

```bash
ls # vedo elementi di una cartella
ip -a  # vedo le informazioni di rete (schede di rete)
ifconfig # vedo le informazioni di rete
who # vedo chi è online
who -a # vedo chi è online
```

# Comandi per vedere processi che sono in esecuzione sulla macchina

```bash
ps # processi in esecuzione
ps -aux # tutti i processi in esecuzione
```

## Differenza tra console e terminal

console -> è l'interfaccia utente
terminal -> è l'interfaccia di programmazione (comandi che posso dare)

in concetto stessa cosa -> entrambi sono interpretati da bash

## Comandi di navigazione

```bash
cd # cambia cartella
cd .. # cambia cartella
cd .. # cambia cartella
cd ../.. # cambia cartella
cd ../../.. # cambia cartella
cd ../.. # cambia cartella
cd ../.. # cambia cartella
cd ../.. # cambia cartella
```

Linux -> in genere lavara a riga di comando poi è nata Interfaccia Grafica

## Scarico terminator

```bash
sudo apt update && sudo apt-get install terminator -y # scarico terminator sempre si
```

## Ping google 1 volta

```bash
ping -c1 8.8.8.8 # ping google 1 volta
```

