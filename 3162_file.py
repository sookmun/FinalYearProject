import csv

with open('breast_cancer.txt') as f:
    file = f.readlines()
    with open('MIAS_output.csv', mode='w',newline='') as mias_data:
        mias_writer = csv.writer(mias_data, delimiter=',')
        output="["
        count=0
        for line in file:
            line=line.strip('\n').split(" ")
            count+=1
            if line[2]=="NORM":
                mias_writer.writerow([line[0], "N"])
                output+="'N';"
            elif line[3]=="B":
                mias_writer.writerow([line[0], line[3]])
                output+="'"+str(line[3])+"';"
            elif line[3]=="M":
                mias_writer.writerow([line[0], line[3]])
                output+="'"+str(line[3])+"';"
        print(count)
        output+="]"
        print(output)
