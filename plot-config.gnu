set title title
set terminal qt size 1600,1000 font "Helvetica,20"
set datafile separator ";"
set autoscale 
set xdata time
set timefmt '%Y-%m-%dT%H:%M:%S'
set format x '%H:%M:%S'
set for [i=1:words(names)] linetype i dashtype i linewidth 2
set datafile missing "NaN"
plot for [name in names] file using 1:(stringcolumn(2) eq name? column(col):NaN) with linespoints title name noenhanced
pause 10
reread