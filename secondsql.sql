SELECT Device_type, 
       REPLACE(REPLACE(SUBSTRING(Stats_Access_Link, CHARINDEX('<url>', Stats_Access_Link) + 5, CHARINDEX('</url>', Stats_Access_Link) - CHARINDEX('<url>', Stats_Access_Link) - 5), 'https://', ''), 'http://', '') AS url
FROM my_table
WHERE Stats_Access_Link LIKE '%<url>%</url>%' 
  AND SUBSTRING(Stats_Access_Link, CHARINDEX('<url>', Stats_Access_Link) + 5, CHARINDEX('</url>', Stats_Access_Link) - CHARINDEX('<url>', Stats_Access_Link) - 5) NOT LIKE '%[^a-zA-Z0-9_.]%'
GROUP BY Device_type, 
         SUBSTRING(Stats_Access_Link, CHARINDEX('<url>', Stats_Access_Link) + 5, CHARINDEX('</url>', Stats_Access_Link) - CHARINDEX('<url>', Stats_Access_Link) - 5)
ORDER BY Device_type;
