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
         <link  rel="stylesheet" href="asg5_chl533.css" type="text/css">
	 </head>
	 <body>''')
print("<h1> CSCI-UA.60-1 Fall 2018 Assignment5 </h1>")

form = cgi.FieldStorage()

start_year = form ["start_year"].value
end_year = form ["end_year"].value
computation = form ["computation"].value
sort = form ["sort"].value 
if "unemploymentRate" in form: 
	check1 = form ["unemploymentRate"].value
else:
	check1 = ''
if "numOfConstruction" in form:
	check2 = form ["numOfConstruction"].value
else: 
	check2 =''
if "fedInterestRate" in form:	
	check3 = form ["fedInterestRate"].value
else: 
	check3 = ''

query =   "SELECT yearMonth" + check1 + check2 + check3 + ''' 
            FROM indexes 
            WHERE yearMonth >''' + start_year + '''
                  yearMonth <''' + end_year + '''
            ORDER BY ''' + sort + ";"      
            

print("<p>Query: "+query+".</p>")

conn = sqlite3.connect('asg5_chl533.db')
c = conn.cursor()
c.execute(query)

print("<table>")
print("<tr>")
print("<th>State</th>")
print("<th>Name</th>")
print("<th>Population in 2010</th>")
print("</tr>")