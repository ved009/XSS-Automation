#!/bin/bash
url=$1;
mkdir $url;
cd $url;
gau $url --subs --blacklist pdf,css,jpeg,gif,svg,png,jpg,ttf,woff,js --fc 404,302 --fp | Gxss | tee $url.txt;
dalfox file $url.txt;
