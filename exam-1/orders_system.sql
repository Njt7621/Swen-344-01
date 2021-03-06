DROP TABLE IF EXISTS ORDERS;
DROP TABLE IF EXISTS CUSTOMERS;
DROP TABLE IF EXISTS AGENTS;

CREATE TABLE  AGENTS 
   (	
    AGENT_CODE CHAR(6) NOT NULL PRIMARY KEY, 
	AGENT_NAME VARCHAR(40), 
	WORKING_AREA CHAR(35), 
	COMMISSION DECIMAL(10,2),  --Percentage: Applied to sales amount
	PHONE_NO CHAR(15),  -- Obfuscated for security
	COUNTRY VARCHAR(25) 
	 );

INSERT INTO AGENTS VALUES ('A007', 'Ramasundar', 'Bangalore', '0.15', '077-25814763', '');
INSERT INTO AGENTS VALUES ('A003', 'Alex ', 'London', '0.13', '075-12458969', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', '0.12', '044-25874365', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', '0.12', '044-52981425', '');
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisbane', '0.13', '045-21447739', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', '0.15', '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Toronto', '0.15', '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshire', '0.11', '008-22536178', '');


CREATE TABLE  CUSTOMERS 
   (	
    CUST_CODE VARCHAR(6) NOT NULL PRIMARY KEY, 
	CUST_NAME VARCHAR(40) NOT NULL, 
	CUST_CITY VARCHAR(35), 
	CUST_COUNTRY VARCHAR(20) NOT NULL, 
	PHONE_NO VARCHAR(17) NOT NULL, 
	AGENT_CODE CHAR(6) NOT NULL REFERENCES AGENTS
);   

INSERT INTO CUSTOMERS VALUES ('C00013', 'Holmes', 'London', 'UK', 'BBBBBBB', 'A003');
INSERT INTO CUSTOMERS VALUES ('C00001', 'Micheal', 'New York', 'USA',  'CCCCCCC', 'A008');
INSERT INTO CUSTOMERS VALUES ('C00020', 'Albert', 'New York', 'USA',  'BBBBSBB', 'A008');
INSERT INTO CUSTOMERS VALUES ('C00024', 'Cook', 'London', 'UK', 'FSDDSDF', 'A006');
INSERT INTO CUSTOMERS VALUES ('C00015', 'Stuart', 'London',  'UK', 'GFSGERS', 'A003');
INSERT INTO CUSTOMERS VALUES ('C00002', 'Bolt', 'New York',  'USA', 'DDNRDRH', 'A008');
INSERT INTO CUSTOMERS VALUES ('C00018', 'Fleming', 'Brisbane',  'Australia','NHBGVFC', 'A005');
INSERT INTO CUSTOMERS VALUES ('C00021', 'Jacks', 'Brisbane',  'Australia','WERTGDF', 'A005');
INSERT INTO CUSTOMERS VALUES ('C00004', 'Winston', 'Adelaide',  'Australia', 'AAAAAAA', 'A005');
INSERT INTO CUSTOMERS VALUES ('C00023', 'Karl', 'London', 'UK', 'AAAABAA', 'A006');
INSERT INTO CUSTOMERS VALUES ('C00006', 'Shilton', 'Toronto',  'Canada', 'DDDDDDD', 'A004');
INSERT INTO CUSTOMERS VALUES ('C00010', 'Charles', 'Hampshire', 'UK','MMMMMMM', 'A009');
INSERT INTO CUSTOMERS VALUES ('C00017', 'Srinivas', 'Bangalore', 'India', 'AAAAAAB', 'A007');
INSERT INTO CUSTOMERS VALUES ('C00012', 'Steven', 'San Jose',  'USA', 'KRFYGJK', 'A012');
INSERT INTO CUSTOMERS VALUES ('C00008', 'Karolina', 'Toronto', 'Canada', 'HJKORED', 'A004');
INSERT INTO CUSTOMERS VALUES ('C00003', 'Martin', 'Toronto',  'Canada', 'MJYURFD', 'A004');
INSERT INTO CUSTOMERS VALUES ('C00009', 'Ramesh', 'Mumbai',  'India', 'Phone No', 'A007');
INSERT INTO CUSTOMERS VALUES ('C00011', 'Albert', 'Cricklewood',  'UK', 'Phone No', 'A007');


