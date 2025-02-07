# 19BDS0042 SAMARTH GUPTA
# DATABASE MANAGEMENT SYSTEMS LAB 
# LAB CYCLE SHEET-3
# SLOT: L43+L44
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PL/SQL AND FUNCTIONS :

1. Write a PL/SQL program to implement a simple calculator.
SQL> set serveroutput on; SQL> Declare
2 num1 number := &num1;
3 num2 number := &num2;
4 op varchar(1) := '&op';
5 Begin
6 if op='+' then
7 dbms_output.put_line(num1||'+'||num2||'='||(num1+num2));
8 elsif op='-' then
9 dbms_output.put_line(num1||'-'||num2||'='||(num1-num2));
10 elsif op='*' then
11 dbms_output.put_line(num1||'*'||num2||'='||(num1*num2));
12 elsif op='/' then
13 dbms_output.put_line(num1||'/'||num2||'='||(num1/num2));
14 else
15 dbms_output.put_line('Choose Operator from +,*,-,/ only');
16 end if;
17 end;
18 /
Enter value for num1: 20
old 2: num1 number := &num1; new 2: num1 number := 20;
Enter value for num2: 10
old 3: num2 number := &num2; new 3: num2 number := 10;
Enter value for op: *
old 4: op varchar(1) := '&op'; new 4: op varchar(1) := '*'; 20*10=200
PL/SQL procedure successfully completed.


2. Write a PL/SQL program to practice reading the record from a table into local variables using different data types and %TYPE and display the same using locally declared variables.
SQL> Declare
2 DepName Department.Dt_Name%TYPE;
3 RoomNo Department.Room_No%TYPE;
4 Floor Department.Floor%TYPE;
5 HOD Department.HOD%TYPE;
6 Estd_Date Department.Estd_Date%TYPE;
7 DepNo varchar(8) := '&DepNo';
8 Begin
9 Select Dt_Name,Room_No,Floor,HOD,Estd_Date into DepName,RoomNo,Floor,HOD,Estd_Date
10 from Department where DepNo=Dt_No;
11 dbms_output.put_line('Department '||DepNo||' DETAILS:');
12 dbms_output.put_line('Department Name: '||DepName);
13 dbms_output.put_line('Room Number: '||RoomNo);
14 dbms_output.put_line('Floor: '||Floor);
15 dbms_output.put_line('Head of Department: '||HOD);
16 dbms_output.put_line('Establishment Date: '||Estd_Date); 17 end;
18 /
Enter value for depno: D102
old 7: DepNo varchar(8) := '&DepNo'; new 7: DepNo varchar(8) := 'D102'; Department D102 DETAILS: Department Name: Intensive Care Unit Room Number: 402
Floor: 4
Head of Department: D0011 Establishment Date: 03-JAN-20
PL/SQL procedure successfully completed.


3. Write a PL/SQL program to find the number of doctors in a given department with a given qualification (read values for department and qualification from user during runtime). If number is more than the number of doctors in that department with other qualifications then display ‘Well qualified’ else
‘Qualified’.
SQL> Declare
2 Doc Doctor%ROWTYPE;
3 CURSOR doctorcursor is select * from Doctor;
4 have number(2);
5 not_have number(2);
6 DepNo varchar(8) := '&DepNo';
7 qual varchar(30) := '&qualfn';
8 Begin
9 have := 0;
10 not_have := 0;
11 open doctorcursor;
12 loop
13 fetch doctorcursor into Doc;
14 exit when doctorcursor%NOTFOUND;
15 if Doc.Dt_No=DepNo AND Doc.Qualification=qual then
16 have := have + 1;
17 elsif Doc.Dt_No = DepNo then
18 not_have := not_have + 1;
19 end if;
20 end loop;
21 close doctorcursor;
22 if have>not_have then
23 dbms_output.put_line('Well Qualified');
24 else
25 dbms_output.put_line('Qualified');
26 end if;
27 dbms_output.put_line('Number of Doctors from '||DepNo||' having '||qual||' Qualification : '||have);
28 dbms_output.put_line('Number of Doctors from '||DepNo||' not having '||qual||' Qualification : '||not_have);
29 end;
30 /
Enter value for depno: D102
old 6: DepNo varchar(8) := '&DepNo'; new 6: DepNo varchar(8) := 'D102';
Enter value for qualfn: MD
old 7: qual varchar(30) := '&qualfn'; new 7: qual varchar(30) := 'MD'; Well Qualified
Number of Doctors from D102 having MD Qualification : 1 Number of Doctors from D102 not having MD Qualification : 0 
PL/SQL procedure successfully completed.


4. Write a PL/SQL program to insert records into any of the tables in your database.
SQL> Begin
2 Insert into Test_Types VALUES('TT007','Narco Test',50,100,'Drugs Level','S0012'); 3 end;
4 /
PL/SQL procedure successfully completed.
SQL> select *from Test_Types;
TT_ID DESCRIPTION LOW_VALUE HIGH_VALUE TEST_METHOD
TECHN
TT007 Narco Test 50 100 Drugs Level S0012


5. Create a function to find the factorial of a given number.
SQL> Declare
2 num number(4) := &num;
3 fac number(10);
4 Begin
5 fac := 1;
6 while num != 1
7 loop
8 fac := fac * num;
9 num := num - 1;
10 end loop;
11 dbms_output.put_line('Factorial of Given Number Is '||fac);
12 end;
13 /
Enter value for num: 5
old 2: num number(4) := &num; new 2: num number(4) := 5; Factorial of Given Number Is 120
PL/SQL procedure successfully completed.


