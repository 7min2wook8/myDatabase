--0320_2(bank)
DROP TABLE BankBranch;
DROP TABLE savingAccount;
DROP TABLE Saving;
DROP TABLE Customer;
commit;

CREATE TABLE BankBranch (
	bankName	    varchar2(30)		PRIMARY KEY,
	city	        varchar2(30)		NOT NULL,
	money	        number		        NOT NULL,
	english_city	varchar2(30)		NOT NULL,
	tel	            varchar2(30)		NOT NULL
);


CREATE TABLE savingAccount (
	acno	        varchar2(20)		PRIMARY KEY,	
	bankName	    varchar2(30)		NOT NULL,
    customer_number	varchar2(30)		NOT NULL
);

CREATE TABLE Saving (
	customer_number	    varchar2(30)		NOT NULL,
	Account_number	    varchar2(30)		NOT NULL,
	saving	            number		        NOT NULL,
	pay_in_out	        number		        NOT NULL,
	withdraw	        number		        NOT NULL	
);

CREATE TABLE Customer (
	customer_number	varchar2(30)		PRIMARY KEY,
	name	        varchar2(30)		NOT NULL,
	birthday	    varchar2(30)		NOT NULL,
	address	        varchar2(30)		NOT NULL,
    cuTell          varchar2(30)        NOT NULL
);

ALTER TABLE savingAccount ADD CONSTRAINT FK_BankBranch_TO_savingAccount_1 FOREIGN KEY (
	bankName
)
REFERENCES BankBranch (
	bankName
);

ALTER TABLE Saving ADD CONSTRAINT FK_Customer_TO_Saving_1 FOREIGN KEY (
	customer_number
)
REFERENCES Customer (
	customer_number
);

ALTER TABLE Saving ADD CONSTRAINT FK_savingAccount_TO_Saving_1 FOREIGN KEY (
	Account_number
)
REFERENCES savingAccount (
	acno
);

ALTER TABLE savingAccount ADD CONSTRAINT FK_Customer_TO_savingAccount_1 FOREIGN KEY (
	Account_number
)
REFERENCES Customer (
	customer_number
);

insert into BankBranch values('대구은행', '대구', 20000,'deagu','010-0000-0000');
insert into BankBranch values('서울은행','서울', 20000,'seoul','010-0000-0000');
insert into BankBranch values('부산은행','부산', 20000,'busan','010-0000-0000');



insert into savingAccount values('00000-00-00000','대구은행','Cus9871');
insert into savingAccount values('00000-00-00001','서울은행','Cus9871');
insert into savingAccount values('00000-00-00002','서울은행','Cus9872');
insert into savingAccount values('00000-00-00003','부산은행','Cus9873');

insert into Customer values('Cus9871','유재석','85/03/01','서울어딘가');
insert into Customer values('Cus9872','김종국','88/04/01','서울어딘가');
insert into Customer values('Cus9873','이광수','90/02/20','서울어딘가');

insert into Saving values('Cus9871','00000-00-00001', 5000, 0, 1000);
insert into Saving values('Cus9871','00000-00-00002', 3000, 1000, 0);
insert into Saving values('Cus9871','00000-00-00001', 4000, 2000, 0);
insert into Saving values('Cus9871','00000-00-00001', 6000, 0, 2000);
insert into Saving values('Cus9872','00000-00-00001', 6000, 0, 2000);
insert into Saving values('Cus9873','00000-00-00001', 6000, 0, 2000);


commit;

select * from savingAccount s, BankBranch b where s.bankname = b.bankname;












