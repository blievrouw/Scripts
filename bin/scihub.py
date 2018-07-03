#!/Users/bertlievrouw/anaconda3/bin/python

import requests
from bs4 import BeautifulSoup
import sys
import subprocess


# Find working scihub url
sh_res = requests.get("https://whereisscihub.now.sh/")
sh_soup = BeautifulSoup(sh_res.content, "html.parser")
sh_url = sh_soup.find("strong").text

# Get DOI code input
doi = sys.argv[1]

# Construct scihub url
sh_article_url = sh_url + "/" + doi

# Get article pdf url
sh_article_res = requests.get(sh_article_url)
sh_article_soup = BeautifulSoup(sh_article_res.content, "html.parser")
article_pdf_url = sh_article_soup.find("iframe")['src']

# Open article pdf in browser
bash_cmd = "open {}".format(article_pdf_url)
subprocess.call(bash_cmd.split())
