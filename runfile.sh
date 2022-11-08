#!/bin/bash
url=$1;
filename=$2;
cd output;
mkdir $filename;
cd $filename;
gau $url --subs --blacklist pdf,css,jpeg,gif,svg,png,jpg,ttf,woff,js,exe --fc 404,302 --fp | tee $url.txt;
cat $url.txt | Gxss -c 100 -p Reflected | tee Reflected.txt;
dalfox file Reflected.txt;
