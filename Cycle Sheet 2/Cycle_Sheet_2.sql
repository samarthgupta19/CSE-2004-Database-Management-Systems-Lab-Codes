# 19BDS0042 SAMARTH GUPTA
# DATABASE MANAGEMENT SYSTEMS LAB
# LAB CYCLE SHEET-2
# SLOT : L43+L44

-----------------------------------------------------------------------------------------------------------------------
• DDL statements (ALTER, CONSTRAINT etc):

1) Modify Hospital_Bill by adding an attribute consulting_physician and add foreign key constraint for that attribute. Use constraint name for foreign key constraint.
SQL> Alter Table Hospital_Bill add(consulting_physician varchar2(10) , constraint cphy foreign key(consulting_physician) references doctor(doc_id));
Table altered.

2) In Patient table, replace address with three attributes namely street, city and pincode.
SQL> Alter Table Patient Drop column Address;
Table altered.
SQL> Alter Table Patient ADD(Street varchar2(20),City varchar2(15),Pincode number(6));
Table altered.

3) Add an attribute Test_Time which can accept only two values “Before food” and “After food” with proper constraint name.
SQL> alter table Patient add Test_Time varchar(10);
Table altered.
SQL> alter table Patient add constraint ck_test_time check(Test_Time
='Before food' or Test_Time = 'After food');
Table altered.

4) Remove the constraint only from test_time attribute.
SQL>alter table Patient drop constraint ck_test_time;
Table altered.

5) Drop address attribute from staff table and add attributes door_no, street, city, and pincode.
SQL> alter table Staff drop column Address;
Table altered.
SQL> alter table staff add Door_No number(5);
Table altered.
SQL> alter table Staff add street varchar(20);
Table altered.
SQL> alter table Staff add city varchar(20);
Table altered.
SQL> alter table Staff add pincode number(6);
Table altered.

6) Create a table Medicines with schema medicines=(med_name, brand, dosage, manu_date, exp_date). Ensure that manu_date should not be later than exp_date. Create an appropriate constraint to ensure this.
SQL> create table Medicines(
med_name varchar(30),
brand varchar(20),
primary key(med_name),
dosage varchar(25),
manu_date date,
exp_date date 8
);
Table created.
SQL> alter table Medicines add constraint ck_manu_date check( manu_date
<exp_date);
Table altered.

7) Remove the attributes dosage and brand from Prescribed_Medicines and alter the medicine_name attribute as a foreign key referencing the new table Medicines.
SQL> alter table Prescribed_Medicines drop column dosage;
Table altered.
SQL> alter table Prescribed_Medicines drop column brand;
Table altered.
To Avoid Parent Key Constraint Violation We Add Data :
SQL> insert into Medicines values('Cestrizine','Ranbaxy','Twice a day','10-JAN-2018','10-JAN-2020');
1 row created.
SQL> insert into Medicines values('Cyra-D','Sun Pharma','Thrice a day','07- MAR-2016','08-MAR-2017');
1 row created.
SQL> insert into Medicines values('Rantidine','Patanjali','Once a day','22- APR-2017','22-APR-2019');
1 row created.
SQL> insert into Medicines values('Supracal','XYZ','Twice a day','22-APR-2017','22-APR-2019');
1 row created.
SQL> insert into Medicines values('Calamine','Birla Care','Twice a day','02-JUN-2020','02-JUN-2022');
1 row created.
SQL> insert into Medicines values('Juzgot','Ultramed','Once a day','04-JAN-2019','10-JAN-2020');
1 row created.
Now , Adding Constraint:
SQL> alter table Prescribed_Medicines add constraint fk_medicine_name foreign
2 key(medicine_name) references Medicines(med_name);
Table altered.

8) Create a view for doctors who are specialized in ‘Cardiology’ from Doctor table with attributes doc_id, doc_name and gender.
SQL> create view Cardiology_Doctors as select doc_id, doc_name, gender from
2 Doctor where specialist = 'Cardiology';
View created.

9) Add an attribute No_of_staff in Department table and create a constraint with constraint name to make sure the number is >0.
SQL> alter table Department add No_of_staff int;
Table altered.
SQL> alter table Department add constraint ck_no_of_staff check(No_of_staff > 0);
Table altered.

