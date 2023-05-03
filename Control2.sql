create table student( id_student number not null , fullname varchar(10) not null, gradebook_no int not null,  date_in date not null,  phone varchar(10),primary key(id_student) );
create table subject( id_sub number primary key, name varchar(10),  type varchar(2), volume varchar(10));
create table Group1(id_group number primary key, group_no varchar(10) not null, year varchar(8) , course number not null, semester varchar(5), specialty varchar(20));
create table Structure_group(id_student number not null, id_group number not null, foreign key(id_student) REFERENCES Student(id_student), foreign key(id_group) REFERENCES Group1(id_group));
create table schedule(id_group number not null, id_sub number not null, class_no number ,classroom_no varchar(5),weekday varchar(5),foreign key(id_group) REFERENCES Group1(id_group),foreign key(id_sub) REFERENCES subject(id_sub) );









create table student( id_student numeric not null , fullname varchar(10) not null, gradebook_no int not null,  date_in date not null,  phone varchar(10),primary key(id_student) );
create table subject( id_sub numeric primary key, name varchar(10),  type varchar(2), volume varchar(10));
create table Group1(id_group numeric primary key, group_no varchar(10) not null, year varchar(8) , course numeric not null, semester varchar(5), specialty varchar(20));
create table Structure_group(id_student numeric not null, id_group numeric not null, foreign key(id_student) REFERENCES Student(id_student), foreign key(id_group) REFERENCES Group1(id_group));
create table schedule(id_group numeric not null, id_sub numeric not null, class_no numeric ,classroom_no varchar(5),weekday varchar(5),foreign key(id_group) REFERENCES Group1(id_group),foreign key(id_sub) REFERENCES subject(id_sub) );

select first_name,last_name ,hire_date, salary , commission_pct from employees  where hire_date>'2005-10-22' group by hire_date;

select emp.last_name , job.job_title,dept.department_name from employees emp, departments dept, jobs job,locations loc where  loc.CITY='Southlake' AND emp.job_id=job.job_id AND emp.department_id =
 dept.department_id AND loc.location_id = dept.location_id AND job.job_title = 'Programmer';

select cit.city , count(dept.department_id) from locations loc, (select city from locations)cit, departments dept where dept.location_id = loc.location_id AND loc.city=cit.city group by cit.city;