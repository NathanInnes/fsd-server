#!/bin/sh

pip3 install --user requests

# Start the fsd application in the background and redirect output to /var/fsd/fsd.log
nohup /var/fsd/fsd start >> /var/fsd/fsd.txt 2>&1 &

# Start your Python script in the background (replace with your script name) and redirect output to /var/fsd/metar.log
nohup python3 /var/fsd/metar.py >> /var/fsd/metar.txt 2>&1 &

# Keep the script running to keep the container running
tail -f /dev/null
