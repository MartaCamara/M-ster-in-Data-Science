#!/bin/sh

# Línea de comandos (modelo con más motores)
csvsort -d '^' -c nb_engines -r  $1 | head -2 |csvcut -c model |tail -1