import re

# Define regex patterns for each type of data
patterns = {
    'Domains': re.compile(r'\b(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}\b'),
    'Name Servers': re.compile(r'\b(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}\b'),
    'Email Addresses': re.compile(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'),
    'Social Media': re.compile(r'https://(?:www\.)?(?:linkedin|instagram|facebook|x|github)\.com/[A-Za-z0-9_/?=]+'),
    'Comments': re.compile(r'(?<=Comments\s)[^\n]+'),
    'Addresses': re.compile(r'\b(?:[A-Za-z]+\s?)+,\s?(?:[A-Za-z]+\s?)+,\s?(?:[A-Za-z]+\s?)+\b'),
    'System Numbers': re.compile(r'\bAS\d+\b'),
    'Phone Numbers': re.compile(r'\+\d{1,3}\s?\d{1,4}\s?\d{1,4}\s?\d{1,4}')
}

# Open the input file
input_file = 'task4.txt'

# Dictionary to store extracted data
extracted_data = {key: [] for key in patterns}

# Read the file and apply regex patterns
with open(input_file, 'r') as file:
    content = file.read()
    for key, pattern in patterns.items():
        matches = pattern.findall(content)
        extracted_data[key] = matches

# Write the extracted data to separate files
for key, data in extracted_data.items():
    with open(f'{key.lower().replace(" ", "_")}.txt', 'w') as output_file:
        for item in data:
            output_file.write(item + '\n')

print("Data extraction complete. Files generated for each category.")
