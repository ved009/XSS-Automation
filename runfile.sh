#!/bin/bash
url=$1;
filename=$2;
cd output;
mkdir $filename;
cd $filename;
echo RUNNING GAU
#Gau working
gau $url --subs --blacklist pdf,css,jpeg,gif,svg,png,jpg,ttf,woff,js,exe --fc 404,302 --fp | tee gauoutput.txt;
#Katana working
katana -u $url -fs fqdn -jc -d 5 -kf -aff -o katanaoutput.txt;
cat gauoutput.txt | anew katanaoutput.txt;
cat katanaoutput.txt | qsreplace parameter | grep parameter | tee parameter.txt;
echo RUNNING GXSS
#Gxss Running- write an echo
cat parameter.txt | Gxss -c 100 -p Reflected | tee Reflected.txt;
#Dalfox Running- write an echo
dalfox file Reflected.txt;
