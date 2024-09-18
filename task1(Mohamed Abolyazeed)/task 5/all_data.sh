#!/bin/bash

# Assume the scan results are in 'all_ips.txt'
input_file="output_all_data.txt"
output_file="filtered_output_all_data.txt"

# Clear the output file before starting
> $output_file

# Filter the results to extract IP addresses and open ports
awk '/Nmap scan report/{ip=$5} /open/ {print ip, $0}' $input_file > $output_file
