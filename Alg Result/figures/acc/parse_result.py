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

def walk_dirs(root_path):
    acc_file = open('acc.dat', 'wb')
    for dir_name in os.listdir(root_path):
        dir_path = root_path + '/' + dir_name

        if not os.path.isdir(dir_path):
            continue
        if dir_name.endswith('figures'):
            continue

        print dir_name
        accuracies = []
        # Assume the dir name is the algorithm name
        for file_name in os.listdir(dir_path):
            file_path = dir_path + '/' + file_name
            if not file_name.endswith(".csv"): 
                continue
            print file_name
            acc = parse_csv(file_path)
            accuracies.append(float(acc)/1000)

        mean = numpy.mean(accuracies)
        std = numpy.std(accuracies)
        print mean, std
        acc_file.write(dir_name+", "+str(mean)+", "+str(std)+"\n")
    #return mean, std

if __name__ == "__main__":
    walk_dirs("../../")
