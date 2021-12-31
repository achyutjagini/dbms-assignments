\c lg

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
/*insert into customer values (175948,'Bob','1993-05-11',99756,'bob@gmail.com','M','2019-11-13',68319);*/


insert into payments values (0,'cash',113456);
insert into payments values  (100,'cash',113457);
insert into payments values (200,'cash',113458);
insert into payments values  (300,'cash',113459);


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
insert into lg_product values (464'TV',147318);
insert into lg_product values (465,'Fridge',147318);
insert into lg_product values (466,'AC',178492);
insert into lg_product values (467,'Washing Machine',119574);
insert into lg_product values (468,'TV',134252); 


insert into lg_refrigerator values (453,'LG_6_Star',58433,90,0,30,'2025-02-03',80,20000,50,'NoFreezer');
insert into lg_refrigerator values (457,'LG_5_Star',58433,90,0,30,'2025-02-03',80,20000,40,'top');
insert into lg_refrigerator values (461,'LG_Star',58433,90,0,30,'2025-02-03',80,20000,60,'bottom');
insert into lg_refrigerator values (465,'LG_3_Star',58433,90,0,30,'2025-02-03',80,20000,50,'top');

insert into lg_AC values (454,'LG_5_Star',58434,90,0,30,'2025-02-03',20000,80);
insert into lg_AC values (458,'LG_Star',58434,90,0,30,'2025-02-03',20000,60);
insert into lg_AC values (462,'LG_6_Star',58434,90,0,30,'2025-02-03',20000,80);
insert into lg_AC values (466,'LG_abc',58434,90,0,30,'2025-02-03',20000,70);

insert into LG_WASHING_MACHINE values (455,'LG_abc',58434,90,'2025-02-03',30,20000,'TRIAC',70,'topload');
insert into LG_WASHING_MACHINE values (459,'LG_acd',58434,90,'2025-02-03',30,20000,'TRIAC',80,'frontload');
insert into LG_WASHING_MACHINE values (463,'LG_bac',58434,90,'2025-02-03',30,20000,'TRIAC',70,'topload');
insert into LG_WASHING_MACHINE values (467,'LG_bbc',58434,90,'2025-02-03',30,20000,'TRIAC',60,'frontload');

insert into LG_TV values (456,'LG_las',58434,90,'2025-02-03',20000,60,'HD','large');
insert into LG_TV values (460,'LG_bas',58434,90,'2025-02-03',20000,60,'HD','medium');
insert into LG_TV values (464,'LG_T',58434,90,'2025-02-03',20000,60,'HD','small');
insert into LG_TV values (468,'LG_base',58434,90,'2025-02-03',20000,60,'HD','large');

