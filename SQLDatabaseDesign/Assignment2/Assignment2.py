# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

# This is a function that compares values with the prior time period to compute percent changes
import pylab 
import matplotlib.pyplot as plt

def draw_graph2(years, index1, list1, index2, list2 ):
    pylab.clf()
    
    pylab.title("Comparison of"+ index1 + "and" + index2)
    pylab.xlabel("Year/month")
    
    x = years
    pylab.legend(loc = "upper right")
    pylab.show()
    
def draw_graph3 (years, index1, list1, index2, list2, index3, list3):
    pylab.clf()     
    x = years
    
    fig,ax1,ax2 = plt.subplots()
    
    #actually drawing graphs 
    ax2 = ax1.twinx()
    ax2.plot(x, list2, color = 'b', label = "Number of Houses started Construction")
    ax1.plot(x, list3, color = 'r', label = "Federal Interest Rate")
    ax1.plot(x, list1, color = 'g', label = "Unemployment Rate")
   
    
    #setting labels 
    ax1.set_xlabel('Year/Month')
    ax1.set_ylabel("percentage (%)", color='black')
    ax2.set_ylabel(index2, color='b')
    
    #ax1.legend(loc = "upper right")
    #ax2.legend(loc = "upper right")
    fig.legend(loc = "upper right")
    plt.show()    
    
    
    

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
            
#user input1    
print("\nDo you wish to have percentage change computations for each period? (Y/N)")
answer2 = input()
show_percentage = 0
if answer2.lower() == "y" or answer2.lower() == "yes":
    show_percentage = 1
else: 
    print("\nGuess not!")

#user input2 
print("\nDo you want to remove years with insufficient data? (Y/N)")
answer3 = input()
remove_years = 0
if answer3.lower() == "y" or answer3.lower() == "yes":
    remove_years = 1
else: 
    print("\nSuit Yourself!\n")


# dictionary key:years value: list of economic indexes
dic = {}
out_file = "economic_indexes_correlation.csv"
input_file1 = "unemploymentrate.csv"
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
input_file2 = "housingstart.csv"
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
input_file3 = "interestrate.csv"
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

# if user demands percentage chages, compute and append computed values to dictionary according to year                                         
if show_percentage ==1:                
    key_list = list(dic.keys())
    key_list.sort(reverse = True)              
    compare_to_prior_month(key_list, 0) 
    compare_to_prior_month(key_list, 1) 
    compare_to_prior_month(key_list, 2)

# if user wishes to discard years with insufficient data 
if remove_years == 1:
   #made a list to put key years that needs discarding
   #modifying the dictionary within the forloop will give errors 
   remove_list = []
   
   for key in dic.keys():
       num = 0
       for data in dic[key]:
           if data != "  ":
               num = num + 1
       if num < 5:
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
    print(new_string)  

o.close()



print ("input alphadets for the indexes you wish to compare. ex) E H \n(Enter 3 if you wish to compare all indexes)")
print ("Unemployment Rate (E), Number of Housing that Started Constructing (H), Federal Interest Rate (I)")

unemployment_rate = []
number_of_houses = []
interest_rate = []
years = []

answer3 = input() 
if answer3 == "3":
    
    for key in dic.keys():
        years.append(int(key))
        if not dic[key][0] == " ":
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
    print (dic.keys())    
    print (interest_rate)   
    print (number_of_houses)
    print (interest_rate)
    draw_graph3(years,"Unemployment Rate",unemployment_rate,"Houses Started Construction",number_of_houses,"Federal Interest Rate",interest_rate)   
        
        
elif answer3 != 3:
    answer4 = input() 
    
            
    

