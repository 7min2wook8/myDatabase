--0311_1.sql

/*
데이터 타입
varchar     가변길이 문자 알파벳
varchar2    가변길이 문자 알파벳
nvarchar2   가변길이 문자 다국어
char        고정길이 문자
number      가변길이 숫자
int         고정길이 숫자
date        날짜
clob        대용량 텍스트
blob        이미지, 동영상, 사운드
*/


drop table student_t;
--제약 조건(constraint) : 테이블에서 사용되는 특정한 조건
create table student_t(
    id     NUMBER,
    name   VARCHAR2(20) NOT NULL,
    age    NUMBER NOT NULL,
    addr   VARCHAR2(40) NOT NULL,
    gender varchar2(4) not null,
    --제약조건명 'pk_std_id'를 사용하여 pk 지정
    CONSTRAINT pk_std_id PRIMARY KEY(id),
    --제약조건명 만들고 조건 지정
    CONSTRAINT age_chk CHECK(age > 17),
    CONSTRAINT gen_chk CHECK(gender in ('남','여'))
     
     
);


--시퀀스 생성, 1씩 증가, 시작은 1000
CREATE SEQUENCE seq_std_id INCREMENT BY 1 START WITH 1000;

INSERT INTO student_t VALUES (
    seq_std_id.NEXTVAL,
    '홍길동',
    10,
    '조선 함양 홍대감댁',
    '남'
);

SELECT
    *
FROM
    student_t;

drop SEQUENCE seq_std_id;

commit;

/*
1. person_t 테이블 생성
2. 아이디 id 시퀀스,5  이름 name 문자 20, 성별 gender 문자 5,
전화 tel 문자 20, 나이 age 숫자 3
3.아이디를 기본키로 지정 제약조건 p_id_pk
4. 성별 칼럼은 '남자','여자' 값만 허용 제약조건 p_gen_chk
5. 모든 속성은 NULL값을 가질 수 없음
6. 나이는 20살 보다 많아야함 p_age_chk
7. 데이터 5개 이상 추가하고 검색하기
8. 100부터 1씩 증가하는 seq_id_p 시퀀스 생성하여 pk로 사용
9. 제약조건에 위배되는 데이터를 사용하여 오류 발생 확인하기

*/

drop TABLE person_t;
create TABLE person_t(
    id      NUMBER(5),
    name    VARCHAR2(20) not null,
    gender  VARCHAR2(10) not null,
    tel     VARCHAR2(20) not null,
    age     NUMBER(3) not null,
    CONSTRAINT p_id_pk PRIMARY KEY(ID),
    CONSTRAINT p_gen_chk CHECK(gender in ('남자', '여자')),
    CONSTRAINT p_age_chk CHECK(age > 20)
);
DROP SEQUENCE seq_id_p;
--시퀀스 생성, 1씩 상승, 10000부터 시작
create SEQUENCE seq_id_p INCREMENT BY 1 START WITH 100;
insert into person_t values(seq_id_p.nextval, '홍길', '남자', '010-1111-1111', 30);
insert into person_t values(seq_id_p.nextval, '춘향', '여자', '010-2222-2222', 21);
insert into person_t values(seq_id_p.nextval, '몽룡', '남자', '010-3333-3333', 22);

select * from person_t;