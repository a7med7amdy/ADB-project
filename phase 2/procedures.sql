------------------- Procedure1 ----------------------------------------------------
DELIMITER //

CREATE PROCEDURE query_1()
BEGIN
	select SQL_NO_CACHE * from bank b CROSS JOIN branch h CROSS join Account a where b.Bank_code=h.Bank_code and a.Bno=h.Branch_id;

END //

DELIMITER ;

-- CALL query_1();

--------------------- end ---------------------------------------------------------

------------------- Procedure2 ----------------------------------------------------
DELIMITER //

CREATE PROCEDURE query_2()
BEGIN
	select SQL_NO_CACHE c.Name, l.Bno,l.Amount from customer c CROSS join Availed_by a  CROSS JOIN Loan l where a.Cust_no=c.Customer_ID and a.Loan_no=l.Loan_id;

END //

DELIMITER ;

-- CALL  query_2()

--------------------- end ---------------------------------------------------------

------------------- Procedure3 ----------------------------------------------------
DELIMITER //

CREATE PROCEDURE query_3()
BEGIN
    select SQL_NO_CACHE a.Account_No, a.Balance,c.Name,'c.Phone Number', h.Acc_No,h.Cust_no from Account a CROSS JOIN Hold_by h CROSS JOIN customer c where h.Cust_no=c.Customer_ID and a.Account_No=h.Acc_No;
END //

DELIMITER ;

-- CALL  query_3()

--------------------- end ---------------------------------------------------------
