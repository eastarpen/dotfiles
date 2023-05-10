#!/bin/env bash

set -e

function download_html() {
    uid=$1
    wget -O ./html/${uid}.html "https://wezfurlong.org/wezterm/colorschemes/${uid}/index.html"
}

# try make directory ./html
if [ ! -d "./html" ]; then
  mkdir ./html
fi

# download files
download_html "e"
for char in {a..z}; do
    download_html $char
done

# try to parse html files
if [ -f "./parse_html.py" ]; then
    ./parse_html.py > ./color_theme
else
    echo "Error: parse_html.py script not found."
fi

rm ./html/ -rf
