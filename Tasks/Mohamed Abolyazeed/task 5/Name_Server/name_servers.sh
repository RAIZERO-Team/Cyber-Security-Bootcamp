#!/bin/bash

domains=$(cat name_servers.txt)

for domain in $domains; do
  nmap -A $domain >> output_all_name_servers.txt
done

grep "open" output_all_name_servers.txt > filtered_output_name_servers.txt
