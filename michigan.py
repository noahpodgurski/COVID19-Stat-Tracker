import mysql.connector
import xml.dom.minidom
import sys
import os

#parse
document = xml.dom.minidom.parse(sys.argv[1])
tableElements = document.getElementsByTagName('table')
#extract USA only
data = []
for table in tableElements:
    for tr in table.getElementsByTagName('tr'):
        print("------NEW ROW------")
        county  = []
        for td in tr.getElementsByTagName('td'):
            for node in td.childNodes:
                if node.nodeType == node.TEXT_NODE and str.strip(node.nodeValue) != "":
                    county.append(str.strip(node.nodeValue))
                    print(f"Value: {str.strip(node.nodeValue)}")
        data.append(county)

#convert to ints
for county in data:
    if not county:
        continue
    try:
        county[1] = int(county[1].replace(",",""))
    except IndexError:
        county[1] = 0
    try:
        county[2] = int(county[2].replace(",",""))
    except IndexError:
        county.append(0)
        
#mysql functions
def insert(cursor, data):
    query = f"INSERT INTO data (county, confirmed, deaths) VALUES ('{data[0]}', '{data[1]}', '{data[2]}')"
    cursor.execute(query)

def restartTable(cursor):
    cursor.execute("DROP DATABASE IF EXISTS michigan")
    cursor.execute("CREATE DATABASE michigan")
    cursor.execute("USE michigan")
    cursor.execute("CREATE TABLE data(county VARCHAR(50), confirmed INT(255), deaths INT(255), PRIMARY KEY (county))")
    

#connect to mysql
try:
    cnx = mysql.connector.connect(host="localhost", user="root", password='password', database="michigan")
    cursor = cnx.cursor()
    #restart database
    restartTable(cursor)
    cnx.commit()
    
    #insert data
    for county in data:
        if county:
            insert(cursor, county)
    cnx.commit()
        
    cursor.close()
    print("Data added to MySQL michigan.data table")
except mysql.connector.Error as err:
    print("this is an error :(")
    print(err)
finally:
    try:
        cnx
    except NameError:
        pass
    else:
        cnx.close()

#delete stats.xhtml
try:
    os.remove("michigan.xhtml")
except:
    print("there was an error")
