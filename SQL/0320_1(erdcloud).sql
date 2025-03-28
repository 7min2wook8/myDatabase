--0320_1 https://www.erdcloud.com/ 테스트
DROP TABLE "enter";
DROP TABLE "ai_subjects_2025";
DROP TABLE "ai_student_2025";
DROP TABLE "ai_professor_2025";
DROP SEQUENCE "enter_SE";

create SEQUENCE "enter_SE" INCREMENT by 1 start with 1;


commit;
DROP TABLE "ai_professor_2025";

CREATE TABLE "ai_professor_2025" (
	"ai_pid"	varchar2(10)		NOT NULL,
	"ai_pname"	varchar2(20)		NULL,
	"ai_shakwa"	varchar2(30)		NULL
);

DROP TABLE "enter";

CREATE TABLE "enter" (
	"serialNum"	 number		NOT NULL,
	"ai_sid"	varchar2(10)		NOT NULL,
	"subjects_id"	varchar2(10)		NOT NULL
);

DROP TABLE "ai_subjects_2025";

CREATE TABLE "ai_subjects_2025" (
	"subjects_id"	varchar2(10)		NOT NULL,
	"subjects_name"	varchar2(20)		NULL,
	"subjects_credit"	int		NULL
);


DROP TABLE "ai_student_2025";

CREATE TABLE "ai_student_2025" (
	"ai_sid"	varchar2(10)		NOT NULL,
	"ai_sname"	varchar2(20)		NULL,
	"ai_shakwa"	varchar2(30)		NULL,
	"ai_pid"	varchar2(10)		NOT NULL
);

ALTER TABLE "ai_professor_2025" ADD CONSTRAINT "PK_AI_PROFESSOR_2025" PRIMARY KEY (
	"ai_pid"
);

ALTER TABLE "enter" ADD CONSTRAINT "PK_ENTER" PRIMARY KEY (
	"serialNum"
);

ALTER TABLE "ai_subjects_2025" ADD CONSTRAINT "PK_AI_SUBJECTS_2025" PRIMARY KEY (
	"subjects_id"
);

ALTER TABLE "ai_student_2025" ADD CONSTRAINT "PK_AI_STUDENT_2025" PRIMARY KEY (
	"ai_sid"
);

ALTER TABLE "enter" ADD CONSTRAINT "FK_ai_student_2025_TO_enter_1" FOREIGN KEY (
	"ai_sid"
)
REFERENCES "ai_student_2025" (
	"ai_sid"
);

ALTER TABLE "enter" ADD CONSTRAINT "FK_ai_subjects_2025_TO_enter_1" FOREIGN KEY (
	"subjects_id"
)
REFERENCES "ai_subjects_2025" (
	"subjects_id"
);

ALTER TABLE "ai_student_2025" ADD CONSTRAINT "FK_ai_professor_2025_TO_ai_student_2025_1" FOREIGN KEY (
	"ai_pid"
)
REFERENCES "ai_professor_2025" (
	"ai_pid"
);

commit;

delete from "ai_professor_2025" where "ai_pid" = 'p8761';
insert into "ai_professor_2025" values('p98761','폰노이만','컴퓨터과');
insert into "ai_professor_2025" values('p98762','알베르트','영어영문');
insert into "ai_professor_2025" values('p98763','아인슈타인','전자과'); 



insert into "ai_student_2025" values('s98761','유재석','전자과','p98763');
insert into "ai_student_2025" values('s98762','김종국','영어영문','p98762');
insert into "ai_student_2025" values('s98763','송지효','컴퓨터과','p98761');
insert into "ai_student_2025" values('s98764','이광수','전자과','p98763');
insert into "ai_student_2025" values('s98765','하하','영어영문','p98762');
insert into "ai_student_2025" values('s98766','지석진','컴퓨터과','p98761');
commit;

insert into "ai_subjects_2025" values('sb9871','전자',88);
insert into "ai_subjects_2025" values('sb9872','영어',90);
insert into "ai_subjects_2025" values('sb9873','컴퓨터',40);


insert into "enter" values("enter_SE".nextval,'s98761','sb9871');
insert into "enter" values("enter_SE".nextval,'s98762','sb9872');
insert into "enter" values("enter_SE".nextval,'s98762','sb9872');

select * from "enter";
select * from "ai_student_2025" ai_st, "ai_professor_2025" ai_pr where ai_st."ai_pid"  = ai_pr."ai_pid";