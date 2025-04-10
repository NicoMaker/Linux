[Vai al file Generale](../../README.md)

# Lezione 10 Aprile 2025

## Gestione degli account

### Crei utente

```bash
sudo useradd utente
sudo passwd utente
```

Shadow -> file delle password eseguo solo da amministartore
Passwd -> file degni utenti eseguono tutti

File Propretario sia gruppo che utente sono uguali (gruppo e utente)

### GREP

1. **`grep utente /etc/passwd`**:

   - **Descrizione**: Questo comando cerca la parola "utente" all'interno del file `/etc/passwd`. Il file `/etc/passwd` contiene informazioni sugli utenti del sistema, come nome utente, ID utente (UID), ID gruppo (GID), home directory e shell predefinita. Il comando restituirà tutte le righe che contengono la parola "utente".
   - **Uso comune**: Per cercare informazioni relative a un determinato utente nel sistema.

2. **`grep 100 /etc/group`**:

   - **Descrizione**: Questo comando cerca il numero "100" all'interno del file `/etc/group`. Il file `/etc/group` contiene informazioni sui gruppi di utenti nel sistema, come il nome del gruppo, gli ID di gruppo (GID), e i membri del gruppo. Il comando restituirà tutte le righe che contengono il numero "100", che potrebbe corrispondere a un GID.
   - **Uso comune**: Per cercare informazioni relative a un determinato gruppo o per verificare quale gruppo ha un determinato ID.

3. **`less /etc/group`**:

   - **Descrizione**: Il comando `less` viene utilizzato per visualizzare il contenuto di un file in modo interattivo, permettendo di scorrere su e giù nel file. In questo caso, il comando visualizza il contenuto del file `/etc/group`, che contiene informazioni sui gruppi del sistema, come il nome del gruppo, l'ID del gruppo (GID), i membri del gruppo e altre informazioni. Con `less`, puoi navigare facilmente nel file, cercare termini specifici e scorrere avanti e indietro.

   - **Uso comune**: Per esaminare il contenuto di file di testo, in particolare file di sistema grandi, come `/etc/group`, senza caricare tutto il contenuto tutto in una volta. Questo è utile per analizzare i gruppi nel sistema e la loro configurazione.

   - Puoi usare le frecce direzionali per scorrere il file, o comandi come `/` per cercare una parola specifica nel file.

4. **`groups`**:

   - **Descrizione**: Il comando `groups` mostra la lista dei gruppi di cui l'utente corrente è membro. Se eseguito senza argomenti, restituisce i gruppi a cui appartiene l'utente che ha eseguito il comando. Il primo gruppo che appare nella lista è il gruppo primario dell'utente, cioè il gruppo di default a cui l'utente è associato. Gli altri gruppi indicano gli eventuali gruppi supplementari di cui l'utente fa parte.

   - **Uso comune**: Per visualizzare a quali gruppi appartiene un determinato utente nel sistema, e per identificare il gruppo primario e gli eventuali gruppi secondari.

   - Ad esempio, se il comando viene eseguito come utente "mario", potrebbe restituire un risultato del tipo:
     ```
     mario : mario adm cdrom sudo
     ```
     In questo caso, "mario" è il gruppo primario, mentre "adm", "cdrom", e "sudo" sono gruppi supplementari.

### Creazione Utente con gruppi

```bash
sudo useradd -m -d /home/utente -c "commento" -s /bin/bash -G gruppo1,gruppo2 nome
```

#### Spiegazione dei parametri:

- `sudo`: Esegui il comando con privilegi di amministratore.
- `useradd`: Comando per creare un nuovo utente nel sistema.
- `-m`: Crea la home directory dell'utente se non esiste.
- `-d /home/utente`: Specifica il percorso della home directory dell'utente.
- `-c "commento"`: Aggiunge una descrizione o un commento associato all'utente (ad esempio, il nome completo).
- `-s /bin/bash`: Specifica la shell predefinita per l'utente, in questo caso `bash`.
- `-G gruppo1,gruppo2`: Aggiunge l'utente ai gruppi specificati (separati da virgola). Puoi aggiungere più gruppi come desiderato.
- `nome`: Il nome dell'utente che stai creando.

