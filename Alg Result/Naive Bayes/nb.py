'''
Created on Apr 27, 2015

@author: Ralph
'''

from sklearn import naive_bayes
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
            rst_writer.writerow([rst])

def train(train_data, labels):
    clf = naive_bayes.MultinomialNB()
    clf = clf.fit(train_data, labels)
    return clf

def predict(model, test_data):
    rst = model.predict(test_data)
    return rst

if __name__ == "__main__":
    for cv in range(1,6):
        print "CV" + str(cv) + ":" 
        train_csv = "../../CVData/" + str(cv) + "/0-1Train" + str(cv) + ".csv"
        test_csv = "../../CVData/" + str(cv) + "/0-1Test" + str(cv) + ".csv"
        print "Reading training file:", train_csv
        print "Reading testing file:", test_csv
        train_insts,train_rst = parse_csv(train_csv)
        test_insts,test_rst = parse_csv(test_csv)

        model = train(train_insts, train_rst)
        predict_rst = predict(model, test_insts)

        result_csv = "CV"+str(cv)+".csv"
        print "Writing result file:", result_csv
        write_csv(result_csv, predict_rst)
        
        count = 0.0
        for i in range(1000):
            if predict_rst[i] == test_rst[i]:
                count += 1.0
                 
        print str(count/10.0)+"%\n"
