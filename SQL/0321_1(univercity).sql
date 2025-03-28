DROP TABLE  student ;

CREATE TABLE  student  (
	 std_num 	varchar2(30)		NOT NULL,
	 hakwa_num 	varchar2(20)		NOT NULL,
	 name 	varchar2(20)		NULL,
	 class_num 	int		NULL,
	 tell 	varchar(13)		NOT NULL
);

DROP TABLE  hakwa ;

CREATE TABLE  hakwa  (
	 hakwa_num 	varchar2(20)		NOT NULL,
	 hakwa_name 	varchar2(20)		NULL,
	 tel 	varchar2(20)		NOT NULL,
	 room 	varchar2(20)		NOT NULL
);

DROP TABLE  subject ;

CREATE TABLE  subject  (
	 sub_num 	varchar2(30)		NOT NULL,
	 pro_num 	varchar2(20)		NOT NULL,
	 hak_value 	int		NULL
);

DROP TABLE  myClass ;

CREATE TABLE  myClass  (
	 std_num 	varchar(30)		NOT NULL,
	 sub_num 	varchar2(30)		NOT NULL,
	 sum 	int		NULL
);

DROP TABLE  professor ;

CREATE TABLE  professor  (
	 pro_num 	varchar2(20)		NOT NULL,
	 hakwa_num 	varchar2(20)		NOT NULL,
	 Field 	int		NULL,
	 name 	varchar2(20)		NULL
);

ALTER TABLE  student  ADD CONSTRAINT  PK_STUDENT  PRIMARY KEY (
	 std_num 
);

ALTER TABLE  hakwa  ADD CONSTRAINT  PK_HAKWA  PRIMARY KEY (
	 hakwa_num 
);

ALTER TABLE  subject  ADD CONSTRAINT  PK_SUBJECT  PRIMARY KEY (
	 sub_num 
);

ALTER TABLE  professor  ADD CONSTRAINT  PK_PROFESSOR  PRIMARY KEY (
	 pro_num 
);

ALTER TABLE  student  ADD CONSTRAINT  FK_hakwa_TO_student_1  FOREIGN KEY (
	 hakwa_num 
)
REFERENCES  hakwa  (
	 hakwa_num 
);

ALTER TABLE  subject  ADD CONSTRAINT  FK_professor_TO_subject_1  FOREIGN KEY (
	 pro_num 
)
REFERENCES  professor  (
	 pro_num 
);

ALTER TABLE  myClass  ADD CONSTRAINT  FK_student_TO_myClass_1  FOREIGN KEY (
	 std_num 
)
REFERENCES  student  (
	 std_num 
);

ALTER TABLE  myClass  ADD CONSTRAINT  FK_subject_TO_myClass_1  FOREIGN KEY (
	 sub_num 
)
REFERENCES  subject  (
	 sub_num 
);

ALTER TABLE  professor  ADD CONSTRAINT  FK_hakwa_TO_professor_1  FOREIGN KEY (
	 hakwa_num 
)
REFERENCES  hakwa  (
	 hakwa_num 
);

commit;