#### Esempio:

Se vuoi creare un utente chiamato `mario` con una home directory in `/home/mario`, descrizione "Utente Mario", shell bash e farlo appartenere ai gruppi `admin` e `developer`, il comando sarà:

```bash
sudo useradd -m -d /home/mario -c "Utente Mario" -s /bin/bash -G admin,developer mario
```

Per aggiungere una data di scadenza all'utente, puoi utilizzare l'opzione `-e` con il comando `useradd`. L'opzione `-e` consente di specificare una data di scadenza per l'account, dopodiché l'utente non potrà più accedere al sistema.

La sintassi per la data di scadenza è nel formato `YYYY-MM-DD`.

### Esempio di comando con data di scadenza:

Se vuoi creare l'utente `mario` con una data di scadenza fissata al 31 dicembre 2025, il comando diventa:

```bash
sudo useradd -m -d /home/mario -c "Utente Mario" -s /bin/bash -G admin,developer -e 2025-12-31 mario
```

#### Spiegazione aggiuntiva:

- `-e 2025-12-31`: Imposta la data di scadenza dell'account utente al 31 dicembre 2025. Dopo questa data, l'utente non potrà più accedere al sistema, ma l'account rimarrà esistente fino a che non venga rimosso manualmente.

Questo comando crea l'utente `mario` con le seguenti caratteristiche:

- Home directory in `/home/mario`.
- Descrizione "Utente Mario".
- Shell bash (`/bin/bash`).
- Appartenenza ai gruppi `admin` e `developer`.
- Scadenza dell'account fissata al 31 dicembre 2025.

### Visualizzazione informazioni sulla scadenza della password

Il comando `sudo chage -l u2` viene utilizzato per visualizzare le informazioni sulla scadenza e la gestione della password per l'utente `u2` nel sistema Linux.

### Spiegazione del comando:

- `sudo`: Esegue il comando con privilegi di superutente (amministratore).
- `chage`: È un comando utilizzato per modificare le informazioni sulla gestione della password di un utente, come la scadenza della password, la durata minima e massima della password, ecc.
- `-l`: Mostra le informazioni correnti relative alla password dell'utente.
- `u2`: È il nome dell'utente di cui si desidera visualizzare le informazioni (in questo caso, `u2`).

#### Cosa fa `chage -l`:

Quando esegui `chage -l u2`, il sistema restituirà informazioni come:

1. **Last password change**: La data dell'ultima modifica della password.
2. **Password expires**: La data in cui la password dell'utente scadrà.
3. **Password inactive**: La data dopo la quale l'account diventa inattivo se la password non viene cambiata.
4. **Account expires**: La data di scadenza dell'account stesso (se impostata).
5. **Minimum number of days between password change**: Il numero minimo di giorni tra un cambio password e l'altro.
6. **Maximum number of days between password change**: Il numero massimo di giorni che una password può essere utilizzata prima di doverla cambiare.
7. **Warning period before password expires**: Il periodo di tempo (in giorni) durante il quale l'utente viene avvisato prima che la password scada.

#### Esempio di output:

```
Last password change                                    : May 10, 2024
Password expires                                        : Jul 10, 2024
Password inactive                                       : never
Account expires                                         : never
Minimum number of days between password change          : 7
Maximum number of days between password change          : 90
Warning period before password expires                  : 7
```

In questo esempio:

- L'utente ha cambiato la sua password l'11 maggio 2024.
- La password scadrà il 10 luglio 2024.
- L'account non ha una data di scadenza e non ci sono restrizioni sull'inattività della password.

