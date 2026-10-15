--1.  Write create table syntax for employee table and Incentive table

--a.--------------------------------------------------------------------------------------------------------------------------------------
create table employee 
(
emp_id number(10) primary key,
first_name varchar(20),
last_name varchar(20),
salary number(20),
joining_date date,
department varchar(20)
)

select * from employee


--b.--------------------------------------------------------------------------------------------------------------------
create table incentives
(
employee_ref_id  constraint fk references employee(emp_id),
incentive_date date,
incentive_amount number(10)
);

select * from incentives

--2.  Writesyntax for insert data into table of employee table and Incentive table
--a.
insert into employee values(1,'John','Abraham',1000000,'01-JAN-13','Banking');
insert into employee values(2,'Michael','Clarke',800000,'01-JAN-13','Insurance');
insert into employee values(3,'Roy','Thomas',700000,'01-FEB-13','Banking');
insert into employee values(4,'Tom','Jose',600000,'01-FEB-13','Insurance');
insert into employee values(5,'Jerry','Pinto',650000,'01-FEB-13','Insurance');
insert into employee values(6,'Philip','Mathew',750000,'01-JAN-13','Services');

--b.

insert into incentives values (1,'01-FEB-13',5000);
insert into incentives values (2,'01-FEB-13',3000);
insert into incentives values (3,'01-FEB-13',4000);
insert into incentives values (1,'01-JAN-13',4500);
insert into incentives values (2,'01-JAN-13',3500);


--3.  Get all employee details from the employee table--------------------------------------------------------------------------------------------------------------------------------
select * from employee;





--4.  Get First_Name,Last_Name from employee table-----------------------------------------------------------------------------------------------------------
select first_name, last_name from employee;





--5.  Get First_Name from employee table using alias name �Employee Name�--------------------------------------------------------------------------------------------------------------------
select first_name  Employee_Name from employee;





--6.  Get First_Name from employee table in upper case----------------------------------------------------------------------------------------------------------------------------------
select upper(first_name) first_name from employee;






--7.  Select first 3 characters of FIRST_NAME from EMPLOYEE-----------------------------------------------------------------------------------------------------------------------------
select substr(First_name,1,3)  from employee ;






--8.  Get position of 'o' in name 'John' from employee table-----------------------------------------------------------------------------------------------------------------------------
select instr('John','o') from employee where first_name='John';






--9.  Get FIRST_NAME from employee table after removing white spaces from right side.----------------------------------------------------------------------------------------------------
select rtrim(first_name) from employee;




--10. Get First_Name from employee table after replacing 'o' with '$'----------------------------------------------------------------------------------------------------------
select translate(first_name,'o','$') from employee;




--11. Get First_Name and Last_Name as single column from employee table separated by a '_'-------------------------------------------------------------------------------------------
select first_name||'_'||last_name full_name from employee;





--12. Get FIRST_NAME, Joining_year, Joining Month and Joining Date from employee table------------------------------------------------------------------------------------------------
select first_name, extract(year from(joining_date)),extract(month from(joining_date)),extract(day from (joining_date)) from employee;





--13. Get all employee details from the employee table order by First_Name Ascending-------------------------------------------------------------------------------------
select * from employee order by first_name;




--14. Get all employee details from the employee table order by First_Name Ascending and Salary Descending?------------------------------
select * from employee order by first_name , salary desc;




--15. Get employee details from employee table whose employee name is �John�-------------------------
select * from employee where first_name='John';



--16. Get employee details from employee table whose employee name are �John� and �Roy�----------------------------------
select * from employee where first_name in('John','Roy');



--17. Get employee details from employee table whose employee name are not �John� and �Roy�.
select * from employee where first_name not in ('John','Roy');
select * from employee where first_name not in ('Tom','Jerry');
SELECT * FROM EMPLOYEE WHERE FIRST_NAME NOT IN ('Michael','Roy');




--18. Get employee details from employee table whose first name starts with 'J'.---------------------------------------------------------------------------
select * from employee where first_name like 'J%';
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE 'T%';
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'P%';







--19. Get employee details from employee table whose first name contains 'o'.----------------------------------------------------------------------------------------
select * from employee where first_name like '%o%';
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '%e%';
SELECT * FROM EMPLOYEE WHERE FIRST_NAME LIKE '%r%';





--20. Get employee details from employee table whose first name ends with 'n'.--------------------------------------------------------------------------------
select * from employee where first_name like '%n';
select * from employee where first_name like '%m';
select * from employee where first_name like '%y';



--21. Get employee details from employee table whose first name ends with 'n' and name contains 4 letters.------------------------------------------------
select * from employee where first_name like '___n';
select * from employee where first_name like '______l';
select * from employee where first_name like '__y';






--22. Get employee details from employee table whose first name starts with 'J' and name contains 4 letters.-----------------------------------------
select * from employee where first_name like 'J___';
select * from employee where first_name like 'T__';
select * from employee where first_name like 'M______';





--23. Get employee details from employee table who�s Salary greater than 600000.---------------------------------------------------------------------------------
select * from employee where salary > 600000;
select * from employee where salary > 700000;
select * from employee where salary < 700000;



--24. Get employee details from employee table whose joining year is �2013�.------------------------------------------------------------------------------------------
select * from employee where extract(year from(joining_date))= 2013;







--25. Get employee details from employee table whose joining month is �January�.----------------------------------------------------------------------------------
select * from employee where extract( month from (joining_date))= 1;
select * from employee where extract( month from (joining_date))= 2;







