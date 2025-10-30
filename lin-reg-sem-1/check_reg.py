import json
from urllib.parse import urlparse

import whois

# Load dataset
with open("website_list.json", "r") as f:
    websites = json.load(f)

print("Fetching WHOIS registrar info...\n")

for site in websites:
    name = site["name"]
    url = site["url"]
    domain = urlparse(url).netloc.replace("www.", "")

    try:
        w = whois.whois(domain)
        registrar = w.registrar or "Unknown"
        print(f"{name:<70} | Registrar: {registrar}")
    except Exception as e:
        print(f"{name:<70} | Registrar: Error fetching ({e})")