Questo comando è utile per monitorare e gestire la sicurezza delle password degli utenti nel sistema.

### Modificare la descrizione (commento) di un utente

Il comando `sudo usermod -c "commento" nome_utente` viene utilizzato per modificare la descrizione (commento) di un utente nel sistema. Il commento è spesso usato per aggiungere una descrizione o una nota associata all'utente, come il nome completo o altre informazioni utili.

#### Spiegazione del comando:

- `sudo`: Esegue il comando con privilegi di amministratore.
- `usermod`: È il comando utilizzato per modificare un account utente già esistente.
- `-c "commento"`: Imposta o modifica il campo di commento dell'utente. Il commento può essere qualsiasi testo che descriva l'utente, ad esempio il nome completo, la funzione o il reparto in cui lavora.
- `nome_utente`: È il nome dell'utente che desideri modificare.

#### Esempio:

Supponiamo di voler modificare l'utente `mario` e aggiungere un commento che dica "Mario Rossi, amministratore". Il comando sarebbe:

```bash
sudo usermod -c "Mario Rossi, amministratore" mario
```

#### Cosa accade:

- Il comando modifica l'account dell'utente `mario` aggiungendo o aggiornando il commento nel suo profilo utente.
- Dopo l'esecuzione, puoi verificare il commento usando il comando `getent passwd mario` o `cat /etc/passwd`, dove troverai la descrizione (commento) associata all'utente.

#### Esempio di output dopo la modifica:

Se esegui `getent passwd mario`, il risultato potrebbe essere simile a questo:

```
mario:x:1001:1001:Mario Rossi, amministratore:/home/mario:/bin/bash
```

In questo esempio, `Mario Rossi, amministratore` è il commento che è stato aggiunto al profilo utente `mario`.

### Gruppi Utente

-g cambia gruppo appartenenza utente
-G appartiene gruppi secondari

#### Aggiungi un gruppo all'utwnte

Il comando che hai scritto serve per aggiungere un utente a un gruppo in un sistema basato su Linux. Ecco cosa fa ogni parte del comando:

- `sudo`: esegue il comando come amministratore (root).
- `usermod`: è il comando utilizzato per modificare un account utente.
- `-aG`: l'opzione `-a` aggiunge l'utente al gruppo specificato, mentre `-G` specifica il gruppo o i gruppi a cui l'utente deve essere aggiunto.
- `gruppo`: è il nome del gruppo a cui l'utente deve essere aggiunto.
- `utente`: è il nome dell'utente che deve essere aggiunto al gruppo.

Esempio:

Se vuoi aggiungere l'utente `mario` al gruppo `developer`, il comando sarà:

```bash
sudo usermod -aG developer mario
```

In questo caso, `mario` verrà aggiunto al gruppo `developer`.

### Elimini utente e cartella principale

Il comando che hai scritto ha un piccolo errore di sintassi. La forma corretta per eliminare un utente e la sua cartella principale su un sistema Linux è:

```bash
sudo userdel -r nome_utente
```

#### Spiegazione:

- **`sudo`**: Esegui il comando con privilegi di amministratore (superutente).
- **`userdel`**: Comando per eliminare un utente dal sistema.
- **`-r`**: Opzione che indica che, oltre all'utente, deve essere eliminata anche la cartella principale (home directory) dell'utente.
- **`nome_utente`**: Sostituisci con il nome dell'utente che desideri eliminare.

#### Cosa fa il comando:

1. **Elimina l'utente**: Rimuove il nome dell'utente dal sistema, inclusi i dati relativi all'accesso e alle configurazioni personali.
2. **Rimuove la home directory**: Con l'opzione `-r`, elimina anche la cartella home dell'utente, che contiene i suoi file personali, come documenti e configurazioni.

#### Attenzione:

- Questo comando è **irreversibile**. Una volta eseguito, tutti i dati dell'utente, inclusi i file nella sua home directory, verranno cancellati definitivamente. Assicurati di fare un backup se necessario.

