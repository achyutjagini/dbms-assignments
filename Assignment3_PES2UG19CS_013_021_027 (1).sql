/*creating database*/

drop database IF EXISTS lg;
create database lg;
\c lg

CREATE TABLE SALE(
    sBillingID int NOT NULL,
    sTotalCost int,
    PRIMARY KEY (sBillingID)
);

CREATE TABLE EMPLOYEE(
    eID int NOT NULL PRIMARY KEY,
    eName varchar(50) NOT NULL,
    ePhone int,
    eDOB Date,
    eHireDate Date,
    eSalary int,
    eAccNo int,
    eEmail varchar(255),
    eBank varchar(50),
    eBillingID int NOT NULL,
    FOREIGN KEY (eBillingID) REFERENCES SALE(sBillingID)
);

CREATE TABLE ARCHIVE_EMPLOYEE(
    eID int NOT NULL PRIMARY KEY,
    eName varchar(50) NOT NULL,
    ePhone int,
    eDOB Date,
    eHireDate Date,
    eSalary int,
    eAccNo int,
    eEmail varchar(255),
    eBank varchar(50),
    eBillingID int NOT NULL
);

CREATE TABLE CUSTOMER(
    cID int NOT NULL PRIMARY KEY,
    cName varchar(50) NOT NULL,
    cDOB Date,
    cPhone int,
    cEmail varchar(255),
    cGender varchar(1),
    cLastPurchase Date,
    empID int NOT NULL,
    FOREIGN KEY (empID) REFERENCES EMPLOYEE(eID)
);

CREATE TABLE PAYMENTS(
    pAmountDue int,
    pModeOfPayment varchar(255),
    pBillingID int NOT NULL,
    FOREIGN KEY (pBillingID) REFERENCES SALE(sBillingID)
);

CREATE TABLE LG_PRODUCT(
    lgID int NOT NULL UNIQUE,
    lgName varchar(255) NOT NULL,
    custID int NOT NULL,
    PRIMARY KEY (lgID),
    FOREIGN KEY (custID) REFERENCES CUSTOMER(cID)
);

CREATE TABLE ARCHIVE_LG_PRODUCT(
    lgID int NOT NULL UNIQUE,
    lgName varchar(255) NOT NULL,
    custID int NOT NULL
);

CREATE TABLE LG_PRODUCT_LOG(
    lgID int NOT NULL UNIQUE,
    lgName varchar(255) NOT NULL,
    custID int NOT NULL,
    logger date,
    action varchar(6)
);

CREATE TABLE LG_AC(
    acID int NOT NULL,
    acName varchar(50),
    acModel int,
    acWeight int,
    acMinTemp int,
    acMaxTemp int,
    acWarranty Date,
    acPrice int,
    acElectricityInput int,
    FOREIGN KEY(acID) REFERENCES LG_PRODUCT(lgID)
);

CREATE TABLE LG_WASHING_MACHINE(
    wmID int NOT NULL,
    wmName varchar(50) NOT NULL,
    wmModel int,
    wmWeight int,
    wmWarranty Date,
    wmLoadVolume int,
    wmPrice int,
    wmMotorType varchar(255),
    wmElectricityInput int,
    wmLoad varchar(9),
    FOREIGN KEY(wmID) REFERENCES LG_PRODUCT(lgID)
);

CREATE TABLE LG_REFRIGERATOR(
    rID int NOT NULL,
    rName varchar(50) NOT NULL,
    rModel int,
    rWeight int,
    rMinTemp int,
    rMaxTemp int,
    rWarranty Date,
    rLoadVolume int,
    rPrice int,
    rElectricityInput int,
    rFreezer varchar(9),
    FOREIGN KEY(rID) REFERENCES LG_PRODUCT(lgID)
);

CREATE TABLE LG_TV(
    tvID int NOT NULL,
    tvName varchar(50) NOT NULL,
    tvModel int,
    tvWeight int,
    tvWarranty Date,
    tvPrice int,
    tvElectricityInput int,
    tvScreen varchar(3),
    tvType varchar(9),
    FOREIGN KEY(tvID) REFERENCES LG_PRODUCT(lgID)
);

/* inserting values*/

insert into sale values (113456,80000);
insert into sale values (113457,80000);
insert into sale values (113458,80000);
insert into sale values (113459,80000);



insert into employee values (700,'Kayling','9051','1991-11-18','2005-12-10',6000,5042,'kayling@gmail.com','hdfc',113456);
insert into employee values (600,'Josh','9945','1987-04-20','2001-02-12',8000,5043,'josh@gmail.com','hdfc',113457);
insert into employee values (900,'Alex','7042','1988-02-12','2007-12-10',5000,5044,'alex@gmail.com','hdfc',113458);
insert into employee values (300,'Sebastian','9872','1990-12-10','2006-11-05',5000,5045,'seb@gmail.com','hdfc',113459);



