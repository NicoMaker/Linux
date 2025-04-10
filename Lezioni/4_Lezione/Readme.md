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