### Sposti di utente

Il blocco che hai scritto mostra come **cambiare utente** nel terminale Linux usando il comando `su`. Ecco una spiegazione passo passo:

---

### Comando:

```bash
su nome_utente
```

#### Significato:

- **`su`** sta per **"substitute user"** (sostituisci utente).
- **`nome_utente`** è l'utente al quale vuoi passare.
- Quando **non specifichi nessun utente**, `su` prova a passare all’utente root per impostazione predefinita.
- Ti verrà richiesta la **password dell'utente a cui vuoi passare** (non la tua, ma quella di `nome_utente`).

#### Nota:

Per passare a un altro utente, **devi avere il permesso** (in particolare per passare a `root`, devi essere nel gruppo `sudo` o `wheel`, a seconda del sistema).

---

### Esempio pratico:

Se sei loggato come `studente` e vuoi cambiare utente e passare a `admin`:

```bash
su admin
```

Poi ti chiederà:

```
Password:
```

Se la password è corretta, ora sei `admin`.

---

### Per tornare indietro (utente precedente):

```bash
exit
```

Questo **chiude la shell dell’utente attuale** e **torna al precedente utente**.

---

### Riepilogo:

| Comando          | Azione                                                         |
| ---------------- | -------------------------------------------------------------- |
| `su nome_utente` | Cambia utente nel terminale (richiede la password dell’utente) |
| `exit`           | Torna all’utente precedente (chiude la shell attuale)          |

---

### Opzioni Gruppi

Certo! Ti spiego il significato e l'utilizzo delle opzioni **GroupAdd**, **GroupDel** e **GroupMod** con degli esempi pratici. Queste opzioni sono generalmente usate in ambiente **Linux** (da terminale) per gestire i gruppi di utenti.

---

#### 🔹 **GroupAdd** → _Aggiunge un nuovo gruppo_

**Sintassi:**

```bash
groupadd nome_gruppo
```

**Esempio:**

```bash
groupadd sviluppatori
```

➡️ Crea un gruppo chiamato `sviluppatori`.

---

#### 🔹 **GroupDel** → _Rimuove un gruppo esistente_

**Sintassi:**

```bash
groupdel nome_gruppo
```

**Esempio:**

```bash
groupdel sviluppatori
```

➡️ Elimina il gruppo `sviluppatori` (⚠️ non elimina gli utenti del gruppo, solo il gruppo stesso).

---

#### 🔹 **GroupMod** → _Modifica un gruppo esistente_

**Sintassi:**

```bash
groupmod [opzioni] nome_gruppo
```

#### Le opzioni più comuni sono:

- `-n nuovo_nome` → Rinominare un gruppo
- `-g nuovo_GID` → Cambiare l’ID del gruppo (GID)

**Esempio 1: rinominare un gruppo**

```bash
groupmod -n devteam sviluppatori
```

➡️ Rinomina il gruppo `sviluppatori` in `devteam`.

**Esempio 2: cambiare GID**

```bash
groupmod -g 505 devteam
```

➡️ Cambia l'ID del gruppo `devteam` in 505.

---

Ecco una documentazione completa sul comando `who -a users.txt`, con spiegazione dettagliata di ogni parte:

---

## 📄 Documentazione: Comando `who -a users.txt`

### 🔍 Descrizione generale

Il comando `who` in ambiente Unix/Linux serve per visualizzare informazioni sugli utenti attualmente connessi al sistema. L'opzione `-a` estende l'output con tutte le informazioni disponibili. Tuttavia, l’aggiunta di `users.txt` in questo comando non è sintatticamente corretta, e può portare a fraintendimenti. Vediamo tutto nel dettaglio.

---

### 🧱 Sintassi base

```bash
who [opzioni]
```

---

### ⚙️ Spiegazione del comando `who -a`

```bash
who -a
```

