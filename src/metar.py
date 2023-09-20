import requests
import time

METAR_API_URL = "https://metar.vatsim.net/metar.php?id=ALL"


def fetch_metar_data():
    response = requests.get(METAR_API_URL)

    if response.status_code == 200:
        return response.text
    else:
        print("Failed to fetch METAR data.")
        return None


def write_metar_to_file(data):
    with open('metar.txt', 'w') as file:
        file.write(data)


while True:
    metar_data = fetch_metar_data()

    if metar_data:
        write_metar_to_file(metar_data)
        print("METAR data written to file.")

    time.sleep(900)
