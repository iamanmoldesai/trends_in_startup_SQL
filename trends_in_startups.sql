SELECT * FROM trends_in_startups.startups;

#total number of companies
SELECT COUNT(name)
FROM trends_in_startups.startups;

#total value of all companies
SELECT SUM(valuation)
FROM trends_in_startups.startups;

#highest amount raised by a startup
SELECT MAX(raised)
FROM trends_in_startups.startups;

#maximum amount of money raised, during ‘Seed’
SELECT MAX(raised)
FROM trends_in_startups.startups
WHERE stage = 'Seed';

# what year was the oldest company on the list founded?
SELECT MIN(founded)
FROM trends_in_startups.startups;

#Let's find out the valuations among different sectors:
#average valuation, in each category
SELECT category, AVG(valuation)
FROM trends_in_startups.startups
GROUP BY category
LIMIT 10;

#average valuation, in each category. Rounding the averages to two decimal places
SELECT category, ROUND(AVG(valuation))
FROM trends_in_startups.startups
GROUP BY category
LIMIT 10;

#average valuation, in each category. Rounding the averages to two decimal places. Lastly, ordering the list from highest averages to lowest
SELECT category, ROUND(AVG(valuation), 2)
FROM trends_in_startups.startups
GROUP BY category
ORDER BY 2
LIMIT 10;




#What are the most competitive markets?

SELECT DISTINCT category, COUNT(name)
FROM trends_in_startups.startups
GROUP BY 1;

SELECT DISTINCT category, COUNT(name) AS company
FROM trends_in_startups.startups
GROUP BY 1
HAVING company > 3;



#Let's see if there's a difference in startups sizes among different locations:

SELECT location, AVG(employees)
FROM trends_in_startups.startups
GROUP BY location;

SELECT location, AVG(employees) AS size
FROM trends_in_startups.startups
GROUP BY location
HAVING size > 500;