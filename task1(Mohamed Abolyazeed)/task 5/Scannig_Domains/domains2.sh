#!/bin/bash

# Assume the scan results are in 'scan_results.txt'
input_file="output_all_domains.txt"
output_file="filtered_output_domains2.txt"

# Clear the output file before starting
> $output_file

# Extract lines with open ports and include domain and IP information
grep "open" $input_file | awk '/Nmap scan report/{domain=$5; ip=$6} /open/ {print domain, ip, $0}' > $output_file
