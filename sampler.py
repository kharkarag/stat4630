import random
import csv
import numpy as np



def counter(input):
    with open(input, "r") as fin:
        spamreader = csv.reader(fin, delimiter=' ', quotechar='|')
        frequency_map = dict();
        for i in range(0,101):
            frequency_map[str(i)] = 0;
        
        count = 0;
        for row in spamreader:
            if count != 0:
                count += 1;
                if count%100000 == 0:
                    print(count/100000)
                frequency_map[row[1].split(",")[23]] += 1
            else:
                count += 1;

    fin.close();
    
    frequency_list = []
    for i in frequency_map:
        frequency_list.append(int(frequency_map[i]));


    print(frequency_list)
    arr = np.array(frequency_list)
    ind = np.argpartition(arr, -5)[-5:]
    print(ind);
    ind = map(str, ind)
    return ind




def sampling(input, ind):
    random.seed(11)
    output = "S" + input
    with open(output,'w') as fou:
        with open(input, "r") as fin:

            spamreader = csv.reader(fin, delimiter=' ', quotechar='|')
            spamwriter = csv.writer(fou, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)

            count = 0;
            for row in spamreader:
                if count == 0:
                    spamwriter.writerow(row)
                    count += 1;
                else:
                    count += 1;
                    if count%100000 == 0:
                        print(count/100000)
#                    num = random.randint(1, 20);
#                    if num == 1:
                    if row[1].split(",")[6] != "":
                        if row[1].split(",")[23] in ind:
                            spamwriter.writerow(row)
        fin.close()
    fou.close()

#ind = counter("train.csv")
ind = [51, 60, 87, 78, 50]
ind = map(str, ind)
sampling("train.csv", ind)
