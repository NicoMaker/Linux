[Vai al file Generale](../../README.md)

# Lezione 15 Aprile 2025

- [Scripting File](scripts)

## Shebang

La riga:

```bash
#!/bin/bash
```

si chiama **shebang** (a volte scritto "shebang", "hashbang", "sharp bang" o anche "shebeng" come hai scritto tu 😊) ed è molto importante negli script Unix/Linux.

### Spiegazione:

- `#!` → è il simbolo che identifica la riga come una direttiva al sistema operativo.
- `/bin/bash` → è il percorso dell'interprete che deve eseguire lo script, in questo caso **Bash**, che di solito si trova in `/bin/bash`.

### Cosa fa?

Dice al sistema:

> "Per eseguire questo file, usa l'interprete `/bin/bash`."

### Esempio pratico:

Se scrivi uno script chiamato `esempio.sh`:

```bash
#!/bin/bash
echo "Ciao mondo!"
```

E lo rendi eseguibile con:

```bash
chmod +x esempio.sh
```

Quando lo esegui con:

```bash
./esempio.sh
```

Il sistema sa che deve usare **Bash** per interpretarlo, grazie alla riga `#!/bin/bash`.

---

### Attenzione:

Hai scritto:

```bash
#!/bin/bash spiega
```

⚠️ **Quella riga non è corretta.** Dopo `#!/bin/bash` **non ci va altro**.  
Scrivere `#!/bin/bash spiega` darebbe errore perché il sistema cercherebbe un interprete chiamato `bash spiega`, che ovviamente non esiste.

## Variabili in Linux

Le **variabili** sono uno strumento fondamentale negli script Bash (e nella shell in generale). Servono per **salvare informazioni** che puoi riutilizzare nel tuo script.

### Come si definisce una variabile?

```bash
nome_variabile=valore
```

> **Attenzione:** non ci devono essere spazi attorno all'uguale (`=`)!

### Esempio:

```bash
messaggio="Ciao mondo!"
echo $messaggio
```

### Spiegazione:

- `messaggio="Ciao mondo!"` → crea una variabile chiamata `messaggio` e le assegna il valore `"Ciao mondo!"`.
- `echo $messaggio` → stampa il valore della variabile. Il simbolo `$` serve per accedere al contenuto.

---

## Tipi di variabili

### 1. **Variabili locali**

Valgono solo **all'interno dello script o della funzione** in cui sono state definite.

```bash
nome="Mario"
```

### 2. **Variabili d'ambiente**

Sono variabili **visibili a tutti i processi** avviati dal terminale o dallo script. Si usano con `export`.

```bash
export PATH=$PATH:/nuovo/percorso
```

> In questo esempio si aggiunge un nuovo percorso alla variabile di sistema `PATH`, che contiene le directory in cui il sistema cerca i comandi.

---

## Esempio pratico:

```bash
#!/bin/bash
nome="Luca"
echo "Ciao, $nome!"
```

Uscita:

```
Ciao, Luca!
```

---

## Buone pratiche

- Usa lettere maiuscole per le **variabili di sistema** (come `PATH`, `HOME`, `USER`)
- Usa lettere minuscole o nomi descrittivi per le **variabili personalizzate**
- Se il valore contiene **spazi**, racchiudilo tra **doppi apici** `" "`  
  Es: `titolo="Il mio script"`

Perfetto! Aggiungiamo ora una spiegazione semplice e chiara del comando `declare -r`, che serve a **rendere una variabile di sola lettura**, cioè **non modificabile dopo la sua dichiarazione**.

Puoi aggiungerlo sotto alla sezione sulle variabili:

## Variabili in sola lettura con `declare -r`

Se vuoi creare una variabile che **non può essere modificata**, puoi usare il comando:

```bash
declare -r nome_variabile=valore
```

L'opzione `-r` sta per **read-only** (sola lettura).

### Esempio:

```bash
declare -r pi=3.14
echo "Il valore di pi è: $pi"
pi=3.14159   # ❌ Questo darà errore!
```

### Cosa succede?

L’ultima riga produrrà un errore simile a:

```
bash: pi: readonly variable
```

> Il sistema ti avvisa che **non puoi cambiare** il valore di una variabile dichiarata con `-r`.

---

### Quando usarlo?

Usa `declare -r` quando vuoi **proteggere un valore** importante all’interno dello script e assicurarti che **non venga cambiato accidentalmente**.

---

Se vuoi, posso anche spiegarti altri usi del comando `declare`, ad esempio:

- `declare -i` → per variabili **numeriche**
- `declare -a` → per **array**
- `declare -x` → per esportare come **variabile d'ambiente**

## Esempio pratico

Il comando `echo $name` in un terminale Linux o in un ambiente di shell come Bash restituirà il valore della variabile `name`.

Se, ad esempio, la variabile `name` è stata precedentemente definita con un valore, come ad esempio:

```bash
name="Alice"
```

Esegui il comando:

```bash
echo $name
```

Il terminale restituirà:

```
Alice
```

Se invece la variabile `name` non è stata definita o è vuota, il comando `echo $name` restituirà una riga vuota.

Ecco un esempio completo che include sia `read -p` che `echo`:

```bash
# Chiediamo all'utente di inserire un nome
read -p "Inserisci il tuo nome: " name

# Mostriamo il nome inserito dall'utente
echo "Il nome inserito è: $name"
```

