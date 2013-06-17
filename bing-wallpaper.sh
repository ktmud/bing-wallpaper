#!/usr/bin/env bash

mkdir -p ~/Pictures/bing-wallpapers/
cd ~/Pictures/bing-wallpapers/

# for more urls, goto http://windows.microsoft.com/en-US/windows/themes?T1=rss
# download a theme, use a text editor to open it, and find the url.
curl "http://themeserver.microsoft.com/default.aspx?p=Windows&c=LandScapes&m=en-US" | grep -o 'url="[^"]*"' | sed -e 's/url="\([^"]*\)"/\1/' | sed -e "s/ /%20/g" > tmp.txt

#read file line
while read line
do
    fileName=$(echo $line | sed -e "s;.*/\([^\/]*\)$;\1;")
    if [[ -f $fileName ]]; then
        echo "$fileName already exists" > log.txt
    else
        curl -O $line;
    fi
done < "tmp.txt"
