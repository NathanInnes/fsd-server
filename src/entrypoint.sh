#!/bin/sh

tail -f /var/fsd/log.txt /var/fsd/whazzup.txt &

pip3 install --user requests

# Start the fsd application in the background
nohup /var/fsd/fsd start

# Start python script and output to metar.txt
nohup python3 /var/fsd/metar.py >> /var/fsd/metar.txt 2>&1 &