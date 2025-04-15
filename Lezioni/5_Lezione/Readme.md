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
