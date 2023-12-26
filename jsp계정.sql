CREATE TABLE MEMBER (
 ID VARCHAR2(20) PRIMARY KEY,
 PWD VARCHAR2(20) NOT NULL,
 NAME VARCHAR2(20) NOT NULL,
 GENDER CHAR(1),
 BIRTHDAY CHAR(6),
 EMAIL VARCHAR2(30),
 ZIPCODE CHAR(5),
 ADDRESS VARCHAR2(100),
 DetailAddress VARCHAR2(50),
 HOBBY CHAR(5),
 JOB VARCHAR2(30)
);
INSERT INTO MEMBER VALUES('kim', '1234', '홍길동', '1', '231205', 'kim@naver.com', '12345', '서울특별시 영등포구 당산동 이레빌딩', '19층','11001','학생');
INSERT INTO MEMBER VALUES('lee', '1234', '이길동', '2', '231115', 'lee@naver.com', '23456', '인천광역시 남동구 구월동', '17층','10001','교수');
INSERT INTO MEMBER VALUES('park', '1234', '박길동', '1', '231021', 'park@naver.com', '34567', '경기도 성남시 수정구', '수정아파트','01010','공무원');

commit;

CREATE TABLE votelist (
 num number primary key,
 question varchar2(200),
 sdate date,
 edate date,
 wdate date,
 type number default 1 not null,
 active number default 1
 );
 
 
 CREATE TABLE voteitem (
  listnum NUMBER,
  itemnum NUMBER DEFAULT 0,
  item varchar2(50),
  count NUMBER DEFAULT 0,
  PRIMARY KEY (listnum, itemnum)
); 
 
 CREATE SEQUENCE SEQ_VOTE;