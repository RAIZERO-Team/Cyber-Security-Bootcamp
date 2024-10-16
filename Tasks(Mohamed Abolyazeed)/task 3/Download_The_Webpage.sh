#!/bin/bash

# Second, download the webpages
echo "Please provide the needed domain (e.g., www.facebook.com):"
read Domain

echo "Please name the output file (without .html extension):"
read FileName

echo "Great, I am going to find the index page of $Domain"

# Download the webpage using wget
wget "https://$Domain" -O "$FileName.html"

# Check if the file was created successfully
if [[ -f "$FileName.html" ]]; then
    echo "The page has been successfully downloaded to $FileName.html"
else
    echo "Failed to download the page."
fi

