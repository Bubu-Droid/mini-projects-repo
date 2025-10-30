import json
import time
from statistics import mean

from selenium import webdriver
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.firefox.service import Service

# ---- CONFIG ----
NUM_HITS = 5
OUTPUT_FILE = "test_out_list.json"
INPUT_FILE = "test_list.json"
SLEEP_BETWEEN_HITS = 1  # seconds
# -----------------

# ---- READ INPUT ----
with open(INPUT_FILE, "r") as f:
    websites = json.load(f)

print("Starting browser-based measurements...\n")

all_results = []

for site in websites:
    name = site["name"]
    url = site["url"]

    load_times = []
    sizes = []
    hits = []

    print("=" * 80)
    print(f"Testing: {name}\nURL: {url}\n")

    for i in range(1, NUM_HITS + 1):
        try:
            # Fresh browser each time
            options = FirefoxOptions()
            options.add_argument("--headless")
            options.add_argument("--width=1920")
            options.add_argument("--height=1080")
            options.set_preference("browser.cache.disk.enable", False)
            options.set_preference("browser.cache.memory.enable", False)
            options.set_preference("browser.cache.offline.enable", False)
            options.set_preference("network.http.use-cache", False)
            options.set_preference("network.dnsCacheExpiration", 0)
            options.set_preference("network.dns.disablePrefetch", True)
            options.set_preference("network.predictor.enabled", False)
            options.set_preference("network.prefetch-next", False)
            options.set_preference("network.http.speculative-parallel-limit", 0)
            options.set_preference("network.http.pipelining", False)

            service = Service("/usr/bin/geckodriver")

            driver = webdriver.Firefox(options=options)

            start_time = time.time()
            driver.execute_script("window.performance.clearResourceTimings();")
            driver.get(url)
            driver.execute_script("return document.readyState")
            end_time = time.time()

            load_time = end_time - start_time

            total_size = driver.execute_script(
                """
                let total = 0;
                let entries = window.performance.getEntriesByType('resource');
                for (let e of entries) {
                    if (e.transferSize) total += e.transferSize;
                }
                return total / 1024; // KB
                """
            )

            print(
                f"  Hit {i}: Load time = {load_time:.3f}s | Size = {total_size:.1f} KB"
            )

            load_times.append(load_time)
            sizes.append(total_size)

            hits.append(
                {
                    "hit_number": i,
                    "load_time_s": round(load_time, 3),
                    "page_size_kb": round(total_size, 1),
                }
            )

            driver.quit()
            time.sleep(SLEEP_BETWEEN_HITS)

        except Exception as e:
            print(f"  Hit {i}: Failed ({e})")
            hits.append(
                {
                    "hit_number": i,
                    "load_time_s": None,
                    "page_size_kb": None,
                }
            )

    if load_times:
        avg_load = mean(load_times)
        avg_size = mean(sizes)
        print(f"\n  → Average load time: {avg_load:.3f}s")
        print(f"  → Average page size: {avg_size:.1f} KB")
    else:
        print("\n  → All hits failed for this site.")

    all_results.append({"name": name, "url": url, "hits": hits})

# ---- SAVE JSON ----
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    json.dump(all_results, f, indent=2)

print(f"\nAll done! Results saved to {OUTPUT_FILE}")
