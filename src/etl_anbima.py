import pandas as pd
import requests
from io import StringIO
from datetime import datetime, timedelta


def list_last_days(days=5):
    today = datetime.today()

    # List with last days
    list_days = []

    # Get days
    for i in range(0, days + 30):
        day = today - timedelta(days=i)
        day = datetime.strftime(day, "%y%m%d")
        list_days.append(str(day))

    return list_days


def download_daily_datas(list_days, util_days=5):
    sucess = 0
    generated_datas = []

    for time in list_days:
        # break the code in the last util days
        if sucess >= util_days:
            break

        # Try request to the util days
        try:
            url = f'https://www.anbima.com.br/informacoes/merc-sec-debentures/arqs/db{time}.txt'

            # Request html
            print("try date:", time)
            site = requests.get(url)

            # Verify if CSV
            if site.text.strip().startswith("<!DOCTYPE") or site.text.strip().startswith("<html"):
                continue

            # Read CSV
            data = pd.read_csv(StringIO(site.text), sep="@", decimal=",", skiprows=1, encoding="latin1")
            print("readed")

            # Save daily data  (UFT-8)
            generated_datas.append(data)
            data.to_csv(f'Daily Prices/20{time}.csv')

            # verificator
            sucess += 1

        # break
        except Exception:
            continue

    return generated_datas


def concat_dataset(df, list_days):
    # Concat all dataframes in list
    df = pd.concat(df, axis=0, ignore_index=True)

    # Create Benchmark column
    df['Indexador'] = df['Índice/ Correção'].str.extract(r'(DI \+|% do DI|IPCA \+)')
    df['Indexador'] = df['Indexador'].str.replace(" ", "")

    # Save all datas
    df.to_csv(f'Daily Prices/DATA_SET.csv')