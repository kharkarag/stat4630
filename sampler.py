import random
import csv
import numpy as np



def counter(input):
    frequency = zeros(101)
    with open(input, "r") as fin:
        spamreader = csv.reader(fin, delimiter=' ', quotechar='|')
        # frequency_map = dict()
        frequency_list = []
        for i in range(0, 100):
            frequency_list.append([i, 0])
        # for i in range(0,101):
        #     frequency_map[str(i)] = 0
        
        count = 0
        for row in spamreader:
            if count != 0:
                count += 1
                if count%100000 == 0:
                    print(count/100000)
<<<<<<< Updated upstream
                #frequency_map[row[1].split(",")[23]] += 1
                frequency_list[int(row[1].split(",")[23])][1] += 1
=======
                frequency[int(row[1].split(",")[23])] += 1
>>>>>>> Stashed changes
            else:
                count += 1

<<<<<<< Updated upstream

    # index_list = [i for i in range(0, 100)]
    # for i in frequency_map:
    #     index_list.append(i)
    #     frequency_list.append(int(frequency_map[i]))


    print(frequency_list)
    # arr = np.array(frequency_list)
    # ind = np.argpartition(arr, -5)[-5:]
    frequency_list.sort(key=lambda tup: tup[1])
    ind = [tup[0] for tup in frequency_list[-5:]]

    print(ind)
=======
    fin.close();


    print(frequency)
    arr = np.array(frequency)
    ind = np.argpartition(arr, -5)[-5:]
    print(ind);
    ind = map(str, ind)
>>>>>>> Stashed changes
    return ind




def sampling(input, ind):
    random.seed(11)
    output = "S" + input
    with open(output,'w') as fou:
        with open(input, "r") as fin:

            spamreader = csv.reader(fin, delimiter=' ', quotechar='|')
            spamwriter = csv.writer(fou, delimiter=' ', quotechar='|', quoting=csv.QUOTE_MINIMAL)

            count = 0
            write_count = 0
            i = 0
            for row in spamreader:
                if count == 0:
                    spamwriter.writerow(row)
                    count += 1
                else:
                    count += 1
                    if count%100000 == 0:
                        print(count/100000)

                    if row[1].split(",")[6] != "":
                        # if int(row[1].split(",")[23]) == "91":
                        #     print("FLAG")
                        if int(row[1].split(",")[23]) in ind:
                           num = random.randint(1, 3);
                           if num == 1:
                               spamwriter.writerow(row)
                               write_count += 1
                               if write_count % 10000 == 0:
                                   print("Write", write_count / 10000)
                # i += 1
                # if i > 1000:
                #     break
            print("Write total:", write_count)


<<<<<<< Updated upstream
#ind = counter("train.csv")
ind = [65, 64, 48, 41, 91]
print(ind)
=======
ind = counter("train.csv")
#ind = [51, 60, 87, 78, 50]
ind = map(str, ind)
>>>>>>> Stashed changes
sampling("train.csv", ind)
