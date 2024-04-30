import pandas as pd
import requests
from bs4 import BeautifulSoup

url = 'https://datacentral.desmoinesregister.com/weather-data/iowa/19/1927-04-01/table/'

response = requests.get(url)
html_content = response.content

# Parse the HTML content using BeautifulSoup
soup = BeautifulSoup(html_content, "html.parser")

# Find the table element
table = soup.find("table")

# Extract table rows
rows = table.find_all("tr")

# Initialize lists to store data
data = []

# Iterate over rows and extract data
for row in rows:
    cells = row.find_all(["th", "td"])
    row_data = [cell.get_text(strip=True) for cell in cells]
    data.append(row_data)

# Remove empty rows
data = [row for row in data if row]

# Convert data to DataFrame
df = pd.DataFrame(data[1:], columns=data[0])

# Rename columns for clarity
df.columns = ["Month", "Max Temp (°F)", "Min Temp (°F)", "Mean Temp (°F)", "Precipitation (in)", "Sales", "Promotions"]

# Display the DataFrame
print(df)

df.to_csv('combined_data.csv', index=False)