L'opzione `-a` (abbreviazione di `--all`) mostra **tutte** le informazioni disponibili, ovvero una combinazione di più opzioni come:

- `-b` — Ultimo reboot del sistema
- `-d` — Processi morti (zombie login processes)
- `-H` — Aggiunge intestazioni di colonna
- `-l` — Mostra i login disponibili
- `-p` — Mostra i processi di init attivi
- `-r` — Mostra il runlevel attuale
- `-s` — Output abbreviato
- `-t` — Mostra l'ultima modifica del tempo di sistema
- `-u` — Aggiunge informazioni sugli idle time

✅ **Esempio di output di `who -a`:**

```
           system boot  2025-04-10 09:15
           run-level 5  2025-04-10 09:15
LOGIN      tty1         2025-04-10 09:15               1234 id=1
username   tty2         2025-04-10 10:00  00:10        5678
```

---

### 📁 E il file `users.txt`?

Quando scrivi:

```bash
who -a users.txt
```

Il sistema interpreta `users.txt` come **argomento aggiuntivo non valido**, **non come un file di input**.

> ❌ `who` **non** accetta file come input in questo modo.  
> ✅ `users.txt` potrebbe essere usato come **output di un reindirizzamento**, tipo:

```bash
who -a > users.txt
```

---

### 📝 Esempi pratici

#### ✅ Salvare tutte le informazioni degli utenti connessi in un file:

```bash
who -a > users.txt
```

#### ✅ Aggiungere l'output al file invece di sovrascrivere:

```bash
who -a >> users.txt
```

#### ✅ Visualizzare il contenuto del file creato:

```bash
cat users.txt
```

---

### ⚠️ Errori comuni

- `who -a users.txt`: ❌ errore o ignorato perché `users.txt` non è un'opzione valida
- `who users.txt`: ❌ errore, perché `who` non accetta input da file direttamente

---

### ✅ Conclusione

| Comando corretto     | Scopo                                                   |
| -------------------- | ------------------------------------------------------- |
| `who -a`             | Mostra tutte le informazioni sugli utenti connessi      |
| `who -a > users.txt` | Salva l'output completo in un file chiamato `users.txt` |
| `cat users.txt`      | Visualizza il contenuto del file creato                 |

Certo! Ecco la documentazione completa per il comando `chmod u-r users.txt`, spiegata passo passo:

---

## 📄 Documentazione: Comando `chmod u-r users.txt`

### 🔍 Descrizione generale

Il comando `chmod` (change mode) viene utilizzato in sistemi Unix/Linux per **modificare i permessi di accesso** ai file e alle directory.

Il comando:

```bash
chmod u-r users.txt
```

serve per **rimuovere il permesso di lettura per il proprietario (utente)** sul file `users.txt`.

---

### 🧱 Sintassi base

```bash
chmod [chi][+/-=][permessi] nome_file
```

- **chi**: Specifica a chi applicare il cambiamento:

  - `u`: utente (proprietario del file)
  - `g`: gruppo
  - `o`: altri
  - `a`: tutti (user, group, others)

- **+**: aggiunge il permesso
- **-**: rimuove il permesso
- **=**: imposta esattamente i permessi specificati

- **permessi**:
  - `r`: read (lettura)
  - `w`: write (scrittura)
  - `x`: execute (esecuzione)

---

### ⚙️ Spiegazione del comando `chmod u-r users.txt`

| Parte       | Significato                       |
| ----------- | --------------------------------- |
| `chmod`     | Cambia i permessi del file        |
| `u`         | Applica al proprietario (user)    |
| `-r`        | Rimuove il permesso di lettura    |
| `users.txt` | File a cui si applica la modifica |

➡️ Dopo l’esecuzione, **il proprietario del file non potrà più leggerlo** (a meno di ripristinarne il permesso).

---

### 🔐 Esempio pratico

Supponiamo di avere i seguenti permessi iniziali:

```bash
ls -l users.txt
# -rw-r--r-- 1 mario mario  300 Apr 10 10:00 users.txt
```

Dove:

- `-rw-r--r--` indica che l’**utente** può leggere e scrivere,
- il **gruppo** può solo leggere,
- **altri** possono solo leggere.

Dopo:

```bash
chmod u-r users.txt
```

Risultato:

```bash
ls -l users.txt
# --w-r--r-- 1 mario mario  300 Apr 10 10:00 users.txt
```

Ora il proprietario **non può più leggere** il file.

---

### ❓ Come ripristinare il permesso di lettura

Puoi usare:

```bash
chmod u+r users.txt
```

---

### ⚠️ Attenzione

- Se rimuovi il permesso di lettura a te stesso (`u-r`), **non potrai più leggere il file fino a quando non riaggiungi il permesso**.
- Se il file è importante, verifica sempre i permessi prima di modificarli con:
  ```bash
  ls -l users.txt
  ```

---

### ✅ Conclusione

| Comando               | Effetto                                                     |
| --------------------- | ----------------------------------------------------------- |
| `chmod u-r users.txt` | Rimuove il permesso di lettura per il proprietario del file |
| `chmod u+r users.txt` | Riaggiunge il permesso di lettura per il proprietario       |
| `ls -l users.txt`     | Verifica lo stato attuale dei permessi                      |

---

## 📄 Documentazione: Comando `id > users.txt`

### 🔍 Descrizione generale

Il comando `id` in sistemi Unix/Linux serve per **visualizzare l'ID utente e i gruppi** a cui appartiene l'utente attualmente connesso.  
Il simbolo `>` viene usato per **reindirizzare l'output** del comando in un file, sovrascrivendo il contenuto esistente.

Il comando completo:

```bash
id > users.txt
```

significa:

> "Esegui il comando `id` e **scrivi il risultato** nel file `users.txt`, **sovrascrivendo** qualsiasi contenuto precedente."

---

### 🧱 Sintassi del comando

```bash
id [opzioni]
```

```bash
comando > nome_file
```

- `id`: mostra UID (User ID), GID (Group ID) e gruppi dell'utente
- `>`: redireziona l’output **standard** verso un file (in scrittura)
- `users.txt`: nome del file dove salvare l’output

---

### ⚙️ Esempio di output del comando `id`

Eseguendo:

```bash
id
```

Potresti ottenere un risultato simile a:

```
uid=1000(mario) gid=1000(mario) gruppi=1000(mario),27(sudo),1001(dev)
```

Questo mostra:

- `uid=1000(mario)`: ID utente e nome
- `gid=1000(mario)`: ID del gruppo principale
- `gruppi`: tutti i gruppi a cui appartiene l’utente

---

### 📁 Esempio pratico di `id > users.txt`

```bash
id > users.txt
```

1. Esegue `id`
2. Scrive l’output nel file `users.txt`
3. Se il file non esiste, lo crea
4. Se esiste, lo **sovrascrive**

🔍 Per vedere il contenuto del file dopo il comando:

```bash
cat users.txt
```

---

### 🔁 Variante: aggiungere senza sovrascrivere

Se vuoi **aggiungere** l’output al file (senza cancellare ciò che c’era prima):

```bash
id >> users.txt
```

---

### ⚠️ Attenzione

- Usando `>` **sovrascrivi** sempre il file: usalo con cautela!
- Se il file è protetto da permessi, potresti ricevere un errore di "Permission denied"

---

### ✅ Conclusione

| Comando           | Descrizione                                          |
| ----------------- | ---------------------------------------------------- |
| `id`              | Mostra UID, GID e gruppi dell’utente attuale         |
| `id > users.txt`  | Salva l’output nel file `users.txt` (sovrascrive)    |
| `id >> users.txt` | Aggiunge l’output in fondo al file (non sovrascrive) |
| `cat users.txt`   | Visualizza il contenuto del file                     |