10)Add an attribute with In_Patient_prescription to store the Room_Type which can store the values “AC” and “Non-AC”.
SQL> alter table In_Patient_Prescription add Room_Type varchar(8);
Table altered.
SQL> alter table In_Patient_Prescription add constraint ck_Room_Type
2 check(Room_Type = 'AC' or Room_Type = 'Non-AC')
Table altered.
--------------------------------------------------------------------------------------------------------------------------
• SQL QUERIES WITH JOIN OPERATION:

1) Find the HOD of Doctor ‘Raghavan’.
SQL> update Doctor set doc_name='Raghavan' where doc_id='D0003';
1 row updated.
SQL> select hod from Department, Doctor where Department.dept_no =
2 Doctor.dept_no and doc_name = 'Raghavan';

HOD
-------
D0003

2) Find the list of all patients who were admitted in bed number ‘B101’.
(B101 IS NOT IN MY DATA , SO I HAVE USED B111)
SQL> select pat_name from Patient,In_Patient where Patient.pat_id=In_Patient.pat_id and bed_no=111;
PAT_NAME
--------------------
Mani

3) Display all the prescribed medicines of patient with Pat_ID ‘P101’.
SQL> select distinct medicine_name from Prescribed_Medicines,Patient where Patient.pat_id='P101';
MEDICINE_NAME
---------------
Supracal

4). Display the test results of patient ‘Mani’.
SQL> select result from Test_Results, Lab_Tests,Patient where Test_Results.test_id = Lab_Tests.test_id and Lab_Tests.pat_id =Patient.pat_id and pat_name = 'Mani';
RESULT
------------------------------
Positive

5) Display all bills of bill amount more than 10000 rupees and paid by the patient ‘Steve’.
SQL> select distinct b.bill_amount from Hospital_Bill b inner join Patient p on b.pat_id = 'P103' where b.bill_amount > 10000;
no rows selected
SQL> select distinct b.bill_amount from Hospital_Bill b inner join Patient p on
2 b.pat_id = 'P1003' where b.bill_amount > 1000;
BILL_AMOUNT
---------------------
20000

6) Find the category and address of the nurse who attended the patient with pat_no ‘P220’.
select street,city,category from Staff,Appointment where Staff.staff_id = Appointment.nurse_id and Appointment.pat_id ='P220';
STREET CITY CATEGORY
-------------------- -------------------- --------------------
Civil Lines Vellore Nurse

7) Find the list of doctors who worked in the department which is started on or after ’10-May-2018’.
SQL> select doc_name from Doctor,Department where Doctor.dept_no =Department.dept_no and estd_date >= '10-May-2018';
DOC_NAME
--------------------
Manimaran
Saleem

8) Get the name of technicians who test Blood Glucose Level.
SQL> select staff_name from Staff,test_types where test_types.technician = Staff.staff_id and description = 'Blood Glucose Level';
no rows selected
STAFF_NAME
--------------------
Ranjan

9) Display the details of all patients who were hospitalized between ’10-Mar-2017’ and ’10-Apr-2017’.
SQL> Select distinct *from In_Patient s, In_Patient e where s.date_of_admission > '10- Mar2017’ and e.date_of_admission < '10-APR-2017';
PAT_ID DATE_OF_A BED_NO START_TIM END_TIME PAT_ID DATE_OF_A BED_NO
------- --------- ---------- --------- --------- ------- --------- ----------
START_TIM END_TIME
--------- ---------
P1003 08-MAR-17 204 10-MAR-17 10-APR-17 P1003 08-MAR-17 204
10-MAR-17 10-APR-17

10) Display the in-patient prescription of the patient whose name is ‘Gayle’.
SQL> Select *from In_Patient_Prescription,Patient where In_Patient_Prescription.pat_id=Patient.pat_id and pat_name='Gayle';
PAT_ID PRES_ID ROOM_TYP PAT_ID PAT_NAME DOB G CONTACT

------- ------- -------- ------- -------------------- --------- - ----------
STREET CITY PINCODE TEST_TIME
-------------------- --------------- ---------- ----------
P220 PR00220 P220 Gayle 12-AUG-91 M 9898687999

------------------------------------------------------------------------------------------------------------------

• SQL QUERIES WITH AGGREGATE AND CHAR FUNCTIONS :

1) Find the number of doctors who are working in the department ‘D101’.
SQL> select count(*) as D102_Count from Doctor where dt_no = 'D102';
D102_COUNT
----------
1

2) Count the number of male patients who are treated by the doctor with doctor id ‘D101’.
(I USE D0001 AS D101 IS NOT IN MY DATA)
SQL> select count(gender) as Male_Patient from Patient,Appointment where Appointment.pat_id=
2 Patient.pat_id and Appointment.doc_id='D0001' and Patient.gender='M';
MALE_PATIENT
---------------------
1

