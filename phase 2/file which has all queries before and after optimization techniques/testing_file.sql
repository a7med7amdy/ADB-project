use Testing_project2;
show profiles;

set profiling=1;

-- query 1

select SQL_NO_CACHE * from bank b CROSS JOIN branch h CROSS join Account a where b.Bank_code=h.Bank_code and a.Bno=h.Branch_id;

select  SQL_NO_CACHE * from Account a INNER JOIN branch h on a.Bno=h.Branch_id INNER JOIN bank b on b.Bank_code=h.Bank_code;

-- query 2
select SQL_NO_CACHE c.Name, l.Bno,l.Amount from customer c CROSS join Availed_by a  CROSS JOIN Loan l where a.Cust_no=c.Customer_ID and a.Loan_no=l.Loan_id;

SELECT SQL_NO_CACHE c.Name,l.Bno,l.Amount from ((SELECT loan_id,Bno,Amount from Loan) l INNER join (SELECT cust_no,loan_no from Availed_by) a on l.loan_id=a.loan_no INNER JOIN (SELECT Customer_ID, Name from customer) c on c.Customer_ID=a.cust_no);

--query 3
select SQL_NO_CACHE a.Account_No, a.Balance,c.Name,c.Phone_Number, h.Acc_No,h.Cust_no from Account a CROSS JOIN Hold_by h CROSS JOIN customer c where h.Cust_no=c.Customer_ID and a.Account_No=h.Acc_No;

SELECT SQL_NO_CACHE a.Account_No,a.Balance,c.Name,c.Phone_Number,h.Acc_no,h.cust_no from ((select Customer_ID, Name,Phone_Number from customer) c INNER JOIN (SELECT Acc_no, cust_no from Hold_by) h on c.Customer_ID=h.cust_no) INNER JOIN (select Account_No,Balance from Account) a on a.Account_No=h.Acc_no;

-- call procedures
CALL query_21();

CALL query_22();

CALL query_23();


-- using caches
select * from bank b CROSS JOIN branch h CROSS join Account a where b.Bank_code=h.Bank_code and a.Bno=h.Branch_id;
select * from bank b CROSS JOIN branch h CROSS join Account a where b.Bank_code=h.Bank_code and a.Bno=h.Branch_id;

select c.Name, l.Bno,l.Amount from customer c CROSS join Availed_by a  CROSS JOIN Loan l where a.Cust_no=c.Customer_ID and a.Loan_no=l.Loan_id;
select c.Name, l.Bno,l.Amount from customer c CROSS join Availed_by a  CROSS JOIN Loan l where a.Cust_no=c.Customer_ID and a.Loan_no=l.Loan_id;

select a.Account_No, a.Balance,c.Name,c.Phone_Number, h.Acc_No,h.Cust_no from Account a CROSS JOIN Hold_by h CROSS JOIN customer c where h.Cust_no=c.Customer_ID and a.Account_No=h.Acc_No;
select a.Account_No, a.Balance,c.Name,c.Phone_Number, h.Acc_No,h.Cust_no from Account a CROSS JOIN Hold_by h CROSS JOIN customer c where h.Cust_no=c.Customer_ID and a.Account_No=h.Acc_No;

-- queries for index tuning
select * from loan where Amount Between 5 and 10000 And Loan_type = 1;
select * from bank , branch where (branch.Name = "branch_11" or branch.Address = "cairo,street 1000") and bank.Bank_code = branch.Bank_code;

show profiles;
