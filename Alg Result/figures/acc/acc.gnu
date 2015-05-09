set term post eps enh color ", 46" size 14, 5.6 #eps color enh font ",30"
#set terminal pdf  enhanced color font ",30" size 3.5,2.62
set key left top spacing 1 font ",36" #box ls -1 lc rgb "black"
set key font ",36"
set datafile separator ","
set output 'acc.eps'

set ylabel "Prediction Accuracy" offset 2
set xtics 0.2 font ",24" #rotate by -45
set ytics font ",34"
set yrange [0.9:0.98]

set style fill solid 0.4 border 0
set style histogram errorbars gap 1 lw 5
set style data histograms
set bars front

set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
#set boxwidth 1.5

plot "acc.dat" using 2:3:xtic(1) lt 1 lw 2 lc rgb "black" notitle #"Prediction Accuracy" #, \
#     "api.dat" using 4:5 lt 1 lw 2 lc rgb "gray" title "CQSTR Cluster"