CREATE TABLE  ORDERS 
   (
    ORD_NUM DECIMAL(6,0) NOT NULL PRIMARY KEY, 
	ORD_AMOUNT DECIMAL(12,2) NOT NULL, --Amount paid
	ADVANCE_AMOUNT DECIMAL(12,2) NOT NULL, --Pre-payment, if any
	ORD_DATE DATE NOT NULL, 
	CUST_CODE VARCHAR(6) NOT NULL REFERENCES CUSTOMERS, 
	AGENT_CODE CHAR(6) NOT NULL REFERENCES AGENTS, 
	ORD_DESCRIPTION VARCHAR(60) NOT NULL
   );

INSERT INTO ORDERS VALUES('200100', '1000.00', '600.00', '08/01/2008', 'C00013', 'A003', 'SOD');
INSERT INTO ORDERS VALUES('200110', '3000.00', '500.00', '04/15/2008', 'C00024', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200107', '4500.00', '900.00', '08/30/2008', 'C00002', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200112', '2000.00', '400.00', '05/30/2008', 'C00010', 'A007', 'SOD'); 
INSERT INTO ORDERS VALUES('200113', '4000.00', '600.00', '06/10/2008', 'C00021', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200102', '2000.00', '300.00', '05/25/2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200114', '3500.00', '2000.00', '08/15/2008', 'C00002', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200122', '2500.00', '400.00', '09/16/2008', 'C00003', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200118', '520.00', '110.00', '07/20/2008', 'C00023', 'A006', 'SOD');
INSERT INTO ORDERS VALUES('200119', '4000.00', '700.00', '09/16/2008', 'C00011', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200121', '1500.00', '600.00', '09/23/2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200130', '2500.00', '400.00', '07/30/2008', 'C00024', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200134', '4200.00', '1800.00', '09/25/2008', 'C00004', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200108', '4000.00', '600.00', '02/15/2008', 'C00008', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200103', '1500.00', '700.00', '05/15/2008', 'C00021', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200105', '2500.00', '500.00', '07/18/2008', 'C00024', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200109', '3500.00', '800.00', '07/30/2008', 'C00017', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200101', '3000.00', '1000.00', '07/15/2008', 'C00001', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200111', '1000.00', '300.00', '07/10/2008', 'C00020', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200104', '1500.00', '500.00', '03/13/2008', 'C00006', 'A004', 'SOD');
INSERT INTO ORDERS VALUES('200106', '2500.00', '700.00', '04/20/2008', 'C00003', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200125', '2000.00', '600.00', '10/10/2008', 'C00018', 'A005', 'SOD');
INSERT INTO ORDERS VALUES('200117', '800.00', '200.00', '10/20/2008', 'C00004', 'A008', 'SOD');
INSERT INTO ORDERS VALUES('200123', '500.00', '100.00', '09/16/2008', 'C00021', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200120', '500.00', '100.00', '07/20/2008', 'C00009', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200116', '500.00', '100.00', '07/13/2008', 'C00010', 'A009', 'SOD');
INSERT INTO ORDERS VALUES('200124', '500.00', '100.00', '06/20/2008', 'C00017', 'A007', 'SOD'); 
INSERT INTO ORDERS VALUES('200126', '500.00', '100.00', '06/24/2008', 'C00021', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200129', '2500.00', '500.00', '07/20/2008', 'C00024', 'A006', 'SOD');
INSERT INTO ORDERS VALUES('200127', '2500.00', '400.00', '07/20/2008', 'C00015', 'A003', 'SOD');
INSERT INTO ORDERS VALUES('200128', '3500.00', '1500.00', '07/20/2008', 'C00009', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200135', '2000.00', '800.00', '09/16/2008', 'C00002', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200131', '900.00', '150.00', '08/26/2008', 'C00012', 'A012', 'SOD');
INSERT INTO ORDERS VALUES('200133', '1200.00', '400.00', '06/29/2008', 'C00009', 'A012', 'SOD');

