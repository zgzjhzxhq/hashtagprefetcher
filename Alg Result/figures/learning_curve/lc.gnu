set term post eps enh color ", 46" size 12, 8 #eps color enh font ",30"
#set terminal pdf  enhanced color font ",30" size 3.5,2.62
set key outside horizontal right top spacing 1 font ",46" #box ls -1 lc rgb "black"
set datafile separator ","
set key autotitle columnhead
set output 'lc.eps'

set ylabel "Prediction Accuracy" offset 2
set xlabel "Size of Sample Training Set" offset 2
set xtics font ",46" #rotate by -45
#set ytics font ",34"
#set yrange [0:1.0]

set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
set grid xtics lc rgb "#bbbbbb" lw 1 lt 0
set logscale x

plot "lc.dat" using 1:2::xticlabels(1) with line lt 1 lw 4 lc rgb "#0072BD", \
     "lc.dat" using 1:3 with line lt 1 lw 4 lc rgb "#D95319", \
     "lc.dat" using 1:4 with line lt 1 lw 4 lc rgb "#EDB120", \
     "lc.dat" using 1:5 with line lt 1 lw 4 lc rgb "#7E2F8E", \
     "lc.dat" using 1:6 with line lt 1 lw 4 lc rgb "#77AC30"
