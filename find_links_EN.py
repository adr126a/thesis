import requests
import regex
import sys

# Prompt the user to enter a URL
url = input('Enter a URL: ')

# Perform a GET request to connect to the specified URL
# and store all the external hyperlinks in the variable 'website'
website = requests.get(url)

# Define 'html' as the unicode text content of the 'website' variable
html = website.text

# Use regex.findall to locate all occurrences of web links starting with http or ftp,
# and store these matches in the 'links' variable
links = regex.findall('"((http|ftp)s?://.*?)"', html)

# Using a for loop with enumerate to print out the links and their corresponding line number
for n, link in enumerate(links):
    print(n, "\t", link[0])

# Exit the script after printing the list of external links
sys.exit("\nApplication terminated")
