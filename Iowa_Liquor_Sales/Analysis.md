# Iowa Liquor Sales BigQuery Google open database
### See the .sql for my queries

## Introduction
I wanted to analyze a large dataset in a database and GCP has a $300 credit and 90 day free trial so I chose the Iowa Liquor Sales database on BigQuery. It's a daily updated database, but I didn't use data from this year. Used the PREVIEW button to view the first 50 rows. The database has almost 29 million rows. 

![Picture1](https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ca5bd2f2-8b90-4c4a-b72d-00aebfaa1849)



This is also why I couldn't extract my data viz to public and link. You can do this with Tableau cloud but I don't want to pay for it so I just screenshot my data viz.

## Data Updating

First I wanted to see nulls

<img width="880" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/57352179-a601-42b3-b64d-18dd5c717e84">

I updated rows in the database that were incorrectly labeled. Delete a couple entries showing in Colorado and fixed the coordinates for a store that was in Minnesota. I discovered these data when I made my map data viz and the city with the most sales was not showing up. 

<img width="385" alt="Picture1" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/1f83eb33-e46f-47c0-bcce-d2d445a8088c">





<img width="880" alt="Screenshot 2024-05-01 at 8 14 45 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/ccd978a0-1825-4bcb-9070-a708dbb8591e">

<img width="880" alt="Screenshot 2024-05-01 at 8 15 08 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/5f23482c-8b32-4528-bad6-51da756c8de4">

<img width="880" alt="Screenshot 2024-05-01 at 8 15 26 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/cfe2ac8d-e4fe-4cf2-93ca-bd936f7447ca">

<img width="880" alt="Screenshot 2024-05-01 at 8 15 18 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/9137710d-539c-42b7-8690-3769956fa82e">

<img width="880" alt="Screenshot 2024-05-01 at 8 31 25 PM" src="https://github.com/Giogeorge213/Data_Analytics_Projects/assets/98611938/18adcc1e-951d-4482-813a-a708e20165c5">
