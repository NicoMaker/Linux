[Vai al file Generale](../../README.md)

# Lezione 15 Aprile 2025

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