### Spiegazione:

1. Il comando `read -p` visualizzerà il messaggio `"Inserisci il tuo nome: "` nel terminale, quindi si fermerà in attesa che l'utente inserisca qualcosa.
2. Il valore che l'utente inserisce verrà assegnato alla variabile `name`.
3. Successivamente, il comando `echo` stamperà il valore di `name`.

### Esempio di esecuzione:

```bash
Inserisci il tuo nome: Alice
Il nome inserito è: Alice
```

Se la variabile `name` è lasciata vuota, il comando `echo` restituirà una riga vuota:

```bash
Inserisci il tuo nome:
Il nome inserito è:
```

### 🔒 Comando:

```bash
sudo iptables -A INPUT -s 8.8.8.8 -j DROP
```

---

### 🧠 Spiegazione passo-passo:

- `sudo`  
  Esegue il comando con privilegi di superutente (necessari per modificare le regole del firewall).

- `iptables`  
  È il comando usato per configurare le regole del firewall su sistemi Linux.

- `-A INPUT`  
  Aggiunge (`-A`) una nuova regola alla catena `INPUT`, che gestisce il traffico in entrata.

- `-s 8.8.8.8`  
  Specifica l'indirizzo IP sorgente della connessione: in questo caso, **8.8.8.8** (uno dei DNS pubblici di Google).

- `-j DROP`  
  Indica che, se il pacchetto corrisponde alla regola (cioè proviene da `8.8.8.8`), deve essere **scartato** senza alcuna notifica.

---

### 💬 Commento inline:

```bash
# Blocca tutto il traffico in entrata proveniente dall'indirizzo IP 8.8.8.8
sudo iptables -A INPUT -s 8.8.8.8 -j DROP
```

---

### ⚠️ Nota:

Questa regola **non ha effetto sul traffico in uscita**, quindi ad esempio se il tuo sistema contatta 8.8.8.8, la risposta sarà comunque bloccata in entrata. Se vuoi bloccare completamente ogni comunicazione con quell’IP (in entrata e in uscita), dovresti aggiungere una regola simile anche alla catena `OUTPUT`.

### 📦 Comando:

```bash
sudo iptables -L
```

---

### 🧠 Spiegazione:

- `sudo`  
  Esegue il comando con privilegi di superutente (richiesto per visualizzare le regole del firewall se non sei root).

- `iptables`  
  Comando usato per gestire il firewall in Linux.

- `-L`  
  Sta per **List** e serve a **visualizzare tutte le regole** correnti configurate nelle catene (`INPUT`, `OUTPUT`, `FORWARD`) del firewall.

---

### 💬 Commento inline:

```bash
# Mostra tutte le regole attualmente attive nel firewall (iptables)
sudo iptables -L
```

---

### 📋 Output tipico:

Ti mostrerà un elenco di regole divise per catena, come ad esempio:

```
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


```

Perfetto! Ecco il comando con spiegazione e commento dettagliato:

---

### 📦 Comando:

```bash
sudo iptables -L INPUT -n --line-number
```

---

### 🧠 Spiegazione dettagliata:

- `sudo`  
  Esegue il comando con privilegi di amministratore (necessario per leggere/modificare le regole di iptables).

- `iptables`  
  Comando per gestire le regole del firewall in Linux.

- `-L INPUT`  
  Lista (`-L`) tutte le regole della **catena INPUT**, ovvero le regole che gestiscono il traffico **in entrata**.

- `-n`  
  Disabilita la risoluzione DNS e dei nomi host/IP. Mostra gli **IP e le porte in formato numerico**, rendendo l’output più veloce e dettagliato.

- `--line-number`  
  Aggiunge un **numero di riga** per ciascuna regola mostrata. Molto utile se vuoi **rimuovere** una regola specifica con `iptables -D`.

---

### 💬 Commento inline:

```bash
# Elenca le regole della catena INPUT con numeri di riga e indirizzi in formato numerico
sudo iptables -L INPUT -n --line-number
```

---

### 📋 Output tipico:

```
Chain INPUT (policy ACCEPT)
num  target     prot opt source        destination
1    DROP       all  --  8.8.8.8       0.0.0.0/0
```

Questo ti permette, ad esempio, di rimuovere la regola `DROP` in posizione 1 con:

```bash
sudo iptables -D INPUT 1
```

Certo! Se prima hai **bloccato** un indirizzo IP (es. `8.8.8.8`) con:

```bash
sudo iptables -A INPUT -s 8.8.8.8 -j DROP
```

E poi lo hai **verificato** con:

```bash
sudo iptables -L INPUT -n --line-number
```

Puoi **riabilitare** il traffico da quell’IP semplicemente **rimuovendo la regola** con `iptables -D`.

---

### ✅ Comando per riabilitare l’IP (es. 8.8.8.8):

#### Metodo 1 – Se conosci il numero di riga:

Supponiamo che la regola sia in **posizione 1**:

```bash
sudo iptables -D INPUT 1
```

#### Metodo 2 – Se vuoi eliminare la regola specifica (più sicuro):

```bash
sudo iptables -D INPUT -s 8.8.8.8 -j DROP
```

---

### 💬 Commento inline:

```bash
# Rimuove la regola che blocca l'IP 8.8.8.8 dalla catena INPUT
sudo iptables -D INPUT -s 8.8.8.8 -j DROP
```

---
