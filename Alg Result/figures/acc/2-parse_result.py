import os
import numpy
import csv

def parse_csv(file_name):
    with open(file_name, 'rb') as csvfile:
        rst_reader = csv.reader(csvfile, delimiter=',', quotechar='|')
        tmp_rst = []
        for rst in rst_reader:
            tmp_rst.append(int(rst[0]))
        
    count = [0, 0, 0, 0, 0]
    for i in range(1000):
        if tmp_rst[i] == (i/200 + 1):
            count[i/200] += 1
    print count
    return count

def walk_dirs(root_path):
    acc_file = [open(str(i+1) + '.dat', 'wb') for i in range(5)]

    for dir_name in os.listdir(root_path):
        dir_path = root_path + '/' + dir_name
        if not os.path.isdir(dir_path):
            continue
        if dir_name.endswith("figures"):
            continue
        print dir_name
        accuracies =[[], [], [], [], []]

        for file_name in os.listdir(dir_path):
            file_path = dir_path + '/' + file_name
            if not file_name.endswith(".csv"): 
                continue
            print file_name
            acc = parse_csv(file_path)
            for j in range(5):
                accuracies[j].append(float(acc[j])/200)

        for j in range(5):
            mean = numpy.mean(accuracies[j])
            std = numpy.std(accuracies[j])
            print mean, std
            acc_file[j].write(dir_name+", "+str(mean)+", "+str(std)+"\n")
        print "\n"
    #return mean, std

if __name__ == "__main__":
    walk_dirs("../../")
