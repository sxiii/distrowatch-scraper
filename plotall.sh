#Polltall.sh code
#!/bin/bash
# This script plots analytics based on gathered data.
# It needs gnuplot to be installed along with 4 ".plot" files (templates).

echo "Removing old png's..."

rm *png

echo "Generating new plots."

gnuplot arch.plot
gnuplot basedon.plot
gnuplot status.plot
gnuplot desktop.plot 
convert -rotate 90 desktop.png desktop.png
echo "Please plot the countries.png manually using other tools. It's too hard to make this image with gnuplot. You can use openheatmap.com"
echo "Finished generating 4 PNG's."
