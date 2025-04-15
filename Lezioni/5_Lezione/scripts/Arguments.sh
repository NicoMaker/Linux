#!/bin/bash

# Stampa il nome dello script (file) che è stato eseguito
echo "\$0 is $0"

# Stampa i primi 13 argomenti passati allo script
echo "\$1 is $1"
echo "\$2 is $2"
echo "\$3 is $3"
echo "\$4 is $4"
echo "\$5 is $5"
echo "\$6 is $6"
echo "\$7 is $7"
echo "\$8 is $8"
echo "\$9 is $9"

# ATTENZIONE: $10, $11, ecc. vengono interpretati come `${1}0`, `${1}1`, ecc., quindi devono essere scritti tra parentesi graffe:
# echo "\$10 is ${10}"
# echo "\$11 is ${11}"
# echo "\$12 is ${12}"
# echo "\$13 is ${13}"
# Ma in questo script non sono tra graffe, quindi stamperanno $1 seguito da 0, 1, 2, 3
echo "\$10 is $10"   # <-- equivale a "${1}0"
echo "\$11 is $11"   # <-- equivale a "${1}1"
echo "\$12 is $12"   # <-- equivale a "${1}2"
echo "\$13 is $13"   # <-- equivale a "${1}3"

# $* espande tutti gli argomenti come una singola stringa
echo "\$* is $*"

# $@ espande tutti gli argomenti come array (utile in for-loop)
echo "\$@ is $@"

# $? restituisce il codice di uscita dell'ultimo comando eseguito (qui sarà 0, dato che l'ultimo `echo` è andato a buon fine)
echo "\$? is $?"

# $# indica quanti argomenti sono stati passati allo script
echo "\$# is $#"