---

Perfetto! Ecco una documentazione **chiara e completa** sui **simboli `-r`, `-w`, `-x`** quando vengono usati con il comando `chmod` per **rimuovere i permessi** sui file.

---

## 📄 Documentazione: Rimozione dei permessi `read`, `write`, `execute` sui file

### 🔍 Descrizione generale

Nel sistema Unix/Linux, ogni file o directory ha dei **permessi di accesso** associati a tre categorie:

- **u** → utente (owner, cioè il proprietario del file)
- **g** → gruppo
- **o** → altri (others)
- **a** → tutti (all: `u`, `g` e `o`)

I permessi principali sono:

| Simbolo | Permesso                 | Significato                      |
| ------- | ------------------------ | -------------------------------- |
| `r`     | read                     | Lettura del contenuto del file   |
| `w`     | write                    | Modifica o eliminazione          |
| `x`     | execute                  | Esecuzione del file (es. script) |
| `root ` | se togli ha sempre tutto |

---

### 🔧 Sintassi per **rimuovere** i permessi

```bash
chmod [chi]-[permesso] nomefile
```

- `chi`: u, g, o oppure a
- `-`: indica la **rimozione** del permesso
- `[permesso]`: può essere `r`, `w`, o `x`

---

### 🟥 Rimozione dei permessi: spiegazione

#### 🔸 `-r` → Rimuove il permesso di **lettura**

```bash
chmod u-r file.txt
```

📌 Il proprietario **non potrà più leggere** il file `file.txt`.

---

#### 🔸 `-w` → Rimuove il permesso di **scrittura**

```bash
chmod g-w file.txt
```

📌 Il **gruppo** non potrà più **modificare** o **cancellare** il file.

---

#### 🔸 `-x` → Rimuove il permesso di **esecuzione**

```bash
chmod o-x script.sh
```

📌 Gli **altri utenti** non potranno più eseguire `script.sh` come programma.

---

### 📁 Esempi pratici completi

#### 1. Rimuovere tutti i permessi al gruppo:

```bash
chmod g-rwx documento.txt
```

#### 2. Togliere permesso di esecuzione a tutti:

```bash
chmod a-x script.sh
```

#### 3. Verificare i permessi prima e dopo:

```bash
ls -l file.txt
# Output prima: -rwxrw-r--
# Output dopo chmod o-x file.txt: -rwxrw-r--
```

---

### ⚠️ Attenzione

- Se rimuovi il permesso `r` a te stesso (`u-r`), **non potrai più leggere il tuo file**!
- Se togli `x` a uno script (`.sh`), **non sarà più eseguibile direttamente**:
  - dovrai eseguirlo con `bash script.sh` invece di `./script.sh`

---

### ✅ Riepilogo tabella comandi

| Comando            | Effetto                        |
| ------------------ | ------------------------------ |
| `chmod u-r file`   | Togli lettura al proprietario  |
| `chmod g-w file`   | Togli scrittura al gruppo      |
| `chmod o-x file`   | Togli esecuzione agli altri    |
| `chmod a-rwx file` | Togli tutti i permessi a tutti |

---

## Permessi

Hai ragione! Se stai parlando in stile **Unix/Linux**, allora i permessi sono rappresentati con numeri da **0 a 7**, dove ogni numero corrisponde a una combinazione di **lettura (r), scrittura (w), esecuzione (x)**:

| Numero | Permessi | Significato            |
| ------ | -------- | ---------------------- |
| 0      | ---      | Nessun permesso        |
| 1      | --x      | Solo esecuzione        |
| 2      | -w-      | Solo scrittura         |
| 3      | -wx      | Scrittura + esecuzione |
| 4      | r--      | Solo lettura           |
| 5      | r-x      | Lettura + esecuzione   |
| 6      | rw-      | Lettura + scrittura    |
| 7      | rwx      | Tutti i permessi       |

