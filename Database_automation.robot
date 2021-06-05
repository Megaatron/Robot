*** Settings ***

Library    DatabaseLibrary
Library    OperatingSystem
Library    SeleniumLibrary
Library    Collections


Suite Setup    Connect to Database    pymysql    ${dbname}    ${Username}    ${Password}    ${dbhost}    ${dbport}

*** Variables ***
${DBName}    classicmodels
${Username}    root
${Password}    Test@123
${DBHost}    127.0.0.1
${DBPort}    3306

*** Test Cases ***

Verify the record is present in the database

   check if exists in database    SELECT * FROM classicmodels.employees where employeeNumber = 1002;
   row count is equal to x    SELECT * FROM classicmodels.employees where employeeNumber = 1002;    1

Verify the record is not present in the database

    check if not exists in database    SELECT * FROM classicmodels.employees where employeeNumber = 9873;
    row count is equal to x    SELECT * FROM classicmodels.employees where employeeNumber = 9873;    0