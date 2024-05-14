# Iowa Liquor Sales BigQuery Google open database
#### A walkthrough of how I am practicing data analysis
#### See the .sql for my queries

## Introduction
I wanted to analyze a large dataset in a database and GCP has a $300 credit and 90 day free trial so I chose the Iowa Liquor Sales database on BigQuery. It's a daily updated database starting from sales in 2012, but I didn't use data from this year. I plan on using 2024 data later to test models on as the data comes out. I copied the data to my project and used the PREVIEW button to view the first 50 rows. The database has almost 29 million rows. 

![Picture1](https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ca5bd2f2-8b90-4c4a-b72d-00aebfaa1849)


## Explore

First I wanted to see nulls

<img width="880" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/57352179-a601-42b3-b64d-18dd5c717e84">

The way I approached these was to just leave them be. The most significant amount of nulls is store location 2.5mil which is the latitude and longitude. I ended up inputting these for top 20 cities in total sales in Tableau when my map viz wouldnt populate. 

<img width="994" alt="Screenshot 2024-05-14 at 3 25 26 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/4ff59dc9-ec89-4851-ad78-10789c1fa56e">


-CANADIAN WHISKEY is the top category in total sales from 2012-2023 followed closely by AMERICAN VODKAS 

-DES MOINES is the top city in total sales with CEDAR RAPIDS a distant second with almost half has many

At this point I wasn't sure yet what I was interested in. I did make the data viz together with exploring the data because I wanted to practice Tableau and my SQL queries at the same time. 




