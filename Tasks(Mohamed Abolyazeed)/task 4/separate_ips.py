import re

# Patterns for IPv4 and IPv6
ipv4_pattern = re.compile(r'\b(?:\d{1,3}\.){3}\d{1,3}\b')
ipv6_pattern = re.compile(r'\b[0-9a-fA-F:]{7,}\b')

# Read input file and write to output files
with open('ips.txt', 'r') as file:
    lines = file.readlines()

with open('ipv4_addresses.txt', 'w') as ipv4_file, open('ipv6_addresses.txt', 'w') as ipv6_file:
    for line in lines:
        if ipv4_pattern.search(line):
            ipv4_file.write(line)
        elif ipv6_pattern.search(line):
            ipv6_file.write(line)
