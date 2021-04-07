19BDS0042 - SAMARTH GUPTA
# CSE-2004-Database-Management-Systems-Lab-Codes
Database Management Systems (DBMS) - Lab Codes - CSE : 2004

Questions PDF's :-
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

[Cycle Sheet-1.pdf](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes/files/6254944/Cycle.Sheet-1.pdf)

[Solutions](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes-MySQL/blob/main/Cycle%20Sheet%201/Cycle%20Sheet%20-%201)

Hospital Database
Doctor (Doc_ID, Doc_Name, Gender, DOB, Specialist, Qualification, Contact,
Address, Dept_No)

Department (Dept_No, Dept_Name, Room_No, Floor, HOD, Estd_Date)

Staff (Staff_ID, Staff_Name, Category(nurse, lab technician, cashier, security),

Designation, DOB, Contact, Address, Dept_No)

Patient (Pat_ID, Pat_Name, DOB, Gender, Contact, Address)

In_Patient (Pat_ID, Date_Of_Admission, Bed_No, Start_Time, End_Time)

In_Patient_Prescription(Pat_ID, Pres_ID)

Appointment (App_ID, Pat_ID, Doc_ID, Nurse_ID, Consult_Room_No, Date,
Time)

Prescription (Pres_ID, App_ID, Date, Time, Diagnosis_Detail)

Prescribed_Medicines (Pres_ID, Medicine_Name, Dosage, Brand)

Hospital_Bill (Inv_No, Inv_Date, Pat_ID, Bill_Amount, Payment_Type
(cash/credit card/debit card), discount)

Lab_Tests (Test_ID, Pat_ID, Date, Time)

Test_Results (Test_ID, TT_ID, Result)

Test_Types (TT_ID, Description, Low_Value, High_Value, Test_Method,
Technician)

Figure 1: Primary key and foreign keys

Questions:

1. Create all tables in Hospital database as per the requirement given below;
a) The primay key for each table to be created as specified (refer database)
b) Appropriate data type and size should be chosen for each attribute
c) Appropriate integrity constraints should be used while creating tables
(NULL, NOT NULL, FOREIGN KEY, CHECK) – Refer Figure 1
d) The values for some attributes should be as follows; include appropriate
CHECK constraints to achieve them.
i) Primary key values should be created with uniformity. For example,
Doc_ID can be like ‘D0001’ [five characters long and start with ‘D’],
Staff_ID like ‘S0001’, Pres_ID like ‘PR00001’ and so on.
ii) Attributes and permitted values (you can decide and include such
values wherever required)
Attributes Table Permitted values
Qualification Doctor ‘MBBS’, ‘MS’, ‘MD’, ‘BDS’, ‘MDS’
…
Specialist Doctor ‘Diabetes’, ‘Ophthalmology’,
‘Cardiology’, ‘General medicine’, …
Dept_Name Department ‘Cardiology’,
‘Intensive care unit’
‘Neurology’
‘Oncology’
‘Obstetrics and gynaecology’
‘Diabetes’ …
Estd_Date Department Should be later than ’01-Jan-2010’
Category Staff ‘Nurse’, ‘Lab technician’, ‘Attender’,
‘Helper’ …
Designation Staff ‘Staff nurse’, ‘Head nurse’, ‘Technician’,
‘Senior technician’, ‘Senior attender’,
‘Junior attender’ …
Gender Patient ‘M’, ‘F’, and ‘T’ (for third gender)
Start_time In_Patient Date in start_time attribute should not be
older than the date_of_admission value.
Also, it should not be later than
End_time.
Description Test_Types You can use the names of tests like
‘Blood test’, ‘Urine test’, etc.

2. Populate each table with appropriate, valid and meaningful data.

3. Add some attributes with few tables and justify the additions.

4. Write DML queries to achieve the following;
a) Find the details of all doctors.
b) Display all the hospital bill details.
c) List the doctors who are specialized in ‘Cardiology’ and ‘Neurology’
d) List all the appointments made for consultation room number 111, on ’11-Jan-
2020’.
e) Display all the test types that have the values in the range of 25 and 75.
f) Find the diagnosis details of the patient with prescription id ‘PR00012’.
g) Display the name of the patients whose gender is female or the contact number
is 9878987890.
h) Find the staff name and staff id who are not working in the department ‘D102’
i) Find the patients who are admitted on ’01-May-2020’ in the bed 100.
j) Delete the test results that are ‘Positive’
k) Increase the discount with 5% more for all the patients whose bill amount is
greater than 100000.
l) Change the HOD of cardiology department with doctor ‘D0003’
m) Delete the prescribed medicines records that have the brand name ‘XYZ’
n) Modify the low value and high value to 10 and 30 respectively for the clinical
test ‘urine’
o) Update the contact number of all staffs who are in the category ‘Nurse’
p) Delete the staff records that have designations ‘junior attender’ or ‘technician’
and belongs to the department ‘D190’.
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[Cycle Sheet-2.pdf](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes/files/6254946/Cycle.Sheet-2.pdf)

[Solutions](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes-MySQL/blob/main/Cycle%20Sheet%202/Cycle%20Sheet%20-%202)

Questions:

