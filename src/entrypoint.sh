#!/bin/sh

pip3 install --user requests

# Start the fsd application in the background and redirect output to /var/fsd/fsd.log
nohup /var/fsd/fsd start

# Start your Python script in the background (replace with your script name) and redirect output to /var/fsd/metar.log
nohup python3 /var/fsd/metar.py