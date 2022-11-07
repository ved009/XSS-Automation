#!/bin/bash
url=$1;
filename=$2;
mkdir $filename;
cd $filename;
gau $url --subs --blacklist pdf,css,jpeg,gif,svg,png,jpg,ttf,woff,js --fc 404,302 --fp | tee $url.txt;
cat $url.txt | Gxss | tee output.txt;
dalfox file $url.txt;
