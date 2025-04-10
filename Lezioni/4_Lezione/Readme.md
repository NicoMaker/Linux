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
