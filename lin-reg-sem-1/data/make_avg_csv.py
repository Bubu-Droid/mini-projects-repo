import csv
import json

import numpy as np

# Input and output file paths
input_file = "website_load_data.json"
output_file = "averaged_data.csv"

# Load the JSON data
with open(input_file, "r") as f:
    data = json.load(f)

# Prepare rows for CSV
rows = []
for site in data:
    name = site["name"]
    hits = [h for h in site["hits"] if h["load_time_s"] and h["page_size_kb"]]
    if not hits:
        continue
    avg_load = np.mean([h["load_time_s"] for h in hits])
    avg_size = np.mean([h["page_size_kb"] for h in hits])
    rows.append([name, avg_load, avg_size])

# Write to CSV
with open(output_file, "w", newline="", encoding="utf-8") as f:
    writer = csv.writer(f)
    writer.writerow(["name", "load_time_avg", "page_size_avg"])
    writer.writerows(rows)

print(f"CSV file created successfully: {output_file}")