3) Find the total bill paid by the patient ‘Karthik’.
SQL> select sum(Hospital_Bill.bill_amount) as total_bill_paid_by_karthik from Hospital_Bill,Patient where Hospital_Bill.pat_id = Patient.pat_id and pat_name = 'Karthik';
TOTAL_BILL_PAID_BY_KARTHIK
-----------------------------------------------
90000

4) Find the name and address of the patient who paid the highest bill of all patients.
SQL> select pat_name,street,city from Patient,Hospital_Bill where Patient.pat_id = Hospital_Bill.pat_id and Hospital_Bill.bill_amount = (select max(bill_amount) from Hospital_Bill);
PAT_NAME STREET CITY
-------------------- -------------------- ---------------
Ramakant Mary Street Vellore

5) Get the specialization of doctors whose name start with the letter ‘M’.
SQL> select specialist,doc_name from Doctor where doc_name like 'M%';
SPECIALIST DOC_NAME
-------------------- --------------------
Neurology Manimaran
Gynaecology Meenakshi

6) Find the all the patients details whose name is exactly 5 characters long.
SQL> select * from patient where pat_name like '_____';
PAT_ID PAT_NAME DOB G CONTACT STREET
------- -------------------- --------- - ---------- --------------------
CITY PINCOD
--------------- ---------- ----------
P1002 Seema 01-JUN-95 F 9878987890
P220 Gayle 12-AUG-91 M 9898687999
P1005 Steve 31-OCT-94 M 7894687921

7) Display the department names in ascending order.
SQL> select dt_name from Department order by dt_name asc;
DT_NAME
--------------------
Cardiology
Diabetes
Gynaecology
Intensive Care Unit
Neurology

8) Get the gender wise count of patients.
SQL> select count(gender) as gender_count, gender from patient group by gender;
GENDER_COUNT G
---------------------------
5 M
1 F

9) Get the count of doctors for each specialization.
SQL> select specialist, count(specialist) as specialist_count from Doctor group by specialist;
SPECIALIST SPECIALIST_COUNT
-------------------- ----------------
Neurology 1
Cardiology 1
Diabetes 1
Gynaecology 1
General Medicine 1

10) Get the total number tests conducted in any particular date.
SQL> select count(pat_id) from Lab_Tests where labtest_time_date = '05-MAY-2017 11:30:00';
COUNT(PAT_ID)
-------------
1

--------------------------------------------------------------------------------------------------------------

• SQL QUERIES – NESTED SUBQUERIES:

1. All of the queries in “SQL queries with JOIN operation” section can be tried with subqueries concept.

(a). Find the HOD of doctor ‘Raghavan’
SQL> select hod from Department where dt_no = (select dt_no from Doctor where doc_name = 'Raghavan');
HOD
-----
D0003

(b). Find the list of all patients who were admitted in bed number ‘B101’.
SQL> select pat_name from Patient where pat_id in (select pat_id from In_Patient where bed_no = 111);
PAT_NAME
--------------------
Mani

(c). Display all the prescribed medicines of patient with Pat_ID ‘P101’
SQL> select medicine_name from Prescribed_Medicines where pres_id in (select pres_id from In_Patient_Prescription where pat_id = 'P101');

MEDICINE_NAME
---------------
Supracal

(d). Display the test results of patient ‘Mani’.
SQL> select result from Test_Results where test_id = (select test_id from Lab_Tests ,Patient where Lab_Tests.pat_id = Patient.pat_id and pat_name = 'Eli Wire');
RESULT
--------------
Positive

(e). Display all bills of bill amount more than 10000 rupees and paid by the patient ‘Steve’.
SQL> select bill_amount from Hospital_Bill where pat_id = (select pat_id from Patient where pat_name = 'Steve') and bill_amount > 1000;
BILL_AMOUNT
---------------------
20000

f) Find the category and address of the nurse who attended the patient with pat_no ‘P220’.
SQL> select category, street, city from Staff where staff_id in (select nurse_id from Appointment where pat_id = 'P220');
STREET CITY CATEGORY
-------------------- -------------------- --------------------
Civil Lines Vellore Nurse

g) Find the list of doctors who worked in the department which is started on or after ’10-May-2018’.
SQL> select doc_id, doc_name from Doctor where dt_no in (select dt_no from Department where estd_date >= '10-MAY-2018');
DOC_I DOC_NAME
------------------------------
D0002 Manimaran
D0011 Saleem

