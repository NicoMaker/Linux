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

tutti comandi e opzioni separati con uno spazio

## Visione cartelle di sistema

```bash
ls # vedo elementi di una cartella
ls -l # vedo elementi di una cartella file,applicazioni e cartelle
ls -la # vedo elementi di una cartella file,applicazioni e cartelle

ls -a # vedo elementi di una cartella vedo tutto
ls --all # vedo elementi di una cartella vedo tutto

ls -l -h # vedo elementi di una cartella file,applicazioni e cartelle in megabytes
ls -lh # vedo elementi di una cartella file,applicazioni e cartelle in megabytes

man ls # vedo la documentazione di ls, esci cliccando q
```

estensione in Linux -> non ha significato puoi fare anche senza significato

## Permessi Utente

- R -> leggi
- W -> scrivi
- X -> esegui

Se vuoi impostare i permessi di lettura (R), scrittura (W) ed esecuzione (X) per tutti gli utenti su un file o una cartella, puoi usare il comando `chmod`.

Ecco tutti i casi:

### 1. **Solo Lettura (R)**

```bash
chmod 444 nomefile
```

- Utente, gruppo e altri possono solo leggere.

### 2. **Solo Scrittura (W)**

```bash
chmod 222 nomefile
```

- Utente, gruppo e altri possono solo scrivere (ma non leggere né eseguire).

### 3. **Solo Esecuzione (X)**

```bash
chmod 111 nomefile
```

- Utente, gruppo e altri possono solo eseguire.

### 4. **Lettura e Scrittura (RW)**

```bash
chmod 666 nomefile
```

- Utente, gruppo e altri possono leggere e scrivere.

### 5. **Lettura ed Esecuzione (RX)**

```bash
chmod 555 nomefile
```

- Utente, gruppo e altri possono leggere ed eseguire.

### 6. **Scrittura ed Esecuzione (WX)**

```bash
chmod 333 nomefile
```

- Utente, gruppo e altri possono scrivere ed eseguire.

### 7. **Lettura, Scrittura ed Esecuzione (RWX)**

```bash
chmod 777 nomefile
```

- Utente, gruppo e altri possono leggere, scrivere ed eseguire. ⚠️ (Molto permissivo)

Se vuoi applicare i permessi a una cartella e ai suoi contenuti in modo ricorsivo:

```bash
chmod -R 777 nomecartella
```

I numeri che usiamo nei comandi `chmod` rappresentano i permessi in **sistema ottale (base 8)** e funzionano così:

Ogni permesso ha un valore numerico:

- **R (lettura) → 4**
- **W (scrittura) → 2**
- **X (esecuzione) → 1**

Per ogni utente (proprietario, gruppo, altri), si sommano i valori per ottenere i permessi desiderati:

### Esempi:

1. **Solo lettura (R)** → `4`

   - `chmod 444 file` → Solo lettura per tutti.

2. **Lettura e scrittura (RW)** → `4 + 2 = 6`

   - `chmod 666 file` → Lettura e scrittura per tutti.

3. **Lettura ed esecuzione (RX)** → `4 + 1 = 5`

   - `chmod 555 file` → Lettura ed esecuzione per tutti.

4. **Tutti i permessi (RWX)** → `4 + 2 + 1 = 7`
   - `chmod 777 file` → Tutto consentito a tutti (⚠️ attenzione!).

Ogni cifra nel comando `chmod` rappresenta i permessi per:

- **Prima cifra** → Proprietario del file
- **Seconda cifra** → Gruppo
- **Terza cifra** → Altri utenti

Esempio pratico:

- `chmod 754 file`
  - **7 (proprietario)** → Lettura (4) + Scrittura (2) + Esecuzione (1) = RWX
  - **5 (gruppo)** → Lettura (4) + Esecuzione (1) = RX
  - **4 (altri)** → Solo lettura (4)

🔹 **Ricorda:** Più alto è il numero, più permessi ha l'utente! 🚀


## Vedi documentazione

```bash
type apt # vedo la documentazione di apt
man apt # vedo la documentazione di apt
type alias # vedo la documentazione di alias
```

## Ifconfig 

Appartiene tool di rete

```bash
ifconfig # vedo le informazioni di rete
sudo apt install net-tools -y  # scarico net-tools sempre si
```

## Cerca nel manuale

```bash
man -k ifconfig # cerco ifconfig nel manuale
```

