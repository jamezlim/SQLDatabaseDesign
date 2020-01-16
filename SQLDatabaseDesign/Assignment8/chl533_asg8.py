#!/usr/local/bin/python3
import cgi, cgitb
cgitb.enable()  

import sys, codecs
sys.stdout = codecs.getwriter("utf-8")(sys.stdout.detach())

import pymongo

client = pymongo.MongoClient('mongodb://chl533:UExczpUa@class-mongodb.cims.nyu.edu/chl533')


print("Content-type: text/html;charset=utf-8")
print("\n\n") 


print('''
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Assignment8-2)</title>
        <link rel="stylesheet" type="text/css" href="asg5_chl533.css" >
    </head>
    <body>
            <header><h1> Part 2. PyMongo Program </h1></header>
            <h3><a href = "index.html" > <strong> Back to Home</strong> </a></h3>
        	<h3> Earthquakes in the US/Canada/Mexico </h3>
            <p> This is a list of earthquakes occurrence in the US,Canada and Mexico regions where the magnitude was greater than 7.<br />
            It is listed in the ascending order of the year that it occurred.  
            </p>
''')

for occurrence in client.chl533.earthquakes.find({'EQ_MAG':{'$gt': 7.5}}).sort("YEAR", pymongo.ASCENDING):
    year = occurrence.get("YEAR", "No data")
    month = occurrence.get("MONTH", "No data")
    day = occurrence.get("DAY", "No data")
    magnitude = occurrence.get("EQ_MAG", "0")
    country = occurrence.get("COUNTRY", "Unknown")
    state = occurrence.get("STATE", "N/A")
    loc = occurrence.get("LOCATION_NAME", "Unknown")

    print('''
                <p><strong>{month}/{day}/{year}</strong><br />
                    Country  : {country}<br />
                    State    : {state}<br />
                    Location : {loc}<br />
                    Magnitude: {magnitude}<br />
                    </p>
                <hr />

    '''.format(year=year,month=month,day=day,magnitude=magnitude,country=country,state=state,loc = loc))

print('''
    
    
    </body>
</html>
''')