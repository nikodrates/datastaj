CREATE TEMPORARY TABLE median_vaccinations AS 
SELECT country, MEDIAN(daily_vaccinations) AS median_vaccinations
FROM vaccinations
WHERE daily_vaccinations IS NOT NULL
GROUP BY country;

UPDATE vaccinations
SET daily_vaccinations = COALESCE(daily_vaccinations, 
                                   (SELECT median_vaccinations 
                                    FROM median_vaccinations 
                                    WHERE country = vaccinations.country))
WHERE EXISTS (SELECT 1 FROM median_vaccinations WHERE country = vaccinations.country);

UPDATE vaccinations
SET daily_vaccinations = 0
WHERE daily_vaccinations IS NULL;