#!/usr/bin/env gnuplot

set terminal png size 900, 300
set output "plot.png"
set grid
set key invert reverse Left outside
set timefmt "%Y%m%d"
# set xlabel 'Date'
set xdata time
set xtics format "%b %d"
set title "JS file size evolution"
set ylabel 'Size (kBs)'

# stat -t %Y%m%d js/*js | awk '{print $10" "$8/1024}' | sed s/\"//g > plot.dat
plot [:][:] 'plot.dat' using 1:2 title "*.js" with lines #, 'plot.dat' using 1:2 title "*.js.gz" with lines
