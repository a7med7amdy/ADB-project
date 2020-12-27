CREATE TABLE `bank` (
  `Bank_code` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Name` varchar(100) NOT NULL,
    PRIMARY KEY (`Bank_code`)
);
 
-- --------------------------------------------------------
 
--
-- Table structure for table `branch`
--
 
CREATE TABLE `branch` (
  `Branch_id` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Bank_code` int(11) NOT NULL,
   PRIMARY KEY (`Branch_id`),
  FOREIGN KEY (`Bank_code`) REFERENCES bank (Bank_code)
 
);
 
 
--
-- Database: `bank_database`
--
 
-- --------------------------------------------------------
 
--
-- Table structure for table `customer`
--
 
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone Number` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
);
 
CREATE TABLE Account(
   Account_No   INT NOT NULL  UNIQUE,
   Acc_Type     BINARY  NOT NULL,
   Balance      DECIMAL NOT NULL,
   Bno          INT NOT NULL UNIQUE,       
   PRIMARY KEY (Account_No),
   FOREIGN KEY (Bno) REFERENCES branch(Branch_id)
);
 
CREATE TABLE Loan(
   Loan_id   INT              NOT NULL  UNIQUE,
   Loan_type   INT              NOT NULL  ,
   Amount  DECIMAL              NOT NULL,
   Bno  INT NOT NULL UNIQUE,
   PRIMARY KEY (Loan_id),
   FOREIGN KEY (Bno) REFERENCES branch(Branch_id)
);
 
CREATE TABLE Availed_by(
   Loan_no   INT    NOT NULL  UNIQUE,
   Cust_no   INT    NOT NULL  UNIQUE,
   PRIMARY KEY (Loan_no,Cust_no),
   FOREIGN KEY (Cust_no) REFERENCES customer(Customer_ID),
   FOREIGN KEY (Loan_no) REFERENCES Loan(Loan_id)
);
 
CREATE TABLE Hold_by(
   Acc_No   INT    NOT NULL  UNIQUE,
   Cust_no   INT    NOT NULL  UNIQUE,
   PRIMARY KEY (Acc_No,Cust_no),
   FOREIGN KEY (Cust_no) REFERENCES customer(Customer_ID),
   FOREIGN KEY (Acc_No) REFERENCES Account(Account_No)
);
