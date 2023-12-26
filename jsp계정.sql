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
INSERT INTO MEMBER VALUES('kim', '1234', 'ȫ�浿', '1', '231205', 'kim@naver.com', '12345', '����Ư���� �������� ��굿 �̷�����', '19��','11001','�л�');
INSERT INTO MEMBER VALUES('lee', '1234', '�̱浿', '2', '231115', 'lee@naver.com', '23456', '��õ������ ������ ������', '17��','10001','����');
INSERT INTO MEMBER VALUES('park', '1234', '�ڱ浿', '1', '231021', 'park@naver.com', '34567', '��⵵ ������ ������', '��������Ʈ','01010','������');

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