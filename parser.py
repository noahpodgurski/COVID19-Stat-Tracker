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
    x = table.getAttribute('id')
    if x == "sortable_table_usa" or x == "sortable_table_unitedstates":
        for tr in table.getElementsByTagName('tr'):
            print("------NEW ROW------")
            state  = []
            for td in tr.getElementsByTagName('td'):
                for node in td.childNodes:
                    if node.nodeType == node.TEXT_NODE and str.strip(node.nodeValue) != "":
                        state.append(str.strip(node.nodeValue))
                        print(f"Value: {str.strip(node.nodeValue)}")
            data.append(state)

#convert to ints
for state in data:
    if not state:
        continue
    if state[1].replace(",", "") == "":
        continue
    if state[5].replace(",", "") == "":
        continue
    try:
        state[1] = int(state[1].replace(",",""))
    except:
        state[1] = 0
    try:
        print("this is the state: " + state[4])
        state[5] = int(state[5].replace(",",""))
    except:
        state[5] = 0
        
#mysql functions
def insert(cursor, data):
    print(f"Inserting data: {data[0]}...")
    query = f"INSERT INTO data (state, confirmed,  deaths) VALUES ('{data[0]}', '{data[1]}', '{data[5]}')"
    cursor.execute(query)

def update(cursor, data):
    print(f"Updating data: {data[0]}...")
    query = f"UPDATE data SET confirmed='{data[1]}', deaths='{data[5]}' WHERE state='{data[0]}'"
    cursor.execute(query)
    
def restartTable(cursor):
    cursor.execute("DROP DATABASE IF EXISTS demo")
    cursor.execute("CREATE DATABASE demo")
    cursor.execute("USE demo")
    cursor.execute("CREATE TABLE data(state VARCHAR(40), confirmed INT(255), deaths INT(255), PRIMARY KEY (state))")
    

#connect to mysql
try:
    cnx = mysql.connector.connect(host="localhost", user="root", password='password', database='demo')
    cursor = cnx.cursor()
    #restart database
    #restartTable(cursor)
    #cnx.commit()
    
    #insert data
    #for state in data:
    #    if state:
    #        insert(cursor, state)
    #cnx.commit()

    #update data
    for state in data:
        if state:
            update(cursor, state)
    cnx.commit()

    
    cursor.close()
except mysql.connector.Error as err:
    print("this is an error :(")
    print(err)
finally:
    try:
        cnx
    except NameError:
        print("could not connect")
    else:
        cnx.close()

#delete stats.xhtml
try:
    os.remove("stats.xhtml")
except:
    pass

print("Data added to MySQL demo.data table")
