'''
Created on Apr 27, 2015

@author: Ralph
'''

from sklearn import tree
import csv

def parse_csv(file_name):
    insts = []
    rst = []
    with open(file_name, 'rb') as csvfile:
        inst_reader = csv.reader(csvfile, delimiter=',', quotechar='|')
        for inst_s in inst_reader:
            inst = [int(s) for s in inst_s]
            insts.append(inst[:9790])
            rst.append(inst[9791])
            
    return insts, rst

def write_csv(file_name, rsts):
    with open(file_name, 'wb') as csvfile:
        rst_writer = csv.writer(csvfile, delimiter=",", quotechar="|")
        for rst in rsts:
            rst_writer.writerow(rst)

def train(train_data, labels):
    clf = tree.DecisionTreeClassifier()
    clf = clf.fit(train_data, labels)
    return clf

def predict(model, test_data):
    rst = model.predict(test_data)
    return rst

if __name__ == "__main__":
    size = [1, 2, 4, 10, 20, 50, 100, 200, 400]
    test_csv = "../../CVData/1/0-1Test1.csv"
    print "Reading testing file:", test_csv
    test_insts,test_rst = parse_csv(test_csv)

    lc_rst = []
    for c in range(10):
        print "Round " + str(c+1) + ":"
        lc_rst.append([])
        for s in size:
            print "Size " + str(s) + ":" 
            train_csv = "../../Learning Curve/Data/sampled_" + str(s).zfill(3) + "_" + str(c+1).zfill(2) + ".csv"
            print "Reading training file:", train_csv
            train_insts,train_rst = parse_csv(train_csv)

            model = train(train_insts, train_rst)
            predict_rst = predict(model, test_insts)

            count = 0.0
            for i in range(1000):
                if predict_rst[i] == test_rst[i]:
                    count += 1.0
            lc_rst[len(lc_rst)-1].append(count/1000.0)
            print str(count/10.0)+"%"
        print

    print "Writing result file: learningcurve.csv", 
    write_csv("learningcurve.csv", lc_rst)