insert into customer values (134252,'Tim','1980-05-11',997563,'tim@gmail.com','M','2019-04-12',700);
insert into customer values (147318,'Alice','2000-05-11',997563,'alice@gmail.com','F','2019-01-10',600);
insert into customer values (178492,'Ella','2001-05-11',99756,'ella@gmail.com','F','2018-07-09',900);
insert into customer values (119574,'Anna','1995-05-11',99756,'anna@gmail.com','F','2017-07-12',300);


insert into payments values (0,'cash',113456);
insert into payments values  (100,'card',113457);
insert into payments values (200,'cash',113458);
insert into payments values  (300,'card',113459);


insert into lg_product values (453,'Fridge',134252);
insert into lg_product values (454,'AC',147318);
insert into lg_product values (455,'Washing Machine',178492);
insert into lg_product values (456,'TV',119574);
insert into lg_product values (457,'Fridge',119574);
insert into lg_product values (458,'AC',134252);
insert into lg_product values (459,'Washing Machine',147318);
insert into lg_product values (460,'TV',178492);
insert into lg_product values (461,'Fridge',178492);
insert into lg_product values (462,'AC',119574);
insert into lg_product values (463,'Washing Machine',134252);
insert into lg_product values (464,'TV',147318);
insert into lg_product values (465,'Fridge',147318);
insert into lg_product values (466,'AC',178492);
insert into lg_product values (467,'Washing Machine',119574);
insert into lg_product values (468,'TV',134252); 


insert into lg_refrigerator values (453,'LG_6_Star',58433,90,0,30,'2025-02-03',80,300000,50,'NoFreezer');
insert into lg_refrigerator values (457,'LG_5_Star',58433,100,0,30,'2025-02-03',80,450000,40,'top');
insert into lg_refrigerator values (461,'LG_Star',58433,150,0,30,'2025-02-03',80,45000,60,'bottom');
insert into lg_refrigerator values (465,'LG_3_Star',58433,45,0,30,'2025-02-03',80,12020,50,'top');

insert into lg_AC values (454,'LG_5_Star',58434,90,16,30,'2022-11-28',200000,80);
insert into lg_AC values (458,'LG_Star',58564,90,0,18,'2026-12-03',20000,60);
insert into lg_AC values (462,'LG_6_Star',51234,90,16,30,'2025-02-03',350000,80);
insert into lg_AC values (466,'LG_abc',45634,90,18,30,'2025-02-07',3000,70);

insert into LG_WASHING_MACHINE values (455,'LG_abc',51743,90,'2025-02-03',30,2000,'TRIAC',70,'topload');
insert into LG_WASHING_MACHINE values (459,'LG_acd',58912,120,'2023-10-13',30,15000,'TRIAC',80,'frontload');
insert into LG_WASHING_MACHINE values (463,'LG_bac',13869,75,'2022-05-23',30,200000,'TRIAC',70,'topload');
insert into LG_WASHING_MACHINE values (467,'LG_bbc',54310,89,'2025-12-03',30,150000,'TRIAC',60,'frontload');

insert into LG_TV values (456,'LG_las',56822,20,'2025-02-03',20000,70,'LED','AndoidTV');
insert into LG_TV values (460,'LG_bas',25998,78,'2026-01-31',2000,60,'LCD','NormalTV');
insert into LG_TV values (464,'LG_T',34563,35,'2022-02-21',340000,90,'4K','AndroidTV');
insert into LG_TV values (468,'LG_base',17883,45,'2025-02-03',700000,100,'8K','AndroidTV');

/*simple queries*/

select count(*) from lg_product;
explain analyze select count(*) from lg_product;
select lgname, count(lgname) from lg_product group by lgname;
explain analyze select lgname, count(lgname) from lg_product group by lgname;
select ename, cname from employee, customer where employee.eid=customer.empid;
explain analyze select ename, cname from employee, customer where employee.eid=customer.empid;
select avg(esalary) from employee;
explain analyze select avg(esalary) from employee;
select cname,count(*) from customer, lg_product as l where customer.cid=l.custid group by cname;
explain analyze select cname,count(*) from customer, lg_product as l where customer.cid=l.custid group by cname;

/*complex queries*/

(select distinct ename as females from employee where ename like 'Kayling')
union
(select distinct cname from customer where cgender like 'F');
explain analyze (select distinct ename as females from employee where ename like 'Kayling')
union
(select distinct cname from customer where cgender like 'F');

(select lgid, cname from lg_product,customer) except (select lgid,cname from lg_product,customer where customer.cname like 'Tim');
explain analyze (select lgid, cname from lg_product,customer) except (select lgid,cname from lg_product,customer where customer.cname like 'Tim');

