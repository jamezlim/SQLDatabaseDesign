#1
SELECT count(*) FROM indexes;

#2
SELECT * 
FROM indexes
ORDER BY yearMonth DESC
LIMIT 10;

#3 Since my dataset did not have alphabetical records i ordered in chronological order 
#under the permission of the professor  
SELECT yearMonth,unemploymentRate,numOfConstruction,changeInNumOfConstruction
FROM indexes
ORDER BY yearMonth
LIMIT 10;

#4
SELECT unemploymentRate, AVG(numOfConstruction), AVG(fedInterestRate)
From indexes
GROUP BY unemploymentRate
ORDER BY unemploymentRate;

#5
SELECT ("For the Year/Month " || yearMonth ||" the unemployment was "||unemploymentRate||"% and the corresponding Federal Interest Rate was "||fedInterestRate||"%.") AS years
FROM indexes
ORDER BY yearMonth
LIMIT 15;

#6 indexes during the period before and after 911 
SELECT yearMonth, unemploymentRate, fedInterestRate, changeInUnemploymentRate, changeInFedInterestRate
FROM indexes
WHERE yearMonth LIKE "2001%" OR yearMonth LIKE "2002%"
ORDER BY yearMonth;

#7 year, unemploymentRate of the year with the highest increase in unemployment 
SELECT yearMonth, unemploymentRate, MAX(changeInUnemploymentRate)
FROM indexes;  

#8 the number of timeperiods where if unemploymnet increased number of constructions started decreased 
SELECT COUNT(yearMonth)
FROM indexes 
WHERE changeInUnemploymentRate > 0 AND changeInNumOfConstruction < 0;

#9 the number of timeperiods where if unemploymnet decreased number of constructions started increased 
SELECT COUNT(yearMonth)
FROM indexes 
WHERE changeInUnemploymentRate < 0 AND changeInNumOfConstruction > 0;

#10 return the range of unemploymentRate and federalInterestRate
SELECT "Unemployment rate is between "|| MIN(unemploymentRate)||" and "||MAX(unemploymentRate) 
FROM indexes;

#11 find out whether for the same unemploymentRate, the range of numOfConstuction and fedInterestRate is similar 
SELECT unemploymentRate, MIN(numOfConstruction), MAX(numOfConstruction), MIN(fedInterestRate), MAX(fedInterestRate)
FROM indexes
GROUP BY unemploymentRate
ORDER BY unemploymentRate DESC;

#12 the average number of houses started construction in the 21st century 
SELECT AVG(numOfConstruction)
FROM indexes 
WHERE yearMonth Like "20%";

#13 the average number of houses started construction in the 20th cetury 
SELECT AVG(numOfConstruction)
FROM indexes 
WHERE yearMonth LIKE "19%";

#14 search the years in which the federal interest rate was below 1% 
SELECT yearMonth, fedInterestRate, unemploymentRate
FROM indexes
Where fedInterestRate < 1
ORDER BY fedInterestRate;

#15 select years adjacent to the great recession 
SELECT *
FROM indexes
WHERE yearMonth > 200800 AND yearMonth < 201500;
