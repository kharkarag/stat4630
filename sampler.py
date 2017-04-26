import random
import csv

def sampling(input):
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
                    num = random.randint(1, 40);
                    if num == 1:
                        spamwriter.writerow(row)
        fin.close()
    fou.close()

sampling("train.csv")
