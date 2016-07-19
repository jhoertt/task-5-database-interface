#!bin/bash

#This is the code that will create the database and populate it from our files.
echo "What is your mysql password?"
read(password)

#Creating the database, the table in the database and defining it's rows
mysql -u root -p$password -e "DROP DATABASE IF EXISTS TeamOrange; CREATE DATABASE TeamOrange; USE TeamOrange; show databases; CREATE TABLE Answers(Age INT, Pets INT, Siblings INT, Planets INT, IceCream VARCHAR(5), Date VARCHAR(30)); show tables;"

#Putting all the answers into a single file
cat TeamOrangeAnswer* > /tmp/temp.csv

#Putting the data into the table
mysql -u root -p$password -e "USE TeamOrange; LOAD DATA INFILE '/tmp/temp.csv' INTO TABLE Answers FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"'; SHOW COLUMNS FROM Answers; SELECT * FROM Answers;" 

#Putting the Database into a .sql file
mysqldump -u root -p$password TeamOrange > TeamOrange.sql

#see the folders
ls

#remove temporary file
rm /tmp/temp.csv
