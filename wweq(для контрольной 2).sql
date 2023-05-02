create table student( id_student number not null , fullname varchar(10) not null, gradebook_no int not null,  date_in date not null,  phone varchar(10),primary key(id_student) );
create table subject( id_sub number primary key, name varchar(10),  type varchar(2), volume varchar(10));
create table Group1(id_group number primary key, group_no varchar(10) not null, year varchar(8) , course number not null, semester varchar(5), specialty varchar(20));
create table Structure_group(id_student number not null, id_group number not null, foreign key(id_student) REFERENCES Student(id_student), foreign key(id_group) REFERENCES Group1(id_group));
create table schedule(id_group number not null, id_sub number not null, class_no number ,classroom_no varchar(5),weekday varchar(5),foreign key(id_group) REFERENCES Group1(id_group),foreign key(id_sub) REFERENCES subject(id_sub) );

select first_name,last_name ,hire_date, salary , commission_pct from employees  where hire_date>'2005-10-22' group by hire_date;
select emp.last_name , job.job_title,dept.department_name from employees emp, departments dept, jobs job,location loc where  loc.CITY='Southlake' ;

доделать 2 задачу