h) Get the name of technicians who tests blood glucose level.
SQL> select staff_name from Staff where staff_id in (select technician from test_types where description = 'Blood Test');
STAFF_NAME
--------------------
Ranjan

i) Display the details of all patients who were hospitalized between ’10- Mar2017’ and ’10-Apr-2017’
SQL> select *from Patient where pat_id in (select pat_id from In_Patient where start_time > '09-MARCH-2017' and end_time < '11-APRIL-2017');
PAT_ID PAT_NAME DOB G CONTACT STREET
------- -------------------- --------- - ---------- --------------------
CITY PINCODE TEST_TIME
--------------- ---------- ----------
P1003 Ramakant 26-JAN-90 M 8878687894

j) Display the in-patient prescription of the patient whose name is ‘Gayle’.
SQL> select *from In_Patient_Prescription where pat_id = (select pat_id from Patient where pat_name = 'Gayle');
PAT_ID PRES_ID ROOM_TYP
------- ------- --------
P220 PR00220


2) Display the list of doctors who are working in the department with more number of doctors using sub-query and IN operator.
(AS PER MY DATA , THERE IS ONLY 1 DOCTOR IN EACH DEPT.)
SQL> select doc_name from doctor,department group by doc_name having count(hod)>1;
DOC_NAME
--------------------
Jayalakshmi
Raghavan
Manimaran
Meenakshi
Saleem


3) Find the name and id of all patients who are older than all the doctors in the entire ‘cardiology’ department. Use subqueries and ALL operator.
SQL> select pat_name, pat_id from Patient where dob < all(select dob from Doctor where dept_no = 'DEP001');
no rows selected


4) Find the prescription ids of all prescription that included a medicine from the brand ‘Ranbaxy’ using nested subqueries.
SQL> select pres_id from Prescription where pres_id in (select pres_id from Prescribed_Medicines,Medicines where brand = 'Ranbaxy' and Prescribed_Medicines.medicine_name=Medicines.med_name);

PRES_ID
-----------
PR001


5) Find the list of patients who paid their bill through either ‘credit card’ or ‘debit card’ using subquery.
SQL> select pat_name from Patient where pat_id in (select pat_id from Hospital_Bill where payment_type = 'card' or payment_type = 'Debit card');
PAT_NAME
-------------------
Karthik
Ramakant
Mani
Gayle
----------------------------------------------------------------------------------------------------------------------

• SQL QUERIES USING OTHER FUNCTIONS(DATE,NUMERIC,CHARACTER)DATE FUNCTION QUERIES:

Q.1. Find the last date of month from the established date for a department with department number ‘DEP001’;
SQL> SELECT last_day(Estd_date) FROM Department WHERE dt_no = 'D012';
LAST_DAY
---------------
30-JUN-19


Q.2. Find the date after adding 2 months in the date with appointment id ‘APP002’.
SQL> select add_months(appt_time,2) as date_after_adding_2_months from Appointment where app_id = 'APP002’;

DATE_AFTE
----------------
30-JUN-17

-------------------------------------------------------------------------------------------------------------------------
NUMERIC FUNCTION QUERIES:


1) Find the Square Root of Bill Amount of patient having patient id as ‘P1002’.
SQL> select sqrt(bill_amount) from Hospital_Bill where pat_id = 'P1002';
SQRT(BILL_AMOUNT)
------------------------------
346.410162


2) Find the tangential value(trigonometric) of all bill amounts.
SQL> select tan(bill_amount) from Hospital_Bill;
TAN(BILL_AMOUNT)
----------------
-.36088638
.662929444
-8.1190551
-3.3182738
.281962076
.715672631

------------------------------------------------------------------------------------------------------------------------------
CHARACTER FUNCTIONS QUERIES:

1) Display the Names of All Doctors in Lower Letters.
SQL> select lower(doc_name) as doc_name from Doctor;
DOC_NAME
--------------------
raghavan
manimaran
meenakshi
saleem
Jayalakshmi


2) Display the First Letter OF Each Patient Name In Capital Letter.
SQL> select initcap(pat_name) from Patient;
INITCAP(PAT_NAME)
--------------------
Karthik
Seema
Ramakant
Mani
Gayle
Steve
----------------------------------------------------------------------------------------------------------------------------------
# TRIGGERS OUT OF SYLLABUS
---------------------------------------------------------------------------------------------------------------------------------
