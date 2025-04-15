#!/bin/bash
# Indica che questo script deve essere eseguito con l'interprete bash

read -p "Enter the IP address to block: " IP
# Chiede all'utente di inserire un indirizzo IP e lo salva nella variabile $IP

iptables -I INPUT -s $IP -j DROP
# Inserisce una regola nella catena INPUT per bloccare (DROP) tutto il traffico in entrata da quell'IP
# L'opzione -I inserisce la regola all'inizio della catena, rendendola prioritaria

echo "IP address $IP has been blocked."
# Conferma all'utente che l'indirizzo IP è stato bloccato
