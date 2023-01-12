-- Tasks to be performed
##############################################################################################################################################
--  1. Create new schema as ecommerce
CREATE SCHEMA ecommerce;
############################################################################################################################################## 
-- 2 Import .csv file users_data into MySQL
-- DONE
##############################################################################################################################################
-- 3. Run SQL command to see the structure of table
 USE ecommerce;
##############################################################################################################################################
-- 4 Run SQL command to select first 100 rows of the database
SELECT 
    *
FROM
    one
LIMIT 100;
##############################################################################################################################################
-- 5 How many distinct values exist in table for field country and language
SELECT 
    COUNT(DISTINCT (country)) AS Distict_Country,
    COUNT(DISTINCT (language)) AS Distinct_Language
FROM
    one;
##############################################################################################################################################
-- 6 Check whether male users are having maximum followers or female users
SELECT DISTINCT
    (gender), COUNT(gender) AS maximum_followers
FROM
    one
GROUP BY gender;
##############################################################################################################################################
-- 7 Calculate the total users those
-- a Uses Profile Picture in their Profile
SELECT 
    COUNT(hasProfilePicture) AS usesProfilePicture
FROM
    one
WHERE
    hasProfilePicture = 'TRUE';
-- --------------------------------------------------------------------------------------------------------------------------------------------
-- b Uses Application for Ecommerce platform
SELECT 
    COUNT(hasAnyApp) AS usessAnyApp
FROM
    one
WHERE
    hasAnyApp = 'TRUE';
-- --------------------------------------------------------------------------------------------------------------------------------------------
-- c Uses Android app
SELECT 
    COUNT(hasAndroidApp) AS usesAndroidApp
FROM
    one
WHERE
    hasAndroidApp = 'TRUE';
-- --------------------------------------------------------------------------------------------------------------------------------------------
-- d Uses ios app
SELECT 
    COUNT(hasIosApp) AS usesIosApp
FROM
    one
WHERE
    hasIosApp = 'TRUE';
##############################################################################################################################################
-- 8 Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers. 
-- (Hint: consider only those users having at least 1 product bought.)
SELECT DISTINCT
    (country), COUNT(productsBought) AS products
FROM
    one
WHERE
    productsBought >= 1
GROUP BY country
ORDER BY products DESC;
##############################################################################################################################################
-- 9 Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers. 
-- (Hint: consider only those users having at least 1 product sold.)
SELECT DISTINCT
    (country), COUNT(productsSold) AS products
FROM
    one
WHERE
    productsSold >= 1
GROUP BY country
ORDER BY products ASC;
##############################################################################################################################################
-- 10 Display name of top 10 countries having maximum products pass rate.
SELECT 
    country
FROM
    one
WHERE
    productsPassRate = (SELECT 
            MAX(productsPassRate)
        FROM
            one)
LIMIT 10;
##############################################################################################################################################
-- 11 Calculate the number of users on an ecommerce platform for different language choices. 
SELECT DISTINCT
    (language), COUNT(language) AS count
FROM
    one
GROUP BY language;
##############################################################################################################################################
-- 12 Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. 
-- (Hint: use UNION to answer this question.)

SELECT 
    'productsWished' as Choice ,COUNT(productsWished) as Count
FROM
    one
WHERE
    productsWished > 0 AND gender = 'F' 
UNION SELECT 'socialProductsLiked',
    COUNT(socialProductsLiked)
FROM
    one
WHERE
    socialProductsLiked > 0 AND gender = 'F';
##############################################################################################################################################    
-- 13 Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
SELECT 
    'productsSold' as Choice,COUNT(productsSold) as Count
FROM
    one
WHERE
    productsSold > 0 AND gender = 'M' 
UNION SELECT 'productsBought',
    COUNT(productsBought)
FROM
    one
WHERE
    productsBought > 0 AND gender = 'M';
##############################################################################################################################################
-- 14 Which country is having maximum number of buyers?
SELECT DISTINCT
    (country), COUNT(productsBought) AS max_buyers
FROM
    one
WHERE
    productsBought > 0
GROUP BY country
ORDER BY 2 DESC
LIMIT 1;
##############################################################################################################################################
-- 15 List the name of 10 countries having zero number of sellers.
SELECT 
    country
FROM
    one
WHERE
    productsSold = 0
LIMIT 10;
##############################################################################################################################################
-- 16 Display record of top 110 users who have used ecommerce platform recently.
SELECT 
    *
FROM
    one
ORDER BY daysSinceLastLogin asc
LIMIT 110;
##############################################################################################################################################
-- 17 Calculate the number of female users those who have not logged in since last 100 days.
SELECT 
    COUNT(gender) as Female
FROM
    one
WHERE
    daysSinceLastLogin > 100
        AND gender = 'F';
##############################################################################################################################################
-- 18 Display the number of female users of each country at ecommerce platform.
SELECT DISTINCT
    (country), COUNT(gender) AS female_count
FROM
    one
WHERE
    gender = 'F'
GROUP BY country; 
##############################################################################################################################################
-- 19 Display the number of male users of each country at ecommerce platform.
SELECT DISTINCT
    (country), COUNT(gender) AS female_count
FROM
    one
WHERE
    gender = 'M'
GROUP BY country; 
##############################################################################################################################################
-- 20 Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
 SELECT 
    country,
    AVG(productsSold) AS productsSold,
    AVG(productsBought) AS productsBought
FROM 
    one
WHERE
    gender = 'M'
GROUP BY country;
##############################################################################################################################################