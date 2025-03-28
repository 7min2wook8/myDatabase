/*
    1. 테이블 person_t 생성
    2. 주민번호(문자, 14) 이름(문자, 10) 나이(숫자,3) 전화(문자 20), 주소(문자, 50) 취미(문자 50)
    3. 주민등록번호는 중복될수 없는 고유한 정보
    4. 모든 컬럼의 값은 NULL값을 허용하지 않음
    5. 임의의 데이터 3개 입력하기
    6. 모든 데이터 검색하기    
*/
drop table person_t;
create table person_t(
    regNumber VARCHAR2(14) PRIMARY key,
    name VARCHAR2(10) not null,
    age NUMBER(3) not null,
    tell VARCHAR2(20) not null,
    addres VARCHAR2(50) not null,
    hobby VARCHAR2(30) not null
);


insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('090909-090909', '홍길동', 300, '010-0000-0000','전라도 장성현 아차곡','의적');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('720814-090909', '유재석', 52, '010-1111-1111','서울특별시 종로구 견지동','국민mc');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('930516-090909', '아이유', 31, '010-2222-2222','서울특별시 성동구 송정동','가수');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('790331-090909', '노홍철', 45, '010-3333-3333','서울특별시 강남구 신사동','연애인');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('710318-090909', '정준하', 53, '010-4444-4444','서울특별시 영등포구 대방동','연애인');
insert into person_t(regNumber, name, age, tell, addres, hobby) VALUES('790820-090909', '하하', 45, '010-5555-5555','서울특별시 마포구 서교동','가수');

select * from person_t;

select * from person_t where name = '홍길동';

select * from person_t where age=300;

select * from person_t where age=300 and name = '홍길동';

select * from person_t where age=300 or name = '홍길동';


delete from person_t where name = '홍길동';

update person_t set name = '하하핳' where name ='하하';

delete from person_t;