Questa rappresentazione viene usata ad esempio nei comandi come `chmod` per assegnare i permessi a file e cartelle.

Se ti riferivi a questo, allora sì: **7 è il massimo**.

root e utenti superadmin -> non sono soggetti a limitazioni di permessi (sempre tutto)

## Alias

```bash
alias comando_fare=comando_linux
```

disponibili solo in questo terminal

per persistenti -> nel file bashrc

```bash
nano .bashrc
```

Il comando:

```bash
source .bashrc
```

oppure, in forma equivalente:

```bash
. .bashrc
```

serve per **eseguire** il file `.bashrc` nel **contesto della shell attuale**, cioè ricaricare tutte le configurazioni definite in quel file **senza dover chiudere e riaprire il terminale**.

---

### Ma che cos'è `.bashrc`?

`.bashrc` è un file di configurazione usato dalla shell **Bash**. Di solito si trova nella home directory (`~/.bashrc`) ed è eseguito **ogni volta che apri un nuovo terminale interattivo non di login**. Contiene configurazioni come:

- Alias personalizzati (es. `alias ll='ls -la'`)
- Variabili d’ambiente (es. `export PATH=...`)
- Funzioni di shell
- Colori per il prompt
- E altro ancora...

---

### Perché si usa `source .bashrc`?

Quando modifichi `.bashrc`, i cambiamenti **non hanno effetto immediato**. Per applicarli subito senza riavviare il terminale, usi:

```bash
source ~/.bashrc
```

In questo modo, le nuove impostazioni entrano subito in vigore.

---

### Esempio pratico

Hai aggiunto questa riga a `.bashrc`:

```bash
alias gs='git status'
```

Per poter usare subito `gs` come alias di `git status`, basta eseguire:

```bash
source ~/.bashrc
```

---

## Tolgo alias per questo terminal

```bash
unalias comando_fare
```

### Echo$0

Il comando `echo $0` in un terminale (Linux, macOS, o altre shell Unix-like) stampa il nome del programma o dello script che è stato eseguito.

### Dettagli:

- **`echo`**: È un comando che stampa il suo argomento sul terminale.
- **`$0`**: È una variabile speciale in shell che contiene il nome dello script o del programma che è stato eseguito. Ad esempio:
  - Se stai eseguendo uno script chiamato `myscript.sh`, eseguendo `echo $0` verrà stampato `myscript.sh`.
  - Se stai eseguendo la shell interattiva, `echo $0` potrebbe stampare qualcosa come `bash`, `zsh`, `sh`, a seconda della shell in uso.

In sintesi, `echo $0` è un modo per vedere quale programma o shell è stato avviato nel terminale.

/etc/shells -> vedi tutte le possibili shell disponibili in Linux



### Creazione file Script (Schell)

```bash
nano script.sh
```

### Esegui Script

```bash
./script.sh
```

### Shebang

Il comando che hai scritto, `#!bin/bash`, sembra contenere un errore. In realtà, dovrebbe essere:

```bash
#!/bin/bash
```

Questo è chiamato *shebang* ed è utilizzato all'inizio di uno script in Linux o macOS per indicare al sistema quale interprete deve essere usato per eseguire lo script. Nel caso specifico:

- `#!/bin/bash` indica che lo script deve essere eseguito con l'interprete **Bash** (Bourne Again SHell), che è uno dei terminali più comuni in ambienti Unix-like.

Lo shebang si trova sempre come prima riga di un file di script (come `.sh`), ed è seguito dal percorso dell'interprete che si vuole utilizzare per eseguire lo script.

Quindi:

- `#!` è una sequenza che dice al sistema che quello che segue è il percorso dell'interprete.
- `/bin/bash` è il percorso completo del programma Bash sul sistema.

Questo permette di eseguire lo script direttamente dalla riga di comando senza dover specificare manualmente l'interprete Bash.