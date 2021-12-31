import psycopg2
import time
import os

'''#connecting to the database
con = psycopg2.connect(
            #host = "postgres",
            database = "lg",
            user = "postgres",
            password = "AKIF_123"
)

cur = con.cursor()                                  #cursor

cur.execute("select eid, ename from employee")      #execute query

rows = cur.fetchall()

for r in rows:
    print(f"eid {r[0]} ename {r[1]}")

cur.close()                                         #close the cursor

con.close()                                         #close the connection'''

'''def choice(op):
    switcher = {
        1: queries(op),
        11: 
    }

    return switcher.get(op)
'''

if __name__ == "__main__":
    ch = 0
    
    #connecting to the database
    con = psycopg2.connect(
                #host = "postgres",
                database = "lg",
                user = "postgres",
                password = "AKIF_123"
    )

    cur = con.cursor()                                  #cursor

    while (ch != 11):
        time.sleep(2)
        input()
        clearConsole = lambda: os.system('cls' if os.name in ('nt', 'dos') else 'clear')
        clearConsole()

        ch = int(input('''\n\nSelect a query to execute
                            1. select count(*) from lg_product;
                            2. select lgname, count(lgname) from lg_product group by lgname;
                            3. select ename, cname from employee, customer where employee.eid=customer.empid;
                            4. select avg(esalary) from employee;
                            5. select cname,count(*) from customer, lg_product as l where customer.cid=l.custid group by cname;
                            6. (select distinct ename as females from employee where ename like 'Kayling') union  (select distinct cname from customer where cgender like 'F');
                            7. (select lgid, cname from lg_product,customer) except (select lgid,cname from lg_product,customer where customer.cname like 'Tim');
                            8. select employee.ename, customer.cemail from employee inner join customer on employee.eid=customer.empid where esalary>5500 order by ename asc;
                            9. select cname from customer where (select count(*) from lg_product where cid=custid)>=3;
                            10. select ename, cname from employee, customer where not exists (select * from customer where eID=cID);
                            11. exit\n'''))

        print(f"executing query #{ch}....")
        time.sleep(2)

        if ch==1:
            cur.execute("select count(*) from lg_product")      #execute query
            row = cur.fetchone()
            print(f"Total # of products: {row[0]}")

        elif ch==2:
            cur.execute("select lgname, count(lgname) from lg_product group by lgname")
            rows = cur.fetchall()
            for r in rows:
                print(f"There are {r[1]} of product {r[0]}")

        elif ch==3:
            cur.execute("select ename, cname from employee, customer where employee.eid=customer.empid")
            rows = cur.fetchall()
            for r in rows:
                print(f"Employee {r[0]} helped out {r[1]}")

        elif ch==4:
            cur.execute("select avg(esalary) from employee")
            row = cur.fetchone()
            print(f"Average of employees: {row[0]}")

        elif ch==5:
            cur.execute("select cname,count(*) from customer, lg_product as l where customer.cid=l.custid group by cname")
            rows = cur.fetchall()
            for r in rows:
                print(f"Customer {r[0]} bought {r[1]} products")

        elif ch==6:
            cur.execute("(select distinct ename as females from employee where ename like 'Kayling') union  (select distinct cname from customer where cgender like 'F')")
            rows = cur.fetchall()
            print("The females are:")
            for r in rows:
                print(r[0])
        
        elif ch==7:
            cur.execute("(select lgid, cname from lg_product,customer) except (select lgid,cname from lg_product,customer where customer.cname like 'Tim')")
            rows = cur.fetchall()
            for r in rows:
                print(f"Customer {r[1]} bought product with ID = {r[0]}")

        elif ch==8:
            cur.execute("select employee.ename, customer.cemail from employee inner join customer on employee.eid=customer.empid where esalary>5500 order by ename asc")
            rows = cur.fetchall()
            for r in rows:
                print(f"{r[0]} helped customer with email ID is {r[1]}")

        elif ch==9:
            cur.execute("select cname from customer where (select count(*) from lg_product where cid=custid)>=3")
            rows = cur.fetchall()
            print('Customers who bought more than 3 products are: ')
            for r in rows:
                print(r[0])

        elif ch==10:
            cur.execute("select ename, cname from employee, customer where not exists (select * from customer where eID=cID)")
            rows = cur.fetchall()
            for r in rows:
                print(f"Ename: {r[0]} \t\t\t Customer: {r[1]}")

    cur.close()                                         #close the cursor
    con.close()                                         #close the connection
    print("end of program")