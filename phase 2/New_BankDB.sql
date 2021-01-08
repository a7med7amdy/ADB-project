SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `bank_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `bank_database`;

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Account_No` int(11) NOT NULL,
  `Acc_Type` binary(1) NOT NULL,
  `Balance` decimal(10,0) NOT NULL,
  `Bno` int(11) NOT NULL,
  PRIMARY KEY (`Account_No`),
  KEY `Bno` (`Bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `availed_by`;
CREATE TABLE IF NOT EXISTS `availed_by` (
  `Loan_no` int(11) NOT NULL,
  `Cust_no` int(11) NOT NULL,
  PRIMARY KEY (`Loan_no`,`Cust_no`),
  KEY `Cust_no` (`Cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `bank`;
CREATE TABLE IF NOT EXISTS `bank` (
  `Bank_code` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `branch`;
CREATE TABLE IF NOT EXISTS `branch` (
  `Branch_id` int(11) NOT NULL,
  `Name` varchar(25) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `Bank_code` int(11) NOT NULL,
  PRIMARY KEY (`Branch_id`),
  KEY `Bank_code` (`Bank_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone_Number` int(11) NOT NULL,
  `Address` varchar(100) NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `hold_by`;
CREATE TABLE IF NOT EXISTS `hold_by` (
  `Acc_No` int(11) NOT NULL,
  `Cust_no` int(11) NOT NULL,
  PRIMARY KEY (`Acc_No`,`Cust_no`),
  KEY `Cust_no` (`Cust_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

DROP TABLE IF EXISTS `loan`;
CREATE TABLE IF NOT EXISTS `loan` (
  `Loan_id` int(11) NOT NULL,
  `Loan_type` binary(1) NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `Bno` int(11) NOT NULL,
  PRIMARY KEY (`Loan_id`),
  KEY `Bno` (`Bno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `branch` (`Branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `availed_by`
  ADD CONSTRAINT `availed_by_ibfk_1` FOREIGN KEY (`Cust_no`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `availed_by_ibfk_2` FOREIGN KEY (`Loan_no`) REFERENCES `loan` (`Loan_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `branch`
  ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`Bank_code`) REFERENCES `bank` (`Bank_code`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `hold_by`
  ADD CONSTRAINT `hold_by_ibfk_1` FOREIGN KEY (`Acc_No`) REFERENCES `account` (`Account_No`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hold_by_ibfk_2` FOREIGN KEY (`Cust_no`) REFERENCES `customer` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`Bno`) REFERENCES `branch` (`Branch_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
