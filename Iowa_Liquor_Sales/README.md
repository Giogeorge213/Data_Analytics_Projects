<img width="1001" alt="Screenshot 2024-05-16 at 11 43 21 AM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/e8a8f34b-0805-42fb-85b7-7004f42969d3"># Iowa Liquor Sales BigQuery Google open database
#### A walkthrough of how I am practicing data analysis
#### See the .sql for my queries

## Introduction
I wanted to analyze a large dataset in a database and GCP has open databases so I chose the Iowa Liquor Sales database on BigQuery. It's a daily updated database starting from sales in 2012, but I didn't use data from this year. I plan on using 2024 data later to test models on as the data comes out. I copied the data to my project and used the PREVIEW button to view the first 50 rows. The database has almost 29 million rows. 

![Picture1](https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ca5bd2f2-8b90-4c4a-b72d-00aebfaa1849)


## Explore

First I wanted to see nulls

<img width="880" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/57352179-a601-42b3-b64d-18dd5c717e84">

The way I approached these was to just leave them be. The most significant amount of nulls is store location 2.5mil which is the latitude and longitude. I ended up inputting these for top 20 cities in total sales in Tableau when my map viz wouldnt populate. I didn't link the viz because I dont have a tableau cloud account. 

<img width="1001" alt="Screenshot 2024-05-16 at 11 43 21 AM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/b5e0768f-a5b5-489a-b050-556152a49515">


- CANADIAN WHISKEY is the top category in total sales from 2012-2023 followed closely by AMERICAN VODKAS 

- DES MOINES is the top city in total sales with CEDAR RAPIDS a distant second with almost half has many

- DES MOINES has almost double the sales of AMERICAN VODKAS compared to the next closest city

At this point I wasn't sure yet what I was interested in. I did make the data viz together with exploring the data because I wanted to practice Tableau and my SQL queries at the same time

<img width="995" alt="Screenshot 2024-05-16 at 11 57 54 AM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/9905ea60-42d2-4be6-a856-aebe1765b6fb">


- Total sales seems to follow a cyclical trend with peaks of sales in October and December following troughs at the beginning of each year
- There are no recorded sales of AMERICAN VODKAS before 2016 yet by 2017, it was the highest total sales liquor

After making a few queries I discovered that various vodkas were renamed starting 2016. The top selling vodka, Titos, being one of them. 

<img width="468" alt="image" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/f8e7d9e7-abe1-4cd0-a517-6c5fb2e28864">

Queried the top selling AMERICAN VODKAS and discovered they are named differently if in plastic bottles 

<img width="387" alt="image" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/b0b91924-52b2-4260-80e9-5c6ac0a57269">

At this point, I decided to make the focus of my analysis AMERICAN VODKAS. I wanted to compare the top 5 AMERICAN VODKAS by total sales. In order to do this I -- 
1. Created a separate table with just the AMERICAN VODKAS I was interested in
2. Use a stored procedure to add each AMERICAN VODKAS after making the initial table
3. Cleaned and prepped the table by combining PET variants into single brand fields dropped the mini varients




  