DDL statements (ALTER, CONSTRAINT etc):

1. Modify Hospital_Bill by adding an attribute consulting_physician and add
foreign key constraint for that attribute. Use constraint name for foreign key
constraint.

2. In Patient table, replace address with three attributes namely street, city and
pincode.

3. Add an attribute Test_Time which can accept only two values “Before food”
and “After food” with proper constraint name.

4. Remove the constraint only from test_time attribute.

5. Drop address attribute from staff table and add attributes door_no, street,
city, and pincode.

6. Create a table Medicines with schema medicines=(med_name, brand,
dosage, manu_date, exp_date). Ensure that manu_date should not be later
than exp_date. Create an appropriate constraint to ensure this.

7. Remove the attributes dosage and brand from Prescribed_Medicines and
alter the medicine_name attribute as a foreign key referencing the new table
Medicines.

8. Create a view for doctors who are specialized in ‘Cardiology’ from Doctor
table with attributes doc_id, doc_name and gender.

9. Add an attribute No_of_staff in Department table and create a constraint
with constraint name to make sure the number is >0.

10. Add an attribute with In_Patient_prescription to store the Room_Type
which can store the values “AC” and “Non-AC”.

**********************************************************************************
SQL queries with JOIN operation (Practice these queries with Cartesian product,
inner join, natural join etc.) :-

1. Find the HOD of doctor ‘Raghavan’ (Hint: you need to join the tables
DOCTOR and DEPARTMENT)

2. Find the list of all patients who were admitted in bed number ‘B101’

3. Display all the prescribed medicines of patient with Pat_ID ‘P101’

4. Display the test results of patient ‘Mani’

5. Display all bills of bill amount more than 10000 rupees and paid by the
patient ‘Steve’.

6. Find the category and address of the nurse who attended the patient with
pat_no ‘P220’.

7. Find the list of doctors who worked in the department which is started on or
after ’10-May-2018’.

8. Get the name of technicians who tests blood glucose level.

9. Display the details of all patients who were hospitalized between ’10-Mar-
2017’ and ’10-Apr-2017’

10. Display the in-patient prescription of the patient whose name is ‘Gayle’.

*********************************************************************************
SQL queries with AGGREGATE and CHAR functions

1. Find the number of doctors who are working in the department ‘D101’

2. Count the number of male patients who are treated by the doctor with doctor
id ‘D101’

3. Find the total bill paid by the patient ‘Karthik’

4. Find the name and address of the patient who paid the highest bill of all
patients.

5. Get the specialization of doctors whose name start with the letter ‘M’

6. Find the all the patients details whose name is exactly 5 characters long

7. Display the department names in ascending order

8. Get the gender wise count of patients.

9. Get the count of doctors for each specialization.

10. Get the total number tests conducted in any particular date.

************************************************************************************
SQL queries - Nested subqueries

1. All of the queries in “SQL queries with JOIN operation” section can be tried
with subqueries concept.

2. Display the list of doctors who are working in the department with more
number of doctors using sub-query and IN operator.

3. Find the name and id of all patients who are older than all the doctors in the
entire ‘cardiology’ department. Use subqueries and ALL operator.

4. Find the prescription ids of all prescription that included a medicine from the
brand ‘Ranbaxy’ using nested subqueries.

5. Find the list of patients who paid their bill through either ‘credit card’ or
‘debit card’ using subquery.

******************************************************************************************
SQL queries using other functions

Practice queries using DATE, NUMERIC, and CHARACTER functions. Refer
DBMS_Lab_Reference_Material.pdf file. Try to upload at least two queries from
each function category.

Example: Display the doctor names in capital letters. SELECT
UPPER(Doc_Name) FROM Doctor;
******************
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
[Cycle Sheet-3.pdf](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes/files/6254947/Cycle.Sheet-3.pdf)

[Solutions](https://github.com/samarthgupta19/CSE-2004-Database-Management-Systems-Lab-Codes-MySQL/blob/main/Cycle%20Sheet%203/Cycle%20Sheet%20-%203)

Questions:

1. Write a PL/SQL program to implement a simple calculator.

2. Write a PL/SQL program to practice reading the record from a table into
local variables using different data types and %TYPE and display the same
using locally declared variables.

3. Write a PL/SQL program to find the number of doctors in a given
department with a given qualification (read values for department and
qualification from user during runtime). If number is more than the number
of doctors in that department with other qualifications then display ‘Well
qualified’ else ‘Qualified’.

4. Write a PL/SQL program to insert records into any of the tables in your
database.

5. Create a function to find the factorial of a given number.

6. Create a function DOC_COUNT to find the number of doctors in the given
department. Use the department name as the input parameter for the
function.
*******************************************************************************
Cursors:

1. Write a CURSOR to give 5% additional discount to all senior citizen
patients.

2. Write a CURSOR to change the department number from 1 as 5 for all
doctors with a qualification ‘MD’.
*******************************************************************************
Functions and Procedures:

1. Write a PL/SQL stored function COUNT_DOC to count the number of
doctors who have treated at least 100 patients if given a doctor id as input
parameter.

2. Write a PL/SQL stored procedure to adjust the payment type of hospital bills
to CASH if the patient id and amount details given as input.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

