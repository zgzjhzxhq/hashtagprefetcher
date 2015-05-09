set term post eps enh color ", 46" size 18, 5.6 #eps color enh font ",30"
#set terminal pdf  enhanced color font ",30" size 3.5,2.62
set key outside center top horizontal spacing 1 font ",36" #box ls -1 lc rgb "black"
set key font ",36"
set datafile separator ","
set output 'label.eps'

set ylabel "Prediction Accuracy" offset 2
set xtics 0.2 font ",30" #rotate by -45
set ytics font ",34"
set yrange [0.75:1.05]

set style fill solid 0.6 border 0
set style histogram errorbars gap 2 lw 5
set style data histograms
set bars front
set grid ytics lc rgb "#bbbbbb" lw 1 lt 0
#set boxwidth 1.5

plot "1.dat" using 2:3:xtic(1) lt 1 lw 2 lc rgb "#0072BD" title "badger", \
     "2.dat" using 2:3 lt 1 lw 2 lc rgb "#D95319" title "baltimoreuprising", \
     "3.dat" using 2:3 lt 1 lw 2 lc rgb "#EDB120" title "gameofthrones", \
     "4.dat" using 2:3 lt 1 lw 2 lc rgb "#7E2F8E" title "love", \
     "5.dat" using 2:3 lt 1 lw 2 lc rgb "#77AC30" title "taylorswift"
