import pandas as pd
import numpy as np

data = pd.read_csv('country_vaccination_stats.csv')

min_vaccinations = {}

for country in data['country'].unique():
    min_vaccinations[country] = data.loc[data['country'] == country, 'daily_vaccinations'].min()

data['daily_vaccinations'] = data.apply(lambda row: min_vaccinations[row['country']] if np.isnan(row['daily_vaccinations']) else row['daily_vaccinations'], axis=1)

data['daily_vaccinations'] = data['daily_vaccinations'].fillna(0)

data.to_csv('output_file.csv', index=False)
