import pandas as pd

data = pd.read_csv('country_vaccination_stats.csv')

data_filtered = data[data['date'] == '1/6/2021']

total_vaccinations = data_filtered['daily_vaccinations'].sum()

print(f'Total vaccinations on 1/6/2021: {total_vaccinations}')
