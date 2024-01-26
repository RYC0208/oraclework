----------------------------------------------------------------
---------------------- MEMBER TABLE --------------------------
----------------------------------------------------------------
CREATE TABLE MEMBER (
    USER_ID VARCHAR2(30) PRIMARY KEY,
    USER_PWD VARCHAR2(100) NOT NULL,
    USER_NAME VARCHAR2(15) NOT NULL,
    EMAIL VARCHAR2(100),
    BIRTHDAY CHAR(6),
    GENDER CHAR(1) CHECK (GENDER IN('M', 'F')),
    PHONE CHAR(13),
    ADDRESS VARCHAR2(100),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

INSERT INTO MEMBER
VALUES ('admin', '1234', '������', 'admin@aie.or.kr', '800918', 'F', '010-1111-2222','�����  ��õ�� ���������2��', '20231211', DEFAULT, DEFAULT);

INSERT INTO MEMBER
VALUES ('user01', '1234', 'ȫ�浿', 'user01@aie.or.kr', '900213', 'M','010-3333-4444','����� ��õ�� ��','20231128',DEFAULT, DEFAULT);

----------------------------------------------------------------
------------------------ BOARD TABLE ---------------------------
----------------------------------------------------------------
CREATE TABLE BOARD(
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(4000) NOT NULL,
    BOARD_WRITER VARCHAR2(30),
    COUNT NUMBER DEFAULT 0,
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_BNO NOCACHE;

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, 'ù��° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ù �Խ����Դϴ�.','admin', DEFAULT, '20230311', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '�ι�° �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 2 �Խ����Դϴ�.','user01', DEFAULT, '20230315', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '���� ���긮�� �Խ��� ���񽺸� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. 3 �Խ����Դϴ�','user01',DEFAULT, '20230319', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '�ȳ�.. ���̹�Ƽ���� ó������?', '�ȳ��ϼ���. ù �Խ����Դϴ�.', 'user01',DEFAULT, '20230320', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '�ȳ�. ����1', '�ȳ� ����1', 'admin', DEFAULT, '20230323', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '����¡ ó�������� ���õ����� ���� �־���´�...', '�ȳ��Ͻʴϱ�', 'admin',DEFAULT,  '20230324', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL,'����2' ,'����2', 'admin', DEFAULT, '20230325',DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL,'����3' ,'����3' , 'admin', DEFAULT, '20230326', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL,'����4' ,'����4', 'user01', DEFAULT, '20230327', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '����5' ,'����5', 'admin', DEFAULT, '20230328', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL,'����6' ,'����6', 'user01', DEFAULT, '20230329', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '����7' ,'����7', 'admin', DEFAULT, '20230401', DEFAULT);

INSERT INTO BOARD
VALUES(SEQ_BNO.NEXTVAL, '������ �Խ��� �����ϰڽ��ϴ�.', '�ȳ��ϼ���. ������ �Խ����Դϴ�.', 'admin',  DEFAULT, '20230403', DEFAULT);

----------------------------------------------------------------
------------------------ REPLY TABLE ---------------------------
----------------------------------------------------------------
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    REPLY_CONTENT VARCHAR2(400),
    REF_BNO NUMBER,
    REPLY_WRITER VARCHAR2(30),
    CREATE_DATE DATE DEFAULT SYSDATE,
    STATUS CHAR(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    FOREIGN KEY (REF_BNO) REFERENCES BOARD,
    FOREIGN KEY (REPLY_WRITER) REFERENCES MEMBER
);

CREATE SEQUENCE SEQ_RNO NOCACHE;

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL,'ù��° ����Դϴ�', 1, 'user01', '20230325', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, 'ù��° ����Դϴ�', 13, 'user01', '20230412', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '�ι�° ����Դϴ�', 13, 'user01', '20230413', DEFAULT);

INSERT INTO REPLY
VALUES(SEQ_RNO.NEXTVAL, '������ ����Դϴ�', 13, 'user01', '20230414', DEFAULT);