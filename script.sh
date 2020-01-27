#Download the HTML file using wget
wget -O - http://www.met.ie/latest/reports.asp > index.html

#find the image sources
cat index.html | grep -Po 'img src="\K.*?(?=")' | sed 's/\?.*//' > images

while read p; do
  if [[ $p == /* ]];
  then
      initialString=$p
      replacedString=http://www.met.ie$p
      sed -i "s|$initialString|$replacedString|g" index.html
  fi
done < images
