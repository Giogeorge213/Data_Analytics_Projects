## Find number of nulls in the database
SELECT
    COUNT(CASE WHEN invoice_and_item_number IS NULL THEN 1 END) AS invoice_and_item_number_null_count,
    COUNT(CASE WHEN date IS NULL THEN 1 END) AS date_null_count,
    COUNT(CASE WHEN store_number IS NULL THEN 1 END) AS store_number_null_count,
    COUNT(CASE WHEN store_name IS NULL THEN 1 END) AS store_name_null_count,
    COUNT(CASE WHEN address IS NULL THEN 1 END) AS address_null_count,
    COUNT(CASE WHEN city IS NULL THEN 1 END) AS city_null_count,
    COUNT(CASE WHEN zip_code IS NULL THEN 1 END) AS zip_code_null_count,
    COUNT(CASE WHEN store_location IS NULL THEN 1 END) AS store_location_null_count,
    COUNT(CASE WHEN county_number IS NULL THEN 1 END) AS county_number_null_count,
    COUNT(CASE WHEN county IS NULL THEN 1 END) AS county_null_count,
    COUNT(CASE WHEN category IS NULL THEN 1 END) AS category_null_count,
    COUNT(CASE WHEN category_name IS NULL THEN 1 END) AS category_name_null_count,
    COUNT(CASE WHEN vendor_number IS NULL THEN 1 END) AS vendor_number_null_count,
    COUNT(CASE WHEN vendor_name IS NULL THEN 1 END) AS vendor_name_null_count,
    COUNT(CASE WHEN item_number IS NULL THEN 1 END) AS item_number_null_count,
    COUNT(CASE WHEN item_description IS NULL THEN 1 END) AS item_description_null_count,
    COUNT(CASE WHEN pack IS NULL THEN 1 END) AS pack_null_count,
    COUNT(CASE WHEN bottle_volume_ml IS NULL THEN 1 END) AS bottle_volume_ml_null_count,
    COUNT(CASE WHEN state_bottle_cost IS NULL THEN 1 END) AS state_bottle_cost_null_count,
    COUNT(CASE WHEN state_bottle_retail IS NULL THEN 1 END) AS state_bottle_retail_null_count,
    COUNT(CASE WHEN bottles_sold IS NULL THEN 1 END) AS bottles_sold_null_count,
    COUNT(CASE WHEN sale_dollars IS NULL THEN 1 END) AS sale_dollars_null_count,
    COUNT(CASE WHEN volume_sold_liters IS NULL THEN 1 END) AS volume_sold_liters_null_count,
    COUNT(CASE WHEN volume_sold_gallons IS NULL THEN 1 END) AS volume_sold_g_null_count
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`

## Found a store with incorrectly labeled zip code because it showed up in Minnesota when I was trying to make a Data Viz on Tableau.
## Updated the database

UPDATE `blissful-sled-420621.Iowa_Liquor_Sales.sales`
SET zip_code = '52601'
WHERE zip_code = '56201';

## Found 2 rows with data from Colorado Springs 
DELETE
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE  City = ‘COLORADO SPRINGS’

## Wanted to find what cities had the most null values for location so my map viz would be accurate found out the city with most 
## total sales had the most nulls values. Input the coordinates on my Tableau Data Viz for the top 20 corresponding to my dynamic 
## map/chart.

SELECT city, COUNT(*) AS null_count
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE store_location IS NULL
GROUP BY city
ORDER BY null_count DESC;

## Took a look at AMERICAN VODKAS and found that there weren’t any AMERICAN VODKAS before 2016

SELECT EXTRACT(YEAR FROM sales.date) AS year
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales` AS sales
WHERE sales.category_name = 'AMERICAN VODKAS'
GROUP BY 1
ORDER BY Year

## Queried an item_description that was classified as AMERICAN VODKAS to see if there were indeed sales before 2016 found out it
## was categorized as VODKA 80 PROOF before. Also realized I might have to aggregate the names for each item_description if I want 
## to compare them further.

SELECT item_description, category_name, EXTRACT(YEAR FROM date) AS year, SUM(sale_dollars) as sales
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE item_description LIKE 'TITOS%'
GROUP BY item_description,category_name,year
ORDER BY year

## 2016 various vodkas had a renamed item_description field the one with highest sales being Tito’s as AMERICAN VODKAS.
SELECT category_name,item_description,EXTRACT(YEAR FROM date) AS year, SUM(sale_dollars) AS sales
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE category_name = 'AMERICAN VODKAS'
AND EXTRACT(YEAR FROM date) = 2016
GROUP BY category_name, year, item_description
ORDER BY sales DESC

## I plotted the top 5 AMERICAN VODKAS by their item_description and found that SMIRNOFF 80PRF didn’t have data before 2016. 
##Queried total Smirnoff% sales and found that the names of the bottles were different for plastic and regular and before 2016. 
## Used the same approach to analyze the other top vodkas and found that they all were separated by PET also

SELECT  item_description, category_name,  SUM(sale_dollars) as sales
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE item_description LIKE 'SMIRNOFF%' 
GROUP BY category_name, item_description
ORDER BY sales DESC

## I took a snapshot of my database then proceeded to update. I needed to aggregate the top 5 Vodkas together to compared them 
## accurately. Did these for HAWKEYE VODKA, BARTON VODKA, and FIVE O’CLOCK VODKA.  Titos isn’t sold in a plastic bottle but it was
## in the database as TITO VODKA without “HANDMADE” I decide to aggregate the two into just TITOS HANDMADE VODKA.

UPDATE `blissful-sled-420621.Iowa_Liquor_Sales.sales`
SET item_description = 'SMIRNOFF 80PRF'
WHERE item_description IN (
    'SMIRNOFF VODKA 80 PRF',
    'VODKA 80 PROOF',
    'SMIRNOFF 80PRF PET',
    'AMERICAN VODKAS',
    'SMIRNOFF VODKA 80 PRF PET',
    'VODKA 80 PROOF',
    'SMIRNOFF PET 80PRF')

UPDATE `blissful-sled-420621.Iowa_Liquor_Sales.sales`
SET item_description = "TITOS HANDMADE VODKA"
WHERE item_description = "TITOS VODKA"

## I wanted to see how the top 5 AMERICAN VODKAS were classified in 2016 and 2017. 2017 they were all fully classified as 
## AMERICAN VODKAS instead of VODKA 80PRF


SELECT item_description, category_name,  COUNT(item_number) as num_orders
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE (item_description = 'TITOS HANDMADE VODKA' OR item_description = 'HAWKEYE VODKA' 
OR item_description = 'SMIRNOFF 80PRF' OR item_description = "FIVE O'CLOCK VODKA" OR
item_description = 'BARTON VODKA' )
AND EXTRACT(YEAR FROM date) = 2016
GROUP BY category_name, item_description
ORDER BY item_description

SELECT item_description, category_name,  COUNT(item_number) as num_orders
FROM `blissful-sled-420621.Iowa_Liquor_Sales.sales`
WHERE (item_description = 'TITOS HANDMADE VODKA' OR item_description = 'HAWKEYE VODKA' 
OR item_description = 'SMIRNOFF 80PRF' OR item_description = "FIVE O'CLOCK VODKA" OR
item_description = 'BARTON VODKA' )
AND EXTRACT(YEAR FROM date) = 2017
GROUP BY category_name, item_description
ORDER BY item_description


