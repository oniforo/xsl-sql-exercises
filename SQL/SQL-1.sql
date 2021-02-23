SELECT COUNT(*) 'RUS/GER Events' 
FROM tblEvent [event]
JOIN tblCountry country ON
	country.CountryId = [event].CountryId
WHERE
	country.CountryName LIKE '%Russia%' OR
	country.CountryName LIKE '%Germany%'
