\c lg

start transaction;

CREATE OR REPLACE PROCEDURE insert_sale() 
LANGUAGE SQL 
AS $$ 
insert into sale values (113910,912300);
$$; 

CREATE OR REPLACE PROCEDURE update_emp_email(name varchar(255), mail varchar(255)) 
LANGUAGE SQL 
AS $$ 
update employee set eEmail = mail where eName like name;
$$;

call update_emp_email('Alex', 'alex_123@gmail.com');

savepoint s1;

call insert_sale();

rollback to s1;
end transaction;
select * from employee;