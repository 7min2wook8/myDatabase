drop table ai_student_2025;
drop table ai_professor_2025;
commit;
-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- ai_professor_2025 Table Create SQL
-- 테이블 생성 SQL - ai_professor_2025
CREATE TABLE ai_professor_2025
(
    ai_pid        varchar2(10)    NOT NULL, 
    ai_pname      varchar(20)     NOT NULL, 
    ai_phakkwa    varchar(30)     NOT NULL, 
     PRIMARY KEY (ai_pid)
);

-- 테이블 Comment 설정 SQL - ai_professor_2025
COMMENT ON TABLE ai_professor_2025 IS '교수 테이블';

-- 컬럼 Comment 설정 SQL - ai_professor_2025.ai_pid
COMMENT ON COLUMN ai_professor_2025.ai_pid IS '교수번호';

-- 컬럼 Comment 설정 SQL - ai_professor_2025.ai_pname
COMMENT ON COLUMN ai_professor_2025.ai_pname IS '교수이름';

-- 컬럼 Comment 설정 SQL - ai_professor_2025.ai_phakkwa
COMMENT ON COLUMN ai_professor_2025.ai_phakkwa IS '학과';


-- ai_student_2025 Table Create SQL
-- 테이블 생성 SQL - ai_student_2025
CREATE TABLE ai_student_2025
(
    ai_sid       varchar2(10)    NOT NULL, 
    ai_sname     varchar(20)     NOT NULL, 
    as_shakwa    varchar(30)     NOT NULL, 
    ai_pid       varchar2(10)    NOT NULL, 
     PRIMARY KEY (ai_sid)
);

-- 테이블 Comment 설정 SQL - ai_student_2025
COMMENT ON TABLE ai_student_2025 IS '학생 테이블';

-- 컬럼 Comment 설정 SQL - ai_student_2025.ai_sid
COMMENT ON COLUMN ai_student_2025.ai_sid IS '학생번호';

-- 컬럼 Comment 설정 SQL - ai_student_2025.ai_sname
COMMENT ON COLUMN ai_student_2025.ai_sname IS '이름';

-- 컬럼 Comment 설정 SQL - ai_student_2025.as_shakwa
COMMENT ON COLUMN ai_student_2025.as_shakwa IS '학과';

-- 컬럼 Comment 설정 SQL - ai_student_2025.ai_pid
COMMENT ON COLUMN ai_student_2025.ai_pid IS '교수번호';

-- Foreign Key 설정 SQL - ai_student_2025(ai_pid) -> ai_professor_2025(ai_pid)
ALTER TABLE ai_student_2025
    ADD CONSTRAINT FK_ai_student_2025_ai_pid_ai_professor_2025_ai_pid FOREIGN KEY (ai_pid)
        REFERENCES ai_professor_2025 (ai_pid) ;

-- Foreign Key 삭제 SQL - ai_student_2025(ai_pid)
-- ALTER TABLE ai_student_2025
-- DROP CONSTRAINT FK_ai_student_2025_ai_pid_ai_professor_2025_ai_pid;

insert into ai_professor_2025 values('p98761','폰노이만','컴퓨터과');
insert into ai_professor_2025 values('p98762','알베르트','영어영문');
insert into ai_professor_2025 values('p98763','아인슈타인','전자과');

insert into ai_student_2025 values('s98761','유재석','국어','p98763');
insert into ai_student_2025 values('s98762','김종국','체육','p98762');
insert into ai_student_2025 values('s98763','송지효','수학','p98761');
insert into ai_student_2025 values('s98764','이광수','국어','p98763');
insert into ai_student_2025 values('s98765','하하','체육','p98762');
insert into ai_student_2025 values('s98766','지석진','수학','p98761');

--delete from ai_student_2025 where ai_sid like '0000_';
--delete from ai_professor_2025 where ai_professor_2025.ai_pid like '0000_';
--where ename like '%A%' and e.dno = d.dno;

select * from ai_student_2025 p, ai_professor_2025 s where p.ai_pid = s.ai_pid;
commit;