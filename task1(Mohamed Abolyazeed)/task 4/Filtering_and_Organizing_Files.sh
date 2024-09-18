#!/bin/bash

# Define an array with file names
files=(
    "domains.txt"
    "email_addresses.txt"
    "social_media.txt"
    "comments.txt"
    "addresses.txt"
    "system_numbers.txt"
    "phone_numbers.txt"
    "name_servers.txt"
    "ipv4_addresses.txt"
    "ipv6_addresses.txt"
)

# Output file name
output_file="all_data.txt"

# Concatenate all files with a space between each file's content
for file in "${files[@]}"; do
    echo "===== ${file%.*} =====" >> "$output_file"
    cat "$file" >> "$output_file"
    echo >> "$output_file"
done

# Remove duplicates and sort the data
sort -u "$output_file" > "$temp_file" && mv "$temp_file" "$output_file"

echo "All data has been concatenated and saved to $output_file"
