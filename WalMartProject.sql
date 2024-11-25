 USE SALES;

SELECT * FROM WMSD LIMIT 5;

#How many unique cities does the data have?
SELECT DISTINCT CITY FROM WMSD;

#In which city is each branch?
SELECT  CITY
FROM WMSD
GROUP BY CITY
HAVING COUNT(DISTINCT BRANCH) = (SELECT COUNT(DISTINCT BRANCH) FROM WMSD);

# How many unique product lines does the data have?
SELECT DISTINCT `PRODUCT LINE`
FROM WMSD;

#What is the most selling product line
SELECT `PRODUCT LINE`, COUNT(`INVOICE ID`) AS COUNT_PRO_LINE
FROM WMSD
GROUP BY `PRODUCT LINE`
ORDER BY COUNT_PRO_LINE DESC
LIMIT 1;

# What is the total revenue by month
SELECT DATE_FORMAT(DATE, '%Y - %M') AS E_MONTH, SUM(TOTAL) AS REVENUE
FROM WMSD
GROUP BY E_MONTH;

SELECT * FROM WMSD
LIMIT 5;

#What month had the largest COGS?
SELECT DATE_FORMAT(DATE, '%Y - %M') AS E_MONTH, MAX(COGS) AS COGS
FROM WMSD
GROUP BY E_MONTH
ORDER BY COGS DESC
LIMIT 1;

#What product line had the largest revenue?
SELECT `PRODUCT LINE`, SUM(TOTAL) AS REVENUE
FROM WMSD
GROUP BY `PRODUCT LINE`
ORDER BY REVENUE DESC
LIMIT 1;

# What is the city with the largest revenue
SELECT CITY, SUM(TOTAL) AS REVENUE
FROM WMSD
GROUP BY CITY
ORDER BY REVENUE DESC
LIMIT 1;

SELECT * FROM WMSD
LIMIT 1;

#What product line had the largest VAT
SELECT `PRODUCT LINE`, MAX(`TAX 5%`) AS MAX_VAT
FROM WMSD
GROUP BY `PRODUCT LINE`
ORDER BY MAX_VAT DESC
LIMIT 1;

#Fetch each product line and add a column to those product 
#line showing "Good", "Bad". Good if its greater than average sales?
SELECT `PRODUCT LINE`, SUM(TOTAL) AS TOTAL,
CASE
	WHEN SUM(TOTAL) > (SELECT AVG(TOTAL) 
    FROM(SELECT SUM(TOTAL) AS TOTAL 
    FROM WMSD GROUP BY `PRODUCT LINE`) AS AGV_SALES) 
    THEN 'GOOD'
    ELSE 'BAD'
END AS PERFORMANCE
FROM WMSD
GROUP BY `PRODUCT LINE`;

SELECT * FROM WMSD LIMIT 1;

#Which branch sold more products than average product sold?
SELECT BRANCH, SUM(QUANTITY) AS TOTAL_SOLD
FROM WMSD
GROUP BY BRANCH
HAVING SUM(QUANTITY) > (SELECT AVG(TOTAL_SOLD) 
FROM (SELECT SUM(QUANTITY) AS TOTAL_SOLD 
FROM WMSD 
GROUP BY BRANCH) AS AVG_SOLD);

