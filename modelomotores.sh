#!/bin/sh

# Línea de comandos (modelo con más motores)
csvsort -d '^' -c nb_engines -r  optd_aircraft.csv | head -2 |csvcut -c model |tail -1