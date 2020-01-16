#!/usr/bin/python3
# -*- coding: utf-8 -*-

import cgi
import sqlite3

import cgitb
cgitb.enable()   

print("Content-Type: text/html\r\n\r\n")
print('''<!DOCTYPE html>
	 <head>
         <title> Correlation of Economic Indexes </title>
         <link rel="stylesheet" href="asg5_chl533.css" type="text/css">
	 </head>
	 <style>
		

	 </style>

	 <body>''')
print("<header><h1> Part3. SQLite/CGI </h1></header>")

column_counter = 0
form = cgi.FieldStorage()

if "start_year" in form:
	start_year = form ["start_year"].value
	if form["display"].value == "yes":
		start_year = 1960
else: 
	start_year = 1960
if "end_year" in form:	
	end_year = form ["end_year"].value
	if form["display"].value == "yes":
		end_year = 2018
else:
	end_year = 2018
computation = form ["computation"].value
sort = form ["sort"].value 
if "unemploymentRate" in form: 
	check1 = form ["unemploymentRate"].value
	column_counter += 1
else:
	if form["display"].value == "yes":
		check1 = ",unemploymentRate"
	else:
		check1 = ''
if "numOfConstruction" in form:
	check2 = form ["numOfConstruction"].value
	column_counter += 1
else: 
	if form["display"].value == "yes":
		check2 = ",numOfConstruction"
	else:
		check2 =''
if "fedInterestRate" in form:	
	check3 = form ["fedInterestRate"].value
	column_counter += 1
else: 
	if form["display"].value == "yes":
		check3 = ",fedInterestRate"
	else:
		check3 =''
	

query =   "SELECT yearMonth" + check1 + check2 + check3 + computation + ''' 
            FROM indexes 
            WHERE yearMonth >=''' + str(int(start_year) * 100) + '''
                  AND yearMonth <=''' + str(int(end_year) * 100) + '''
            ORDER BY yearMonth ''' + sort      
            

conn = sqlite3.connect('asg5_chl533.db')
c = conn.cursor()
c.execute(query)

print("<table>")
print("<tr>")
print("<th>yearMonth</th>")
if "unemploymentRate" in form or form["display"].value == "yes": 
	print("<th> unemploymentRate </th>")
if "numOfConstruction" in form or form["display"].value == "yes":
	print("<th> numOfConstruction </th>")
if "fedInterestRate" in form or form["display"].value == "yes":
	print("<th> fedInterestRate </th>")
if computation == ",changeInUnemploymentRate": 
	print("<th> changeInUnemploymentRate </th>")
elif computation == ",changeInNumOfConstruction":
	print("<th> changeInNumOfConstruction </th>")
else:
	print("<th> changeInFedInterestRate </th>") 	
print("</tr>")

if form["display"].value == "yes":
	for c1,c2,c3,c4,c5 in c:
		print ("<tr>")
		print ("\t<td>"+str(c1)      +"</td>")
		print ("\t<td>"+str(c2)       +"</td>")
		print ("\t<td>"+str(c3)      +"</td>")
		print ("\t<td>"+str(c4)     +"</td>")
		print ("\t<td>"+str(c5)     +"</td>")
		print ("</tr>")

elif column_counter == 0:
	for c1,c2 in c:
		print ("<tr>")
		print ("\t<td>"+str(c1)      +"</td>")
		print ("\t<td>"+str(c2)       +"</td>")
		print ("</tr>")

elif column_counter == 1:
	for c1,c2,c3 in c:
		print ("<tr>")
		print ("\t<td>"+str(c1)      +"</td>")
		print ("\t<td>"+str(c2)       +"</td>")
		print ("\t<td>"+str(c3)      +"</td>")
		print ("</tr>")

elif column_counter == 2:
	for c1,c2,c3,c4 in c:
		print ("<tr>")
		print ("\t<td>"+str(c1)      +"</td>")
		print ("\t<td>"+str(c2)       +"</td>")
		print ("\t<td>"+str(c3)      +"</td>")
		print ("\t<td>"+str(c4)     +"</td>")
		print ("</tr>")

elif column_counter == 3:
	for c1,c2,c3,c4,c5 in c:
		print ("<tr>")
		print ("\t<td>"+str(c1)      +"</td>")
		print ("\t<td>"+str(c2)       +"</td>")
		print ("\t<td>"+str(c3)      +"</td>")
		print ("\t<td>"+str(c4)     +"</td>")
		print ("\t<td>"+str(c5)     +"</td>")
		print ("</tr>")


print ("</table>")
c.close()
print("</body>")
print("</html>")