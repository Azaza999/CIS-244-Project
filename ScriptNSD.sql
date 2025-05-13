CREATE DATABASE NailSalon;
USE NailSalon;
CREATE TABLE `appointments` (
  `AppointmentID` int NOT NULL AUTO_INCREMENT,
  `CustomerID` int DEFAULT NULL,
  `EmployeeID` int DEFAULT NULL,
  `OtherEmployeeIDs` varchar(255) DEFAULT NULL,
  `ServiceID` int DEFAULT NULL,
  `OtherServiceIDs` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Status` varchar(255) DEFAULT NULL,
  `SpecialRequests` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`AppointmentID`),
  KEY `ServiceID_idx` (`ServiceID`),
  KEY `CustomerID_idx` (`CustomerID`),
  KEY `EmployeeID_idx` (`EmployeeID`),
  CONSTRAINT `customerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  CONSTRAINT `employeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `serviceID` FOREIGN KEY (`ServiceID`) REFERENCES `services` (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `PhoneNum` varchar(15) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  CONSTRAINT `Customer` FOREIGN KEY (`CustomerID`) REFERENCES `members` (`CustomerID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `EmployeeName` varchar(255) DEFAULT NULL,
  `Services` varchar(255) DEFAULT NULL,
  `WeeklyRent` double DEFAULT NULL,
  `Monday` varchar(255) DEFAULT NULL,
  `Tuesday` varchar(255) DEFAULT NULL,
  `Wednesday` varchar(255) DEFAULT NULL,
  `Thursday` varchar(255) DEFAULT NULL,
  `Friday` varchar(255) DEFAULT NULL,
  `Saturday` varchar(255) DEFAULT NULL,
  `Sunday` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `members` (
  `MemberID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `JoinDate` datetime DEFAULT NULL,
  `Level` varchar(255) DEFAULT NULL,
  `YTDSpending` double DEFAULT NULL,
  KEY `idx_customer_id` (`CustomerID`,`MemberID`),
  KEY `MemberID_idx` (`MemberID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `membershiplevels` (
  `MemberID` int NOT NULL AUTO_INCREMENT,
  `Level` varchar(30) DEFAULT NULL,
  `MinAmount` double DEFAULT NULL,
  `Benefits` varchar(255) DEFAULT NULL,
  `DiscountRate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MemberID`),
  CONSTRAINT `MemberID` FOREIGN KEY (`MemberID`) REFERENCES `members` (`MemberID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `products` (
  `ProductID` int NOT NULL AUTO_INCREMENT,
  `SupplierID` int DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Category` varchar(255) DEFAULT NULL,
  `Brand` varchar(255) DEFAULT NULL,
  `StockLevel` int DEFAULT NULL,
  `ReorderLevel` int DEFAULT NULL,
  `UnitPrice` double DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `SupplierID_idx` (`SupplierID`),
  CONSTRAINT `SupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `suppliers` (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `services` (
  `ServiceID` int NOT NULL AUTO_INCREMENT,
  `ServiceName` varchar(255) DEFAULT NULL,
  `Price` double DEFAULT NULL,
  PRIMARY KEY (`ServiceID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `suppliers` (
  `SupplierID` int NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(255) DEFAULT NULL,
  `ContactPerson` varchar(255) DEFAULT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `PaymentTerms` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`SupplierID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `transactions` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AppointmentID` int DEFAULT NULL,
  `CustomerID` int DEFAULT NULL,
  `ServiceDetails` varchar(255) DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `PaymentMethod` varchar(255) DEFAULT NULL,
  `TotalAmount` double DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Time` datetime DEFAULT NULL,
  `Discount` double DEFAULT NULL,
  `TotalPaid` double DEFAULT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `AppointmentID_idx` (`AppointmentID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `AppointmentID` FOREIGN KEY (`AppointmentID`) REFERENCES `appointments` (`AppointmentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