6. Create a function DOC_COUNT to find the number of doctors in the given department. Use the department name as the input parameter for the function.
SQL> CREATE FUNCTION DOC_COUNT (DT_NAME VARCHAR2)
2 RETURN number
3 IS
4 CNT number;
5 BEGIN
6 SELECT COUNT(1) INTO CNT FROM DOCTOR DR
7 INNER JOIN DEPARTMENT DT ON DR.DT_NO=DT.DT_NO WHERE DT.DT_NAME=DT_NAME;
8 RETURN CNT;
9 END;
10 /
Function created.

SQL> SET SERVEROUTPUT ON; SQL> DECLARE
2 DT_NAME VARCHAR2(10);
3 DOC_CNT number;
4 DEP_NAME DEPARTMENT.DT_NAME%TYPE:='&DEP_NAME';
5 BEGIN
6 DT_NAME:= DEP_NAME;
7 DOC_CNT := DOC_COUNT(DT_NAME);
8 dbms_output.put_line(' Total number of doctor available in '|| DT_NAME || ' is ' || DOC_COUNT(DT_NAME));
9 END;
10 /
Enter value for dep_name: Neurology
old 4: DEP_NAME DEPARTMENT.DT_NAME%TYPE:='&DEP_NAME'; new 4: DEP_NAME DEPARTMENT.DT_NAME%TYPE:='Neurology';
Total number of doctor available in Neurology is 5
PL/SQL procedure successfully completed.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CURSORS :

1) Write a CURSOR to give 5% additional discount to all senior citizen patients.
SQL> Declare
2 t1 hospital_bill.pat_id%type;
3 t2 hospital_bill.bill_amount%type;
4 t3 hospital_bill.discount%type;
5 t4 patient.dob%type;
6 a number(3);
7 b number(5);
8 CURSOR c2 is
9 select patient.pat_id,patient.dob,hospital_bill.discount,hospital_bill.bill_amount from patient,hospital_bill where patient.pat_id=hospital_bill.pat_id;
10 begin
11 open c2;
12 loop
13 fetch c2 into t1,t4,t3,t2;
14 EXIT WHEN c2%NOTFOUND;
15 a:=trunc(TO_NUMBER(SYSDATE - TO_DATE(t4)) / 365); --TO CALCULATE AGE
16 dbms_output.put_line('patient id is:'||t1);
17 dbms_output.put_line('amount is:'||t2);
18 dbms_output.put_line('discount is:'||t3);
19 dbms_output.put_line('dob is:'||t4);
20 dbms_output.put_line('age is'||a);
21 if a>20 then --CONSIDERING 20+ IS SENIOR CITIZEN (HERE) 22 b:=t3+t2*0.05;
23 dbms_output.put_line('New discount id:'||b);
24 update hospital_bill set discount=b where hospital_bill.pat_id=t1;
25 end if;
26 end loop;
27 close c2;
28 end;
29 /
patient id is:P1001 amount is:90000 discount is:100 dob is:15-JAN-00 age is20
patient id is:P1002 amount is:120000 discount is:105
dob is:01-JUN-95 age is25
New discount id:6105 patient id is:P1003 amount is:140500 discount is:525
dob is:26-JAN-90 age is30
New discount id:7550 patient id is:P101 amount is:60000 discount is:200
dob is:02-APR-00 age is20
patient id is:P220 amount is:110000 discount is:840 dob is:12-AUG-91 age is29
New discount id:6340 patient id is:P1005 amount is:20000 discount is:350
dob is:31-OCT-94 age is25
New discount id:1350
PL/SQL procedure successfully completed.


2) Write a CURSOR to change the department number from 1 as 5 for all doctors with a qualification ‘MD’.
SQL> Declare
2 cursor cur is select * from Doctor;
3 lr cur%ROWTYPE;
4 dept varchar(6);
5 Begin
6 open cur;
7 loop
8 fetch cur into lr;
9 exit when cur%NOTFOUND;
10 if(lr.qualification = 'MD') AND (lr.dept_no = 'DEP001') then
11 dbms_output.put_line(chr(10)||'doc_id= '||lr.doc_id);
12 select dept_no into dept from doctor where doc_id=lr.doc_id;
13 dbms_output.put_line('Previous Department No.= '||dept);
14 update doctor set dept_no='DEP005' where doc_id=lr.doc_id;
15 select dept_no into dept from doctor where doc_id=lr.doc_id;
16 dbms_output.put_line('New Department No.= '||dept);
17 end if;
18 end loop;
19 close cur;
20 end;
21 /
PL/SQL procedure successfully completed.

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
FUNCTIONS AND PROCEDURES :

1) Write a PL/SQL stored function COUNT_DOC to count the number of doctors who have treated at least 100 patients if given a doctor id as input parameter.
SQL> Declare
2 c number(3);
3 c1 number(3);
4 function counter(docid appointment.doc_id%type) return number is
5 Begin
6 select count(*) into c from appointment where doc_id=docid;
7 return c;
8 end;
9 Begin
10 c1:=Counter('D0001');
11 if c1>100 then
12 dbms_output.put_line('Count is:'||c1);
13 else
14 dbms_output.put_line('The Doctor doesn''t treat more than 100 patients.The Count is '||c1);
15 end if;
16 end;
17 /
The Doctor doesn't treat more than 100 patients.The Count is 1
PL/SQL procedure successfully completed.


2) Write a PL/SQL stored procedure to adjust the payment type of hospital bills to CASH if the patient id and amount details given as input.
SQL> create or replace procedure bill(amount in hospital_bill.bill_amount%type,id hospital_bill.pat_id%type) is
2 Begin
3 update hospital_bill set payment_type='Cash' where pat_id=id; 4 update hospital_bill set bill_amount=amount where pat_id=id;
5 end;
6 /
Procedure created.

/* --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
*TRIGGERS - OUT OF SYLLABUS*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
