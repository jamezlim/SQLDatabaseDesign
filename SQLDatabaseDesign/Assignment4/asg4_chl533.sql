/* Comparison of US economic indexes and its' relation to number of housing construction began
(Comparison of Unempolyment rate, number of houses that started construction, federal interest rate) */

DROP TABLE IF EXISTS 'indexes';
CREATE TABLE IF NOT EXISTS 'indexes' (
	'yearMonth'  INTEGER NOT NUll,
	'unemploymentRate' INTEGER,
	'numOfConstruction' INTEGER,
	'fedInterestRate' INTEGER,
	'changeInUnemploymentRate' REAL, 
	'changeInNumOfConstruction' REAL, 
	'changeInFedInterestRate' REAL, 
    PRIMARY KEY('yearMonth')
);

.mode column 
.separator ","
.import asg4_chl533.csv indexes 