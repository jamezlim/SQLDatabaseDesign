# -*- coding: utf-8 -*-
"""
Spyder Editor


@Author: James Cheol Hyun Lim 
"""


#Data Sources 
#https://statisticaldatasets-data-planet-com.proxy.library.nyu.edu/dataplanet/Link?id=cf54995796
#https://statisticaldatasets-data-planet-com.proxy.library.nyu.edu/dataplanet/Link?id=cf53d4ddc4
#https://statisticaldatasets-data-planet-com.proxy.library.nyu.edu/dataplanet/Link?id=cf5593dd77

import pylab 
import matplotlib.pyplot as plt

#function to draw bar graph 
def draw_graph_bar(years, index1, list1, index2, list2,index3, list3 ):
    pylab.clf()
    
    pylab.title("Percentage Change for 3 Indexes") 
    pylab.xlabel("Year/Month")
    pylab.ylabel("Percentage Change")
    
    x = range (1,len(years)+1)
    pylab.xticks(x,years)
    pylab.xticks(rotation=90)
    pylab.bar(x,list1,color="green",label=index1)
    pylab.bar(x,list2,align="edge",color="blue",label=index2)
    pylab.bar(x,list3,color = "red", label = index3)

    pylab.legend(loc="upper right")
    pylab.show()
    
# Function to draw line graph    
def draw_graph_line (years, index1, list1, index2, list2, index3, list3):
    pylab.clf() 
    x = range (1,len(years)+1)
    #x = years
    fig,ax1 = plt.subplots()
    plt.xticks(x,years)
    plt.xticks(rotation=90) 
    #actually drawing graphs 
    ax2 = ax1.twinx()
    ax2.plot(x, list2, color = 'b', label = "Number of Houses started Construction")
    ax1.plot(x, list3, color = 'r', label = "Federal Interest Rate")
    ax1.plot(x, list1, color = 'g', label = "Unemployment Rate")
   
    
    #setting labels 
    ax1.set_xlabel('Year/Month')
    ax1.set_ylabel("percentage (%)", color='black')
    ax2.set_ylabel(index2, color='b')
    
    fig.legend(loc = "upper right")
    plt.show()    
    
# This is a function that compares values with the prior time period to compute percent changes 
def compare_to_prior_month(key_list, index):
    # index = 0 for unemployment 1 for housingstart 2 for interestrate
    start = 0 
    for items in key_list:
        try:
            prior_value = abs(float(dic[key_list[start+1]][index]))
            current_value = float(dic[items][index])
            percent_change = ((current_value - prior_value)/ prior_value) * 100
            percent_change_rounded = round(percent_change,2)
            start += 1
        except:
            # for whatever reason the try statement throws an error fill the space with empty values
            dic[items].append("  ")
            start += 1
        else: 
            dic[items].append(str(percent_change_rounded))
            
# dictionary key:years value: list of economic indexes
dic = {}
out_file = "economic_indexes_correlation.csv"
input_file1 = "asg3_chl533_data1.csv"
in1 = open(input_file1, 'r')
for line in in1:
    splitted_lines = line.split(",")
    splitted_lines[0] = splitted_lines[0].strip('"')
    splitted_lines[1] = splitted_lines[1].strip("\n")
    # if data read is numeric put values with years being the key 
    if splitted_lines[0].isnumeric():
        dic[splitted_lines[0]] = [splitted_lines[1]]
     
in1.close()

# read from another file and put values if they are in the same year 
input_file2 = "asg3_chl533_data2.csv"
in2 = open(input_file2, 'r')
for line in in2:
    splitted_lines = line.split(",")
    splitted_lines[0] = splitted_lines[0].strip('"')
    splitted_lines[1] = splitted_lines[1].strip("\n")
    # splitted_lines [year, value]
    if splitted_lines[0].isnumeric():
        if splitted_lines[0] in dic.keys():
            dic.get(splitted_lines[0]).append(splitted_lines[1])
        else:
            dic[splitted_lines[0]].append("  ")
            
# if input_file does not have data in a given year put a blank
for values in dic.keys():
    if len(dic[values]) != 2:
        dic[values].append("  ")
                         
in2.close()                
                
# read from another file and put values if they are in the same year              
input_file3 = "asg3_chl533_data3.csv"
in3 = open(input_file3, 'r')
for line in in3:
    splitted_lines = line.split(",")
    splitted_lines[0] = splitted_lines[0].strip('"')
    splitted_lines[1] = splitted_lines[1].strip("\n")
    # splitted_lines [year, value]
    if splitted_lines[0].isnumeric():
            if splitted_lines[0] in dic.keys():
                dic.get(splitted_lines[0]).append(splitted_lines[1])
            else:
                dic[splitted_lines[0]].append("  ")
