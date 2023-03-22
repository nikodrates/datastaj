import pandas as pd

data = pd.read_csv('country_vaccination_stats.csv')

data['daily_vaccinations'] = data.groupby('country')['daily_vaccinations'].transform(lambda x: x.fillna(x.min()))

data_median = data.groupby('country')['daily_vaccinations'].median().reset_index()

top_countries = data_median.sort_values(by='daily_vaccinations', ascending=False).head(3)

print('Top-3 countries with highest median daily vaccination numbers:')

print(top_countries)
