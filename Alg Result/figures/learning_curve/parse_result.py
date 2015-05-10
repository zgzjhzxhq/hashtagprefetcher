import os
import numpy
import csv

def parse_csv(file_name):
    with open(file_name, 'rb') as csvfile:
        rst_reader = csv.reader(csvfile, delimiter=',', quotechar='|')
        tmp_rst = []
        for rst in rst_reader:
            tmp_rst.append([float(s) for s in rst])
        
    mean = numpy.mean(tmp_rst, axis=0)
    # print type(mean)
    # print mean
    return mean.tolist()

def walk_dirs(root_path):
    acc_file = open('lc.dat', 'wb')
    size = [1, 2, 4, 10, 20, 50, 100, 200, 400]
    rst = [size]
    alg_name = ["size"]
    for dir_name in os.listdir(root_path):
        dir_path = root_path + '/' + dir_name

        if not os.path.isdir(dir_path):
            continue
        if dir_name.endswith('figures'):
            continue

        file_name = "learningcurve.csv"
        file_path = dir_path + "/" + file_name
        if not os.path.exists(file_path):
            continue

        print dir_name
        acc = parse_csv(file_path)
        rst.append(acc)
        alg_name.append(dir_name)
    rst = numpy.array(rst)
    rst = numpy.transpose(rst)
    rst = rst.tolist() 

    print "Writing result ...",
    acc_file.write(",".join(alg_name))
    acc_file.write("\n")
    for r in rst:
        acc_file.write(", ".join(map(str, r)))
        acc_file.write("\n")
    print "Done\n"

if __name__ == "__main__":
    walk_dirs("../../")