--26. Get employee details from employee table who joined befor  feb 1st 2013.-----------------------------------------------------------------------------------
select * from employee where joining_date < '01-feb-13';
select * from employee where joining_date > '01-jan-13';




--27. Get employee details from employee table who joined after January 31st-------------------------------------------------------------------------------------------------
select * from employee where joining_date > '01-Jan-13';





--28. Get Joining Date and Time from employee table------------------------------------------------------
select to_char(joining_date,'dd-mon-yy hh:mm:ss') from employee;
select to_char (joining_date,'dd-mon-yy hh:mm:ss')from employee;





--29. Get Joining Date, Time including milliseconds from employee table-------------------------------------------------------------
select to_char(joining_date,'dd-mon-yy hh:mm:ss:mm') from employee;




--30. Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table.
select months_between(e.joining_date,i.incentive_date) from employee e join incentives i on e.emp_id=i.employee_ref_id;

select * from employee;
select * from incentives;




--31. Get department, total salary with respect to a department from employee table.-------------------------------------------------------------------

select department , sum(salary) total_sal from employee
group by department ;






--32. Get department, total salary with respect to a department from employee table order by total salary descending.---------------------------------------------------------
select department , sum(salary) total_sal from employee
group by department 
order by sum(salary) desc;


select department , sum(salary) total_sal from employee
group by department 
order by sum(salary) ;



--33. Get department, no of employees in a department, total salary with respect to a department from employee table order by total salary descending.----------------
select department ,count(*), sum(salary) total_sal from employee
group by department 
order by sum(salary) desc;





--34. Get department wise average salary from employee table order by salary ascending?---------------------------------------------------
select department , avg(salary)avg_sal from employee
group by department 
order by avg(salary) ;


select department , avg(salary)avg_sal from employee
group by department 
order by avg(salary) desc;



--35. Get department wise maximum salary from employee table order by salary ascending?------------------------------------------------------------
select department , max(salary) max_sal from employee
group by department 
order by max(salary) ;



select department , max(salary) max_sal from employee
group by department 
order by max(salary)desc ;




--36. Get department wise minimum salary from employee table order by salary ascending?---------------------------------------------------
select department , min(salary) min_sal from employee
group by department 
order by min(salary) ;


select department , min(salary) min_sal from employee
group by department 
order by min(salary)desc ;






--37. Select no of employees joined with respect to year and month from employee table.


select count(e.emp_id),extract(year from(e.joining_date)),extract(month from(e.joining_date))
from employee e
group by extract(year from(e.joining_date)),extract(month from(e.joining_date));






--38. Select department,total salary with respect to a department from employee table where total salary greater than 800000 order by Total_Salary descending--------------------
select department , sum(salary) total_sal from employee
having sum(salary) >800000
group by department 
order by sum(salary) desc;

select * from employee


select department , count(*), sum(salary) total_sal from employee
having sum(salary) < 800000
group by department 
order by sum(salary);


--39. Select employee details from employee table if data in incentive table?
select * from employee 
where emp_id in(select employee_ref_id from incentives );

select * from incentives  




--40. Select 20 % of salary from John, 10% of Salary for Roy and for other 15 % of salary from employee table
select first_name,salary,case first_name when 'John' then salary *0.20
                       when 'Roy' then salary *0.10
                       else salary*0.15 end modified_sal
from employee;

--------------------------------------------------------------------------------------------------
select first_name,salary,case first_name when 'John' then salary *0.30
                       when 'Roy' then salary *0.50
                       else salary*0.20 end modified_sal
from employee;


---------------------------------

--41. Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as  'Services Dept' from employee table.
select case department when 'Banking' then 'Bank Dept'
                       when 'Insurance' then 'Insurance Dept'
                       when 'service' then 'Services Dept'
                       end
from employee;
          


                
--42. Delete employee data from employee table who got incentives in incentive table


--43. Select first_name, incentive amount from employee and incentives table for those employees who have incentives.
select e.first_name,i.incentive_amount from employee e join incentives i on e.emp_id =i.employee_ref_id

select * from employee
select * from incentives



--44. Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000
select e.first_name,i.incentive_amount from employee e join incentives i on e.emp_id =i.employee_ref_id
where i.incentive_amount>3000;



--45. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives
select e.first_name,  i.incentive_amount from employee e join incentives i on e.emp_id =i.employee_ref_id
union all
select first_name  , null  from employee where emp_id not in(select employee_ref_id from incentives);



select e.first_name,i.incentive_amount from employee e left join incentives i on e.emp_id =i.employee_ref_id;


--46. Select first_name, incentive amount from employee and incentives table for all employees even if they didn't get incentives 
   --and set incentive amount as 0 for those employees who didn't get incentives.
select e.first_name,i.incentive_amount from employee e join incentives i on e.emp_id =i.employee_ref_id
union all
select first_name , 0 from employee where emp_id not in(select employee_ref_id from incentives);

select e.first_name,nvl(i.incentive_amount,0) from employee e left join incentives i on e.emp_id =i.employee_ref_id;

   
--47. Select first_name, incentive amount from employee and incentives table for all employees who got incentives using left join
select e.first_name,i.incentive_amount from employee e left join incentives i on e.emp_id =i.employee_ref_id
where i.incentive_amount is not null;

--48. Select max incentive with respect to employee from employee and incentives table using sub query.

                                                                                     
 

select * from employee;
select * from incentives;