#What is the most common product line by gender?
SELECT GENDER, `PRODUCT LINE`, COUNT(*) AS MOST_COMMON_PRODUCT_LINE
FROM WMSD
GROUP BY GENDER, `PRODUCT LINE`
HAVING MOST_COMMON_PRODUCT_LINE = (SELECT MAX(MOST_COMMON_PRODUCT_LINE) FROM WMSD ;

SELECT * FROM WMSD LIMIT 2;

# What is the average rating of each product line
SELECT `PRODUCT LINE`, AVG(RATING) AS AVG_RATING
FROM WMSD 
GROUP BY `PRODUCT LINE`;

#How many unique customer types does the data have?
SELECT COUNT(DISTINCT `CUSTOMER TYPE`) AS UNIQUE_CUSTOMER_TYPE
FROM WMSD;

#How many unique payment methods does the data have?
SELECT COUNT(DISTINCT PAYMENT) AS UNIQUE_PAYMENT_MODES
FROM WMSD;

#What is the most common customer type?
SELECT `CUSTOMER TYPE`, COUNT(*) AS COMMON_CUS_TYPE
FROM WMSD
GROUP BY `CUSTOMER TYPE`
ORDER BY COMMON_CUS_TYPE DESC 
LIMIT 1;

#Which customer type buys the most?
SELECT `CUSTOMER TYPE`, SUM(TOTAL) AS BUYS_MOST
FROM WMSD 
GROUP BY `CUSTOMER TYPE`
ORDER BY BUYS_MOST DESC
LIMIT 1;

#What is the gender of most of the customers
SELECT GENDER, COUNT(`CUSTOMER TYPE`) AS MOST_CUS
FROM WMSD
GROUP BY GENDER;

#What is the gender distribution per branch?
SELECT BRANCH, GENDER, COUNT(*) AS TOTAL_COUNT
FROM WMSD
GROUP BY BRANCH, GENDER;

#Which time of the day do customers give most ratings?
SELECT HOUR(TIME), COUNT(RATING) AS RATINGS
FROM WMSD
GROUP BY HOUR(TIME)
ORDER BY RATINGS DESC
LIMIT 1;

#Which day of the week has the best avg ratings?
SELECT DAYNAME(DATE) AS DAY_OF_WEEK, AVG(RATING) AS AVG_RATING
FROM WMSD
GROUP BY DAY_OF_WEEK
ORDER BY AVG_RATING DESC 
LIMIT 1;

#Which day of the week has the best average ratings per branch?
SELECT BRANCH,DAYNAME(DATE) AS DAY_OF_WEEK, AVG(RATING) AS AVG_RATING
FROM WMSD
GROUP BY BRANCH,DAY_OF_WEEK
ORDER BY AVG_RATING DESC;

#Number of sales made in each time of the day per weekday?
SELECT DAYNAME(DATE) AS DAY_OF_WEEK, HOUR(TIME) AS HOUR_OF_DAY, COUNT(*) AS TOTAL_SALES
FROM WMSD
GROUP BY DAY_OF_WEEK, HOUR_OF_DAY;

#Which of the customer types brings the most revenue?
SELECT `CUSTOMER TYPE`, SUM(`UNIT PRICE` * QUANTITY) AS REVENUE
FROM WMSD
GROUP BY `CUSTOMER TYPE`
ORDER BY REVENUE DESC
LIMIT 1;

#Which city has the largest tax/VAT percent?
SELECT CITY, MAX(`TAX 5%`) AS LARGE_TAX
FROM WMSD
GROUP BY CITY
ORDER BY LARGE_TAX DESC
LIMIT 1;

#Which customer type pays the most in VAT?
SELECT `CUSTOMER TYPE`, MAX(`TAX 5%`) AS MOST_VAT
FROM WMSD
GROUP BY `CUSTOMER TYPE`
ORDER BY MOST_VAT DESC
LIMIT 1;

#Find the total number of transactions where the total sales amount is 
#greater than $500 and the payment method is 'Card'
SELECT COUNT(*) AS NO_OF_TRANSACTIONS 
FROM WMSD 
WHERE TOTAL > 90 AND PAYMENT = "Credit card";

#Retrieve the total sales for transactions that occurred either in 
#'City A' or 'City B' or for the product line 'Product Line X' or 'Product Line Y'
SELECT SUM(TOTAL) AS SUM_TOTAL 
FROM WMSD
WHERE CITY = "A" OR CITY = "B" OR `PRODUCT LINE` = "Health and beauty" OR `PRODUCT LINE` = "Food and beverages";

#Determine the total sales and count of transactions where the payment method is not 'Cash'
SELECT COUNT(*) AS NO_OF_TRANSACTIONS, SUM(TOTAL) AS SUM_TOTAL
FROM WMSD
WHERE NOT PAYMENT = "CASH";

#Combine data from product lines and cities to analyze total sales
SELECT W1.CITY AS CITY, W1.`PRODUCT LINE` AS PRODUCT_LINE_1, W2.`PRODUCT LINE` AS SER, SUM(TOTAL) AS TOTAL_SALES
FROM WMSD W
JOIN WMSD W ON W.CITY = W.CITY
AND W.`PRODUCT LINE` <> W.`PRODUCT LINE` 
GROUP BY CITY, `PRODUCT LINE`;