# Iowa Liquor Sales BigQuery Google open database
#### A walkthrough of how I am practicing data analysis
#### See the .sql for my queries

## Introduction
I wanted to analyze a large dataset in a database and GCP has a $300 credit and 90 day free trial so I chose the Iowa Liquor Sales database on BigQuery. It's a daily updated database starting from sales in 2012, but I didn't use data from this year. I plan on using it later to test models on as the data comes out. I copied the data to my project and used the PREVIEW button to view the first 50 rows. The database has almost 29 million rows. 

![Picture1](https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ca5bd2f2-8b90-4c4a-b72d-00aebfaa1849)



This is also why I couldn't extract my data viz to public and link. You can do this with Tableau cloud but I don't want to pay for it so I just screenshot my data viz.

## Explore

First I wanted to see nulls

<img width="880" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/57352179-a601-42b3-b64d-18dd5c717e84">

My first viz is dynamic - you can click on rows of data on the tables and it will select the corresponding data in the other tables. Also i left out the legend for the map because when you hover over the bubbles the sales # populate:

<img width="880" alt="Screenshot 2024-05-01 at 8 14 45 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ccd978a0-1825-4bcb-9070-a708dbb8591e">

At this point I wasn't sure yet what I was interested in. I did make the data viz together with exploring the data because I wanted to practice Tableau. I tried to graph some more general big picture data and found the second graph on this viz interesting. AMERICAN VODKAS doesnt show any sales before 2016:

<img width="880" alt="Screenshot 2024-05-01 at 8 15 08 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/5f23482c-8b32-4528-bad6-51da756c8de4">

I queried the database to confirm what I saw on Tableau:

<img width="193" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/b434fdc3-c6af-4942-af5d-9b837f06cc11">

This was interesting because AMERICAN VODKAS is #2 all time in total sales but it doesnt have any sales in the database from 2012-2015. I wanted to see if maybe the category_name was different so I queried the database using item_description and TITO'S HANDMADE VODKA:

<img width="702" alt="Screenshot 2024-05-01 at 9 21 10 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/9dabc1c2-2f8d-4c65-8df3-871125fb9916">

## Updating / AMERICAN VODKAS focus

The category_name was VODKA 80 PROOF before 2016. In 2016 the database lists these vodkas as a mix of AMERICAN VODKAS and VODKA 80 PROOF thats why the previous chart shows the AMERICAN VODKAS line with such few sales. In 2017 the rebranded ones were all full changed and you can see that from the graph where there is a steep increase between 2016 and 2017. I queried the top 5 AMERICAN VODKAS by sales and decided that I wanted to concentrate my analysis on this segment of the data. 


<img width="468" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/e0b5cefc-7138-4ce0-b2a7-2912e2ee4a24">

I updated rows in the database that were incorrectly labeled. Delete a couple entries showing in Colorado and fixed the coordinates for a store that was in Minnesota. I discovered these data when I made my map data viz and the city with the most sales was not showing up.

<img width="385" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/1f83eb33-e46f-47c0-bcce-d2d445a8088c">

I plotted the top 5 AMERICAN VODKAS by their item_description and found that SMIRNOFF 80PRF didn’t have data before 2016. Queried total Smirnoff% sales and found that the names of the bottles were different for plastic and regular and before 2016. Used the same approach to analyze the other top vodkas and found that they all were separated by PET also

<img width="468" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/2d53fc05-f4de-4077-a3f5-aa1842a8e377">

<img width="468" alt="Picture2" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/a459b1ae-3456-41c1-8158-71b48bf2e552">

At this point I realized all the liquors if sold in plastic bottles would have a separate item_description so total sales would be different when compared to a brand that doesn’t sell in plastic bottles like Tito’s. I decided to focus my analysis on top 5 vodkas and aggregate their data into one item_description each not counting the mini sizes and 100 proofs. I kept the category_name the same because this might be interesting to explore later on. 

I took a snapshot of my database then proceeded to update. I needed to aggregate the top 5 Vodkas together to compared them accurately. Did these for HAWKEYE VODKA, BARTON VODKA, and FIVE O’CLOCK VODKA.  Titos isn’t sold in a plastic bottle but it was in the database as TITO VODKA without “HANDMADE” I decide to aggregate the two into just TITOS HANDMADE VODKA.

<img width="363" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/3ad06c88-83d9-4561-b77d-15ca852879ff">

<img width="363" alt="Picture2" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/c530a536-5f1b-4656-837a-30f7e443832d">

The next viz are taking a deeper look into Titos and AMERICAN VODKAS by sales count dynamic:

<img width="880" alt="Screenshot 2024-05-01 at 8 15 26 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/cfe2ac8d-e4fe-4cf2-93ca-bd936f7447ca">

Top Stores Total Sales:

<img width="880" alt="Screenshot 2024-05-01 at 8 15 18 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/9137710d-539c-42b7-8690-3769956fa82e">

Top Vodkas Total Sales 2012-2023 and After the got rebranded to AMERICAN VODKAS 2017-2023

<img width="880" alt="Screenshot 2024-05-01 at 8 31 25 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/18adcc1e-951d-4482-813a-a708e20165c5">

### I am working to finish this project please come back soon to see my analysis. I plan on using my Data Science skills from ASU to scrape a weather website with Selenium and get daily weather statistics for Des Moines the top total alcohol sales city in Iowa. I will use this data to see if there is a relationship between total sales, sales counts and the weather.
