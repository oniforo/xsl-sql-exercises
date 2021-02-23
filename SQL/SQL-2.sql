SELECT country.CountryName, COUNT(*) 'Event Count' 
FROM tblEvent [event]
JOIN tblCountry country ON 
	country.CountryId = [event].CountryId
WHERE 
	[event].EventDate >= '1990-01-01' AND
	[event].EventDate < '2000-01-01'
GROUP BY country.CountryName
