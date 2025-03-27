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
man -k "copy files" # cerco copy files nel manuale
```

## Alias

```bash
alias c='clear' # creo un alias
```

## Comandi CAT

```bash
cat # visualizzo il contenuto di un file
cat /proc/version # visualizzo il contenuto di un file
```

File PASSWD -> contiene informazioni su utenti e gruppi

```bash
cat /etc/passwd # visualizzo il contenuto di un file
```

## Comandi HISTORY

```bash
cat .bash_history # visualizzo il contenuto di un file dei comandi che ho fatto io
echo $HISTFILESIZE # visualizzo il contenuto di un file dei comandi che ho fatto io
```

## Comandi ip address

```bash
ip addr show # visualizzo il contenuto di un file dei comandi che ho fatto io
```

# Comandi Sudo

```bash
sudo su # passo come root solo quello che sono nel gruppo root quello per la prima volta è router
sudo -i # passo come root solo quello che sono nel gruppo root

exit #torni studente normale non root
```

## Comando capisco dove sono posizionato in questo momento

```bash
pwd # visualizzo il contenuto di un file dei comandi che ho fatto io sua gestione -> potere diverso da root
```

## Creo Gruppo

```bash
sudo groupadd nomegruppo # creo un gruppo
sudo useradd nome # creo un utente
sudo -k # si resettano le credenziali
sudo passwd root # cambio la password di root
```

se c'è password root entri

```bash
su # passo come root password di root
```

altrimenti

```bash
sudo su # passo come root e poi password utente
```

## FileSystem

```bash
df -h # visualizzo il contenuto di un file dei comandi che ho fatto io
```

In Linux, un **file system** è un metodo per memorizzare e organizzare i dati su un dispositivo di memorizzazione, come un disco rigido, un SSD o una chiavetta USB. È responsabile di come i file vengono creati, letti, scritti e cancellati, gestendo anche la struttura dei dati e la gestione dello spazio.

### Struttura di un file system in Linux

1. **Root Directory ("/")**:
   - La radice del file system in Linux è rappresentata da `/`. Tutti i file e le directory partono da questa directory. È la "base" della struttura ad albero del file system.
2. **Directory principali**:

   - **/bin**: contiene i file eseguibili essenziali per il sistema.
   - **/boot**: contiene i file necessari per l'avvio del sistema operativo, come il kernel.
   - **/dev**: contiene i file di dispositivo, che rappresentano hardware e periferiche del sistema.
   - **/etc**: contiene i file di configurazione di sistema.
   - **/home**: contiene le home directory degli utenti, dove vengono salvati i loro dati personali.
   - **/lib**: contiene le librerie condivise necessarie per i programmi di sistema.
   - **/mnt**: punto di montaggio per i dispositivi temporanei.
   - **/opt**: contiene pacchetti software opzionali e applicazioni di terze parti.
   - **/proc**: contiene informazioni sul sistema in tempo reale (es. stato del kernel).
   - **/root**: home directory dell'utente root (superutente).
   - **/sbin**: contiene file eseguibili di sistema, solitamente per l'amministratore.
   - **/tmp**: directory per file temporanei, che possono essere cancellati al riavvio del sistema.
   - **/usr**: contiene programmi e librerie di sistema.
   - **/var**: contiene file variabili come log, spool di stampa, file temporanei.

3. **Mounting**:

   - In Linux, il file system è montato (cioè reso accessibile) in una struttura ad albero. Ogni dispositivo (come un disco rigido o una partizione) è montato in una directory specifica.
   - Puoi montare e smontare file system usando i comandi `mount` e `umount`.

4. **Tipi di File System**:

   - **ext4 (Extended Filesystem 4)**: il più comune file system in Linux, noto per la sua affidabilità e supporto per file di grandi dimensioni.
   - **XFS**: un file system scalabile e ad alte prestazioni, utilizzato soprattutto in ambienti server.
   - **Btrfs**: un file system avanzato che supporta snapshot, compressione e altre funzionalità moderne.
   - **FAT32 e NTFS**: utilizzati per la compatibilità con sistemi Windows, ma possono essere montati anche su Linux.

5. **Permessi di file**:

   - Ogni file e directory ha permessi che determinano chi può leggere, scrivere o eseguire quel file. I permessi sono assegnati a tre gruppi: proprietario, gruppo e altri utenti.
     - **r**: read (lettura)
     - **w**: write (scrittura)
     - **x**: execute (esecuzione)
   - Ad esempio, `rwxr-xr--` significa che il proprietario ha tutti i permessi (lettura, scrittura, esecuzione), il gruppo ha solo lettura ed esecuzione, e gli altri utenti possono solo leggere.

6. **File Speciali**:

   - **File di dispositivo**: rappresentano dispositivi hardware, come dischi rigidi e terminali.
   - **Link simbolici**: file che puntano a un altro file o directory, simili ai collegamenti di Windows.

7. **Gestione dello spazio**:
   - I file system Linux gestiscono l'allocazione dello spazio su disco utilizzando una struttura chiamata **inode**. Un inode contiene metadati su un file (come il tipo di file, i permessi e le informazioni sulla posizione).
   - La gestione delle partizioni del disco può essere fatta tramite strumenti come `fdisk`, `parted` o `gparted`.

### Montare e smontare un file system

- **Montare un file system**:
  Quando monti un file system, rendi il contenuto di una partizione o dispositivo accessibile nella directory di montaggio.

  ```bash
  mount /dev/sda1 /mnt
  ```

  In questo esempio, il dispositivo `/dev/sda1` viene montato nella directory `/mnt`.

- **Smontare un file system**:
  Quando smonti un file system, lo rendi non più accessibile. Assicurati che nessun processo stia utilizzando i file nel file system prima di smontarlo.
  ```bash
  umount /mnt
  ```

### Conclusione

In Linux, il file system è una componente fondamentale per la gestione dei dati. Comprendere come funzionano i file system, la loro struttura e come gestirli è essenziale per amministratori di sistema e utenti avanzati.

ogni cosa è un file -> anche chiavetta (tutta da radice del file /root)

## Linux Founddation

Linux Founddation -> linea decide chi vedere il file

## Home Student

```bash
ls /home/student # vedo elementi di una cartella home
ls ~ # vedo elementi di una cartella home
```

## ETC

contiene tutti i file di configurazioni utneti con le loro password, come è configurata rrete e come sono configurati i gruppi

### SSH

```bash
ls /etc/ssh # vedo elementi di una cartella
```

### LIB

Librerie sempre le più nuove

```bash
ls /lib # vedo elementi di una cartella
```

### MEDIA

vedo chiavette

```bash
ls /media # vedo elementi di una cartella
```

### TEMP

file temporanei cancella i dati senza chiedere conferma

```bash
ls /tmp # vedo elementi di una cartella
```

### PROC

vedi dati della poc tutte info del sistema

```bash
ls /proc # vedo elementi di una cartella
```

tutte le info sono file

### SRV

vedi dove pubblici i tuoi siti web

```bash
ls /srv # vedo elementi di una cartella
```

## Percorso Assluto

In Linux, un **percorso assoluto** è un percorso che inizia dalla directory radice (`/`) e include tutte le sottodirectory fino al file o alla cartella desiderata. Questo tipo di percorso fornisce un riferimento completo e preciso alla posizione di un file o di una cartella nel sistema di file, indipendentemente dalla directory di lavoro corrente.

Esempio di percorso assoluto in Linux:

```
/home/utente/documenti/file.txt
```

In questo caso:

- `/` è la directory radice.
- `home` è una sottodirectory della directory radice.
- `utente` è una sottodirectory all'interno di `home`.
- `documenti` è una sottodirectory di `utente`.
- `file.txt` è il file che si trova all'interno della cartella `documenti`.

Un percorso assoluto in Linux è sempre unico e indipendente dalla posizione in cui ti trovi nel sistema, e permette di accedere direttamente a una risorsa senza la necessità di conoscere la directory corrente.

```bash
pwd # percorso assoluto dice sepre dove sono
```

## Percorso Relativo

Un **percorso relativo** in Linux, invece, è un percorso che si riferisce alla posizione di un file o di una cartella rispetto alla directory di lavoro corrente. A differenza del percorso assoluto, non inizia dalla radice del file system, ma dalla posizione in cui si trova l'utente o il programma che esegue il comando.

Esempio di percorso relativo:

Se ci troviamo nella directory `/home/utente/` e vogliamo accedere al file `file.txt` nella sottocartella `documenti`, il percorso relativo sarà:

```
documenti/file.txt
```

Questo percorso è valido solo se siamo già nella directory `/home/utente/`. Se ci spostiamo in una directory diversa, il percorso relativo potrebbe non essere più corretto.

Un altro esempio di percorso relativo:

Se ci troviamo nella cartella `/home/utente/`, e vogliamo accedere alla cartella `documenti` che è nella stessa directory, possiamo usare il percorso relativo:

```
./documenti
```

L'uso del percorso relativo è molto utile per evitare di dover scrivere percorsi lunghi e assoluti, specialmente quando si lavora all'interno di una struttura di cartelle ben definita.

## Cambiare cartella

```bash
cd ~ #dentro home/student
```

## Installi Tree

```bash
sudo apt install tree
```

```bash
tree /home # vedo elementi di una cartella ma anche sottocartelle e anche i file 
tree -d /home/student # vedo elementi di una cartella e non dei file
```