# if input_file does not have data in a given year put a blank                
for values in dic.keys():
    if len(dic[values]) != 3:
        dic[values].append("  ")
              
in3.close()

key_list = list(dic.keys())
key_list.sort(reverse = True)              
compare_to_prior_month(key_list, 0) 
compare_to_prior_month(key_list, 1) 
compare_to_prior_month(key_list, 2)

#made a list to put key years that needs discarding
remove_list = []
   
for key in dic.keys():
   num = 0
   for data in dic[key]:
       if data != "  ":
           num = num + 1
   if num < 3:
       remove_list.append(key)
# remove years that are in the remove_list from the dictionary            
for element in remove_list:
    del dic[element.strip("'")]


o = open(out_file,'a')

# output the dictionary into a string seperated with commas 
new_string = ""
for key in dic.keys(): 
    string = ','.join(dic[key])
    new_string = key+","+string+"\n"
    o.write(new_string)

o.close()

# sort the new dictionary by year and make lists to contain new data for graphing
key_list = list(dic.keys())
unemployment_rate = []
number_of_houses = []
interest_rate = []
years = []

# user input for years 
while (True): 
    print ("Enter starting year bigger than 1960")
    print("Enter A if you wish to compare all years")   
    start_year = input() 
    if start_year.lower() == "a":
        break
    print ("Enter ending year smaller than 2019")
    end_year = input()
    # check for non numeric input
    if (end_year.isnumeric() and start_year.isnumeric()):
        if int(start_year) > 1959 and int(end_year) < 2019:
            break 
    print("Enter a valid year between 1960 and 2018\n")
        
# if the user chooses to compare all years 
if start_year.lower() == "a":
    for key in dic.keys():
        years.append(int(key))
        if not dic[key][0] == "  ":
            unemployment_rate.append(float(dic[key][0]))
        else: 
            unemployment_rate.append(0)
        if not dic[key][1] == "  ":
            number_of_houses.append(int(dic[key][1]))
        else: 
            number_of_houses.append(0)
        if not dic[key][2] == "  ":    
            interest_rate.append(float(dic[key][2]))
        else:
            interest_rate.append(0)
    # draw the actual graph         
    draw_graph_line(years,"Unemployment Rate",unemployment_rate,"Houses Started Construction",number_of_houses,"Federal Interest Rate",interest_rate)   
        
# if the input is both years         
elif start_year.lower() != "a":
    key_list.sort(reverse = False)
    for key in key_list:
        if (int(key[0:4]) >= int(start_year) and int(key[0:4]) <= int(end_year)):
            years.append(int(key))
            if not (dic[key][0] == "  "):
                unemployment_rate.append(float(dic[key][0]))
            else: 
                unemployment_rate.append(0)
            if not (dic[key][1] == "  "):
                number_of_houses.append(int(dic[key][1]))
            else: 
                number_of_houses.append(0)
            if not (dic[key][2] == "  "):    
                interest_rate.append(float(dic[key][2]))
            else:
                interest_rate.append(0)
    draw_graph_line(years,"Unemployment Rate",unemployment_rate,"Houses Started Construction",number_of_houses,"Federal Interest Rate",interest_rate)   

# if the user wishes to see percentage change graphed             
if start_year != 'a':
    unemployment_rate_p = []
    number_of_houses_p = []
    interest_rate_p = []
    years = []
    print ("Do you wish to see graph of percentage change for those years? Y/N")
    answer4 = input()
    if answer4.lower() == "y":
        for key in key_list:
            if (int(key[0:4]) >= int(start_year) and int(key[0:4]) <= int(end_year)):
                years.append(int(key))
                if not (dic[key][3] == "  "):
                    unemployment_rate_p.append(float(dic[key][3]))
                else: 
                    unemployment_rate_p.append(0)
                if not (dic[key][4] == "  "):
                    number_of_houses_p.append(float(dic[key][4]))
                else: 
                    number_of_houses_p.append(0)
                if not (dic[key][5] == "  "):    
                    interest_rate_p.append(float(dic[key][5]))
                else:
                    interest_rate_p.append(0)
        draw_graph_bar(years, "Unemployment Rate",unemployment_rate_p,"Houses Started Construction",number_of_houses_p,"Federal Interest Rate",interest_rate_p)   
        
else:
    print ("guess not! \n End of Program!")

    
    
    
    
            
    

