#!/bin/env python3

# This script is using to get colortheme config by html file
# It should be only called by ./wez_color.sh

from lxml import html
import os

def parse(htmlStr:str):
    # Parse the HTML content using lxml
    tree = html.fromstring(htmlStr)

    # Use XPath to get all tags with the name "code"
    code_tags = tree.xpath('//code/span')

    # Print the text content of each code tag
    for tag in code_tags:
        text = ''.join(tag.xpath('.//text()')).strip()
        if text:
            print(text)

dir_path = './html'
html_files = [f for f in os.listdir(dir_path) if f.endswith('.html')]

for file_name in html_files:
    full_file_path = os.path.join(dir_path, file_name)
    with open(full_file_path, 'r') as file:
        # Do something with the file contents
        parse(file.read())