select employee.ename, customer.cemail from employee
inner join customer on employee.eid=customer.empid where esalary>5500 order by ename asc;
explain analyze select employee.ename, customer.cemail from employee
inner join customer on employee.eid=customer.empid where esalary>5500 order by ename asc;

select cname from customer where
(select count(*) from lg_product where cid=custid)>=3;
explain analyze select cname from customer where
(select count(*) from lg_product where cid=custid)>=3;

select ename, cname from employee, customer where
not exists (select * from customer where eID=cID);
explain analyze select ename, cname from employee, customer where
not exists (select * from customer where eID=cID);

/*Multiple users with different access privileges*/

drop user if exists akif;
drop user if exists ajith;
drop user if exists achyut;
create user akif;
grant all privileges on sale, employee, customer, lg_product to akif;

create user ajith;
grant delete, update on employee, customer to ajith;

create user achyut;
grant select, update on sale, payments, lg_product to achyut;

/*Triggers*/

drop trigger if exists archive_employee on employee;
drop function if exists ar_employee();


create function ar_employee()
    returns trigger as $$
    begin
        insert into archive_employee (eid, ename, ephone, edob, ehiredate, esalary, eaccno, eemail, ebank, ebillingid)
        values (old.eid, old.ename, old.ephone, old.edob, old.ehiredate, old.esalary, old.eaccno, old.eemail, old.ebank, old.ebillingid);
        return old;
    end;
    $$ LANGUAGE 'plpgsql';

create trigger archive_employee
    before delete on employee
    for each row
    execute procedure ar_employee();


create function ar_product()
    returns trigger as $$
    begin
        insert into archive_lg_product (lgid, lgname, custid)
        values (old.lgid, old.lgname, old.custid);
        return old;
    end;
    $$ LANGUAGE 'plpgsql';

create trigger archive_product
    before delete on lg_product
    for each row
    execute procedure ar_product();


create function log_product_insert()
    returns trigger as $$
    begin
        insert into lg_product_log (lgid, lgname, custid, logger, action)
        values (new.lgid, new.lgname, new.custid, current_date, 'insert');
        return new;
    end;
    $$ language 'plpgsql';

create trigger logging_prod_ins
    after insert on lg_product
    for each row
    execute procedure log_product_insert();


create function log_product_del()
    returns trigger as $$
    begin
        insert into lg_product_log (lgid, lgname, custid, logger, action)
        values (old.lgid, old.lgname, old.custid, current_date, 'delete');
        return old;
    end;
    $$ language 'plpgsql';

create trigger logging_prod_del
    after delete on lg_product
    for each row
    execute procedure log_product_del();


select * from archive_employee;
select * from archive_lg_product;
select * from lg_product_log;
delete from lg_AC where acid=454;
delete from LG_WASHING_MACHINE where wmid=459;
delete from lg_tv where tvid=464;
delete from lg_refrigerator where rid=465;
delete from lg_product where custid=147318;
delete from customer where cid=147318;
delete from employee where ebillingid=113457;
delete from payments where pbillingid=113457;
delete from sale where sbillingid=113457;
select * from archive_employee;
select * from archive_lg_product;
insert into sale values (113465,80000);
insert into employee values (456,'Eren','6345','1991-11-18','2002-12-10',45000,5056,'eren@gmail.com','axis',113465);
insert into customer values (134982,'Levi','1987-12-11',672121,'levi@gmail.com','M','2021-04-21',456);
insert into payments values (0,'card',113465);
insert into lg_product values (678,'Fridge',134982);
insert into lg_product values (690,'TV',134982);
insert into lg_refrigerator values (678,'LG_6_Star',58981,137,0,30,'2029-12-03',120,700000,100,'Bottom');
insert into LG_TV values (690,'LG_lka',78254,35,'2025-02-03',300000,95,'8K','AndoidTV');
select * from lg_product_log;

/*Cursors*/

create or replace function get_product(pid int)
returns table(
    products varchar(255)
)
language plpgsql
as
$$
declare
    cur CURSOR for select lgname from lg_product where lgid=pid;
begin
    open cur;
    return query fetch from cur;
end;
$$;

select * from get_product(463);
select * from get_product(466);
select * from get_product(467);
select * from get_product(453);


create or replace function get_cust_name(pid int)
returns table(
    customer_names varchar(255)
)
language plpgsql
as
$$
declare
    curs CURSOR for select cname from customer where cid=pid;
begin
    open curs;
    return query fetch from curs;
end;
$$;

select * from get_cust_name(119574);
select * from get_cust_name(134252);
select * from get_cust_name(178492);

/*Something*/

alter table employee drop column ebank cascade;
drop table archive_employee cascade;
alter table customer add column caddress varchar(50);
alter table customer alter column cgender set default 'M';
drop table customer cascade;