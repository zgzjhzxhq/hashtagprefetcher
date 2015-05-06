import os
import numpy
import csv

def parse_csv(file_name):
    with open(file_name, 'rb') as csvfile:
        rst_reader = csv.reader(csvfile, delimiter=',', quotechar='|')
        tmp_rst = []
        for rst in rst_reader:
            tmp_rst.append(int(rst[0]))
        
    count = 0
    for i in range(1000):
        if tmp_rst[i] == (i/200 + 1):
            count += 1
    print count
    return count

def walk_dirs(root_dir):
    acc_file = open('acc-data.dat', 'a')

    for dir_path in os.listdir(root_dir):
        if not os.path.isdir(dir_path):
            continue
        if dir_path == "Random Forest":
            continue

        dir_name = dir_path
        print dir_name
        accuracies = []
        # Assume the dir name is the algorithm name
        for file_path in os.listdir(dir_path):
            file_name = file_path
            if not file_name.endswith(".csv"): 
                continue
            print file_path
            acc = parse_csv(root_dir+"/"+dir_path+"/"+file_path)
            accuracies.append(float(acc)/1000)

        mean = numpy.mean(accuracies)
        std = numpy.std(accuracies)
        print mean, std
        acc_file.write(dir_name+", "+str(mean)+", "+str(std)+"\n")
    #return mean, std

if __name__ == "__main__":
    walk_dirs(".")
