/*
    DDL : ������ ���Ǿ�
    ����Ŭ���� �����ϴ� ��ü�� �����(CREATE), 
    ������ �����ϰ�(ALTER)�ϰ�, ������ ����(DROP) �ϴ� ���
    ��, ���� ������ ���� �ƴ� ���� ��ü�� �����ϴ� ���
    �ַ� DB������, �����ڰ� �����
    
    ����Ŭ������ ��ü : ���̺�(TABLE), ��(VIEW), ������(SEQUENCE), �ε���(INDEX), 
                ��Ű��(PACKAGE), Ʈ��Ŀ(TRIGGER), ���ν���(PROCEDURE), �Լ�(FUNCTION),
                ���Ǿ�(SYNONYM), �����(USER)
                
*/
--==============================================================================
/*
 <CREATE=>
 ��ü�� �����ϴ� ����
*/
-------------------------------------------------------------------------------
/*
    1. ���̺� ����
    -���̺� �̶� : ��(ROW)�� ��(COLUMN)�� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü
                  ��� �����͵��� ���̺��� ���� �����
                 (DBMS��� �� �ϳ���, �����͸� ������ ǥ���·� ǥ���� ��)   
    [ǥ����]
    CREATE TABLE ���̺��(
            �÷��� �ڷ���(ũ��),
            �÷��� �ڷ���(ũ��),
            �÷��� �ڷ���,
            ...
            
    );

*�ڷ���
- ���� (CHAR(����Ʈ ũ��) | VARCHAR2(����Ʈ ũ��))
>CHAR : �ִ� 2000BYTE���� ���� ����
        ���� ����(������ ũ�⺸�� �� �������� ���͵� �������ζ� ä���� ó�� ������ ũ�⸸ŭ ����)
        ������ �����͸� ���� �� ��� 
>VARCHAR2:�ִ� 4000BYTES���� ���� ����
          ���� ����(��� ���� ���� ������ ũ�Ⱑ ������)
          �� ���ڰ� ������ �� ��� ���
  - ���� (NUMBER)
  - ��¥ (DATE)
*/
--ȸ�� ���̺� MEMBER ����
CREATE TABLE MEMBER(
 MEM_NO NUMBER,
 MEM_ID VARCHAR2(20),
 MEM_PW VARCHAR2(20),
 MEM_NAME VARCHAR2(20),
 GENDER CHAR(3),
 PHONE VARCHAR2(13),
 EMAIL VARCHAR2(50),
 MEM_DATE DATE
);

SELECT * FROM MEMBER;
---------------------------------------------------------------------------
/*
    2.�÷��� �ּ� �ޱ� (�÷��� ���� ����)
    
    [ǥ����]
    COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�����';
    
    >> �߸� �ۼ��ߴٸ� ���� �� �ٽ� �����ϸ� ��
*/
COMMENT ON COLUMN MEMBER.MEM_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.MEM_PASSWORD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.MEM_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.GENDER IS '����(��,��)';
COMMENT ON COLUMN MEMBER.PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.MEM_DATE IS 'ȸ��������';
--���̺� ������ �߰��ϱ�
--INSERT INTO ���̺�� VALUES();E
INSERT INTO MEMBER VALUES(1,'user01','1234','�質��','��','010-1234-5678','kim@naver.com','23/11/16');
INSERT INTO MEMBER VALUES(2,'user02','1234','�ڱ泲','��',null,NULL,'23/11/16');
INSERT INTO MEMBER VALUES(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
--------------------------------------------------------------------------------
/*
    <���� ���� CONTRAINTS>
    - ���ϴ� ������ ��(��ȿ�� ������ ��)�� �����ϱ� ���� Ư�� �÷��� �����ϴ� ����
    - ������ ���Ἲ ������ �������� �Ѵ�
        : �����Ϳ� ������ ���� ����,, �� �����Ͱ� ��Ȯ�ϰ� ��ȿ�ϰ� ������ ����
        1. ��ü ���Ἲ ���� ���� : NOT NULL, UNIQUE, CHECK(����),PRIMARY KEY ���� ����
        2. ���� ���Ἲ ���� ���� : FROEIGN KEY(�ܷ�Ű) ���� ����
    
    *���� : NOT NULL, UNIQUE,CHECK(����), PRIMARY KEY, FOREIGN KEY(�ܷ�Ű)
    
    NOT NULL ���� ����
    �ش� �÷��� �ݵ�� ���� �����ؾ߸� �� ���(��, �÷��� ���� MULL�� ������ �ȵǴ� ���)
    ����/������ NULL���� ������� �ʵ��� ����
    ���� ������ �ο� ����� ũ�� 2������ ����(�÷� ���� ��� | ���̺� ���� ���)
    -NOT NULL ���������� ������ �÷� ���� ��� �ۿ� �ȵ�
    
*/
--�÷� ���� ���: �÷��� �ڷ��� ���� ���� ������ �־���
CREATE TABLE MEM_NOTNULL(
MEM_NO NUMBER NOT NULL,
 MEM_ID VARCHAR2(20) NOT NULL,
 MEM_PW VARCHAR2(20) NOT NULL,
 MEM_NAME VARCHAR2(20) NOT NULL,
 GENDER CHAR(3),
 PHONE VARCHAR2(13),
 EMAIL VARCHAR2(50),
 MEM_DATE DATE);

INSERT INTO MEM_NOTNULL VALUES(1,'user01','1234','�質��','��','010-1234-5678','kim@naver.com','23/11/16');
--INSERT INTO MEM_NOTNULL VALUES(2,'user02',NULL,'�ڱ泲','��',null,NULL,SYSDATE);
--NOT NULL ���� ���ǿ� ����Ǵ� ���� �߻�
INSERT INTO MEM_NOTNULL VALUES(2,'user01','pass01','�̿���','��',null,null,sysdate);
--------------------------------------------------------------------------------
/**UNIQUE ���� ����
    �ش� �÷��� �ߺ��� ���� ���� �ȵǴ� ���
    �÷����� �ߺ��� ������ �ϴ� ��������
    ����/������ ������ �ִ� �����Ͱ��� �ߺ��Ǿ��� �� ���� �߻�
*/
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL UNIQUE,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(50));
    
    --���̺� ���� ���
    
    CREATE TABLE MEM_UNIQUE2(
    MEM_NO NUMBER NOT NULL ,
    MEM_ID VARCHAR2(20) NOT NULL ,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(50),
    UNIQUE (MEM_NO,MEM_ID)
/*    UNIQUE (MEM_NO),
    UNIQUE (MEM_ID)*/
    );
    
    --���̺� ��Ŀ� 2���� ���������� �Ʒ��� ���� ������
    /*
        UNIQUE(MEM_NO,MEM_ID)
       :MEM_NO�� MEM_ID�� ������ ��������� �ߺ��� üũ��
        1,A ->db�� �����Ͱ� �̷��� ��� ���� ��
        2,B
        3,C
        
        1,D ->���ο
*/
INSERT INTO MEM_UNIQUE VALUES(1,'user01','pass01','�賲��','��',null,null);
INSERT INTO MEM_UNIQUE VALUES(1,'user02','pass02','�賲��','��',null,null);

INSERT INTO MEM_UNIQUE2 VALUES(1,'user01','pass01','�賲��','��',null,null);
INSERT INTO MEM_UNIQUE2 VALUES(1,'user01','pass02','�賲��','��',null,null);

/*
    *���� ���� �ο��� �������Ǹ���� �ο��� �� �ִ�
    
    >> �÷� ���� ���
    CREATE TABLE ���̺� ��(
    �÷��� �ڷ���()[CONSTRAINT �������Ǹ�]��������,
    ...
    );
    
    >> ���̺� ���� ���
    CREATE TABLE ���̺��(
    �÷��� �ڷ���()
    ...,
    [CONSTRAINT �������Ǹ�] ��������(�÷���)
    );
*/

CREATE TABLE MEM_UNIQUE3 (
    MEM_NO NUMBER CONSTRAINT MEMNO_NN NOT NULL CONSTRAINT NO_UNIQUE UNIQUE,
    MEM_ID VARCHAR2(20) NOT NULL CONSTRAINT ID_UNIQUE UNIQUE,
    MEM_PW VARCHAR2(20) CONSTRAINT PW_NN NOT NULL,
    MEM_NAME VARCHAR2(20),
    GENDER CHAR(3),
    CONSTRAINT NAME_UNIQUE UNIQUE(MEM_NAME) -- ���̺� ���� ���
);
INSERT INTO MEM_UNIQUE3 VALUES(1, 'uid', 'upw', '��浿',null);
INSERT INTO MEM_UNIQUE3 VALUES(1, 'uid2', 'upw2', '���',null); --���� ������ �ٲ� �̸��� �� �� ����

INSERT INTO MEM_UNIQUE3 VALUES(2, 'uid2', 'upw2', '��', NULL);
INSERT INTO MEM_UNIQUE3 VALUES(3, 'uid3', 'upw2', '����', 'M');
-- ���� : ��,��
--------------------------------------------------------------------------------
/*
  *CHECK(���ǽ�) ���� ����
        �ش� �÷��� ���� �� ���� ���� ���� ������ ������ �� �� �ִ�
        �ش� ���ǿ� �����ϴ� �����Ͱ��� �Է��ϵ��� �� �� �ִ�
*/
CREATE TABLE MEM_CHECK(
MEM_NO NUMBER NOT NULL UNIQUE,
 MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
 MEM_PW VARCHAR2(20) NOT NULL,
 MEM_NAME VARCHAR2(20) NOT NULL,
 GENDER CHAR(3) CHECK(GENDER IN ('��','��')), --�÷� ���� ���
 PHONE VARCHAR2(13),
 EMAIL VARCHAR2(50),
 MEM_DATE DATE
--CHECK(GENDER IN ('��','��'))     --���̺� ���� ���
 );
 INSERT INTO MEM_CHECK VALUES(1, 'user01', 'pass01', 'ȫ�浿', '��', null, null, sysdate);
 INSERT INTO MEM_CHECK VALUES(2, 'user02', 'pass02', '�̱浿', 'F', null, null, sysdate);
 INSERT INTO MEM_CHECK VALUES(2, 'user02', 'pass02', '�̱浿', '��', null, null, sysdate);
 -------------------------------------------------------------------------------
     /*
        * PRIMARY KEY(�⺻Ű) ��������
        ���̺��� �� ����� �ĺ��ϱ� ���� ���� �÷��� �ο��ϴ� ��������(�ĺ��� ����)
        EX)ȸ����ȣ, �й�, ���, �����ȣ, ����� ��ȣ
        PRIMARY KEY ���������� �ο��ϸ� �� �÷��� �ڵ����� NOT NULL + UNIQUE ���������� �ǹ�
        >> ��ü������ �˻�, ����, ���� ��� �⺻Ű�� �÷����� �̿���
        
        --�� ���̺�� ���� �Ѱ��� ���� ����
    */
    
    CREATE TABLE MEM_PRIMARY(
     MEM_NO NUMBER PRIMARY KEY, --�÷� ���� ���
     MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
     MEM_PW VARCHAR2(20) NOT NULL,
     MEM_NAME VARCHAR2(20) NOT NULL,
     GENDER CHAR(3) CHECK(GENDER IN ('��','��')), --�÷� ���� ���
     PHONE VARCHAR2(13),
     EMAIL VARCHAR2(50),
     MEM_DATE DATE
     --PRIMARY KEY(MEM_NO) --���̺� ���� ��� 
    );
    INSERT INTO MEM_PRIMARY VALUES(1, 'user01','1234','�質��','��','010-1234-5678','kim@naver.com','23/11/16');
    INSERT INTO MEM_PRIMARY VALUES(1, 'user02','1234','�̳���','��','010-1234-0978','lee@naver.com','23/11/16');
    
    CREATE TABLE MEM_PRIMARY2(
     MEM_NO NUMBER PRIMARY KEY, --�÷� ���� ���
     MEM_ID VARCHAR2(20)PRIMARY KEY, --PRIMARY KEY ����� �Ѱ��� ����(����)
     MEM_PW VARCHAR2(20) NOT NULL,
     MEM_NAME VARCHAR2(20) NOT NULL,
     GENDER CHAR(3) CHECK(GENDER IN ('��','��')), --�÷� ���� ���
     PHONE VARCHAR2(13),
     EMAIL VARCHAR2(50),
     MEM_DATE DATE
     PRIMARY KEY(MEM_NO) --���̺� ���� ��� 
    );
    
    
    CREATE TABLE MEM_PRIMARY3(
     MEM_NO NUMBER,
     MEM_ID VARCHAR2(20), --PRIMARY KEY ����� �Ѱ��� ����(����)
     MEM_PW VARCHAR2(20) NOT NULL,
     MEM_NAME VARCHAR2(20) NOT NULL,
     GENDER CHAR(3) CHECK(GENDER IN ('��','��')), --�÷� ���� ���
     PHONE VARCHAR2(13),
     EMAIL VARCHAR2(50),
     MEM_DATE DATE,
     PRIMARY KEY(MEM_NO,MEM_ID) --����Ű; �����̸Ӹ�Ű�� �ΰ��� �ϸ� �ȵ�.
    );
    
    INSERT INTO MEM_PRIMARY3 VALUES(1,'uid','upw','���浿','��',null,null,sysdate);
    INSERT INTO MEM_PRIMARY3 VALUES(2,'uid','upw','���浿','��',null,null,sysdate);
    INSERT INTO MEM_PRIMARY3 VALUES(1,'uid2','upw','���浿','��',null,null,sysdate); --�÷��� 2���� �����ؼ� �����ؾ���
    INSERT INTO MEM_PRIMARY3 VALUES(1,null,'upw','���浿','��',null,null,sysdate); -- NOT NULL ����
    --> �⺻Ű�� �� �÷����� ���� NULL�� ������� �ʴ´�
    
/*
    ����Ű ��� ��(� ����ڰ� � ��ǰ�� ���ߴ��� �����͸� ������ ��)
    1 A
    1 B
    1 C
    2 A
    2 B
    3 C
    2 B(������)
*/
--------------------------------------------------------------------------------
-- ȸ�� ������ �����ϴ� ���̺� (MEM)
CREATE TABLE MEM (
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(20),
    MEM_DATE DATE
);
-- ȸ�� ����� �����ϴ� ���̺�(MEM_GRADE)
CREATE TABLE MEM_GRADE(
    GRADE_CODE NUMBER PRIMARY KEY,
    GRADE_NAME VARCHAR2(30) NOT NULL
);
INSERT INTO MEM_GRADE VALUES(10,'�Ϲ�ȸ��');
INSERT INTO MEM_GRADE VALUES(20,'���ȸ��');
INSERT INTO MEM_GRADE VALUES(30,'Ư��ȸ��');
-- ȸ�� ������ �����ϴ� ���̺�
CREATE TABLE MEM (
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(20),
    MEM_DATE DATE,
    GRADE_ID NUMBER  --ȸ�� ����� ������ �÷� ��
);
INSERT INTO MEM VALUES(1,'user01','pass01','ȫ�浿','��',NULL,NULL,SYSDATE,NULL);
INSERT INTO MEM VALUES(2,'user02','pass02','����','��',NULL,NULL,SYSDATE,10);
INSERT INTO MEM VALUES(3,'user03','pass03','�����','��',NULL,NULL,SYSDATE,50);
--��ȿ�� ȸ����� ��ȣ�� �ƴԿ��� �Էµ� 
---------------------------------------------------------------------------------
/*
    *FOREIGN KEY(�ܷ�Ű) ��������
    �ٸ� ���̺� �����ϴ� ���� ���;ߵǴ� Ư�� �÷��� �ο��ϴ� ���� ����
    --> �ٸ� ���̺��� �����Ѵٰ� ǥ��
    --> �ַ� FOREIGN KEY ���� ���ǿ� ���� ���̺� ���� ���谡 ������
    
    >>�÷� ���� ���
        -- �÷��� �ڷ��� REPERENCES ������ ���̺��(������ �÷���)
       �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] REPERENCES ������ ���̺��[(������ �÷���)]
    >>���̺� ���� ���
    --FOREIGN KEY(�÷���) REPERENCES ������ ���̺��(������ �÷���)
    [CONSTRAINT �������Ǹ�] FOREIGN KEY(�÷���) REPERENCES ������ ���̺��[(������ �÷���)]
    --> ������ �÷��� PRIMARY KEY�̸� ���� ����(�ڵ����� PRIMARY KEY�� �ܷ�Ű�� ����)
*/
CREATE TABLE MEM2 (
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(20),
    MEM_DATE DATE,
    GRADE_ID NUMBER,
    --GRADE_ID NUMBER REFERENCES MEM_GRADE(GRADE_CODE) --�÷� ���� ���
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE)
    );
    INSERT INTO MEM2 VALUES(1,'user01','pass0','ȫ�浿','��',NULL,NULL,SYSDATE,NULL);
INSERT INTO MEM2 VALUES(1,'user02','pass02','�̱浿','��',NULL,NULL,SYSDATE,10);
INSERT INTO MEM2 VALUES(1,'user03','pass03','���浿','��',NULL,NULL,SYSDATE,50); -- 50���� ��� 

-- MEM_GRADE(�θ����̺�) ----------- <- MEM2(�ڽ����̺�)

--> �̶� �θ����̺��� �����Ͱ��� ������ ��� � ���� �߻�?
    -- ������ ���� : DELETE FROM ���̺�� WHERE����; 
    
-- MEM_GRADE ���̺��� 10����� ����
DELETE FROM MEM_GRADE WHERE GRADE_CODE =10;
-- �ڽ����̺��� 10�̶�� ���� ����ϰ� �ֱ� ������ ���� �ȵ�

-- MEM_GRADE ���̺��� 30����� ����
DELETE FROM MEM_GRADE WHERE GRADE_CODE =30;
-- �ڽ����̺��� 30�̶�� ���� ����ϰ� ���� �ʱ� ������ ������

--> �ڽ����̺� �̹� ���ǰ� �ִ� ���� ���� ���
-- �θ����̺�κ��� ������ ������ �ȵǴ� �������� �ɼ��� �ɷ�����(DEFAULT��)


    
--------------------------------------------------------------------------------
/*
    �ڽ����̺� �����ÿܷ�Ű �������� �ο��� �� �����ɼ� ���� ����
    * ���� �ɼ� : �θ����̺��� ������ ������ �� �����͸� ����ϰ� �ִ� �ڽ����̺��� ���� ��� ó������??
    -ON DELETE RESTRICTED(�⺻��) : ���� ���� �ɼ����� , �ڽ� ���̺��� ���̴� ���� �θ� ���̺��� ����
    -ON DELETE SET NULL : �θ� ���̺��� ������ �ڽ� ���̺��� ���� NULL�� �����ϰ� ����
    -ON DELETE CASCADE : �θ� ���̺��� �����ϸ� �ڽ����̺� ����(����ü ����)
*/
DROP TABLE MEM;
DROP TABLE MEM2;

CREATE TABLE MEM (
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(20),
    MEM_DATE DATE,
    GRADE_ID NUMBER REFERENCES MEM_GRADE ON DELETE SET NULL
);

INSERT INTO MEM VALUES(1,'user01','pass01','ȫ�浿','��',NULL,NULL,SYSDATE,NULL);
INSERT INTO MEM VALUES(2,'user02','pass02','����','��',NULL,NULL,SYSDATE,10);
INSERT INTO MEM VALUES(3,'user03','pass03','�̱��','��',NULL,NULL,SYSDATE,20);
INSERT INTO MEM VALUES(4,'user04','pass04','�����','��',NULL,NULL,SYSDATE,10);

DELETE FROM MEM_GRADE
WHERE GRADE_CODE =10;
CREATE TABLE MEM2 (
    MEM_NO NUMBER PRIMARY KEY, 
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE,
    MEM_PW VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3) CHECK(GENDER IN ('��','��')),
    PHONE VARCHAR2(20),
    EMAIL VARCHAR2(20),
    MEM_DATE DATE,
    GRADE_ID NUMBER REFERENCES MEM_GRADE ON DELETE CASCADE
);

INSERT INTO MEM2 VALUES(1,'user01','pass01','ȫ�浿','��',NULL,NULL,SYSDATE,NULL);
INSERT INTO MEM2 VALUES(2,'user02','pass02','����','��',NULL,NULL,SYSDATE,10);
INSERT INTO MEM2 VALUES(3,'user03','pass03','�̱��','��',NULL,NULL,SYSDATE,20);
INSERT INTO MEM2 VALUES(4,'user04','pass04','�����','��',NULL,NULL,SYSDATE,10);
DELETE FROM MEM_GRADE
WHERE GRADE_CODE=10;
--------------------------------------------------------------------------------
/*
    <DEFUALT �⺻��> : ���������� �ƴ�
    ������ ���Խ� �����͸� ���� ���� ��� DEFAULT ������ �����Ѵ�.
*/
CREATE TABLE MEMBER2(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PW VARCHAR(20) NOT NULL,
    MEM_AGE NUMBER, 
    HOBBY VARCHAR(20) DEFAULT '����',
    MEM_DATE DATE DEFAULT SYSDATE
);
INSERT INTO MEMBER2(1,'user01','p01',24,'����','23/11/16');
INSERT INTO MEMBER2(2,'user02','p02',Null,Null,NUll);
INSERT INTO MEMBER2(3,'user03','p03',NULL,DEFAULT,DEFAULT);
--============================================================================
/*
========================== aie ����============================================
<SUBQUERY�� �̿��� ���̺� ����>
���̺� �����ϴ� ����

[ǥ����]
CREATE TABLE ���̺� ��
AS ��������;

*/
--EMPLOYEE ���̺��� ������ ���ο� ���̺��� ����
CREATE TABLE EMPLOYEE_COPY
AS SELECT *
    FROM EMPLOYEE;
    -- �÷�, �����Ͱ�, �������� ���� ��� NOT NULL�� �����
    --DEFAULT, COMMENT�� COPY�ȵ�
    
    CREATE TABLE EMPLOYEE_COPY2
    AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    FROM EMPLOYEE;
    
      CREATE TABLE EMPLOYEE_COPY3
    AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE 1=0; --���̺��� ������ �����ϰ��� �� �� ���̴� ����(������ ���� �ʿ� ���� ��)
    
    CREATE EMPLOYEE_COPY4
     AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS, SALARY*12
      FROM EMPOLOYEE;
--���� �÷��� ��Ī�� �ݵ�� ����Ѵ�
    -- �������� SELECT���� ����� �Ǵ� �Լ����� ����� ���� �ݵ�� ��Ī �ο��ؾ���
    
    CREATE TABLE EMPLOYEE_COPY4
    AS SELECT EMP_ID, EMP_NAME, SALARY, BONUS, SALARY*12����
    FROM EMPLOYEE;
    ---------------------------------------------------------------------------
    /*
    *���̺��� �� ������ �Ŀ� �������� �߰�
    ALTER TABLE ���̺� �� ������ ����;
    - PRIMARY KET : ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���);
    - FOREIGN KEY : ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFRERENCES ������ ���̺� ��[(������ �÷���)];
    - UNIQUE      : ALTER TABLE ���̺�� ADD UNIQUE (�÷���);
    - CHECK       : ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�);
    -NOT NULL     : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;
    */  
-- EMPLOYEE_COPY ���̺� PRIMARY KEY �������� �߰�
ALTER TABLE EMPLOYEE_COPY ADD PRIMARY KEY(EMP_ID);
--EMPLOYEE ���̺� DEPT_CODE�� �ܷ�Ű �������� �߰�(�θ����̺� DEPARTMENT)
ALTER TABLE EMPLOYEE
ADD CONSTRAINT DEPT_ID
FOREIGN KEY (DEPT_CODE)
REFERENCES DEPARTMENT;
--EMPLOYEE ���̺� JOB_CODE�� �ܷ�Ű �������� �߰�(JOB ���̺�)
ALTER TABLE EMPLOYEE
ADD CONSTRAINT JOB_CODE
FOREIGN KEY (JOB_CODE)
REFERENCES JOB;
--DEPARTMENT ���̺� LOCATION_ID�� �ܷ�Ű �������� �߰�(LOCATION���̺�)
ALTER TABLE DEPARTMENT
ADD CONSTRAINT LOCAL_CODE
FOREIGN KEY (LOCATION_ID)
REFERENCES LOCATION;
    --EMPLOYEE_COPY ���̺� MEM_ID�� MEM_NO�� �÷��� COMMENT �־��ֱ�
    
ALTER TABLE EMPLOYEE_COPY
ADD(MEM_ID VARCHAR2(20), MEM_NO NUMBER);
COMMENT ON COLUMN EMPLOYEE_COPY.MEM_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN EMPLOYEE_COPY.MEM_NO IS 'ȸ����ȣ';

SELECT *
FROM EMPLOYEE_COPY;

SELECT * FROM EMPLOYEE_COPY;


/*
1. ���ǻ�鿡 ���� �����͸� ������� ���ǻ� ���̺�(TB_PUBLISHER)
   �÷�  :  PUB_NO(���ǻ��ȣ) NUMBER -- �⺻Ű(PUBLISHER_PK) 
	PUB_NAME(���ǻ��) VARCHAR2(50) -- NOT NULL(PUBLISHER_NN)
	PHONE(���ǻ���ȭ��ȣ) VARCHAR2(13) - �������� ����

   - 3�� ������ ���� ������ �߰��ϱ�
*/
    CREATE TABLE TB_PUBLISHER (
        PUB_NO NUMBER CONSTRAINT PUBLISHER_PK PRIMARY KEY,
        PUB_NAME VARCHAR2(50) CONSTRAINT PUBLISHER_NN NOT NULL,
        PHONE VARCHAR2(13)
    );

    INSERT INTO TB_PUBLISHER VALUES(1,'�Ѻ��̵��','031-202-2222');
    INSERT INTO TB_PUBLISHER VALUES(2,'�Ѻ��̵��','031-203-3333');
    INSERT INTO TB_PUBLISHER VALUES(3,'���ö�̵��','031-204-4444');
/*
2. �����鿡 ���� �����͸� ������� ���� ���̺�(TB_BOOK)
   �÷�  :  BK_NO (������ȣ) NUMBER -- �⺻Ű(BOOK_PK)
	BK_TITLE (������) VARCHAR2(50) -- NOT NULL(BOOK_NN_TITLE)
	BK_AUTHOR(���ڸ�) VARCHAR2(20) -- NOT NULL(BOOK_NN_AUTHOR)
	BK_PRICE(����) NUMBER
	BK_PUB_NO(���ǻ��ȣ) NUMBER -- �ܷ�Ű(BOOK_FK) (TB_PUBLISHER ���̺��� �����ϵ���)
			         �̶� �����ϰ� �ִ� �θ����� ���� �� �ڽ� �����͵� ���� �ǵ��� �ɼ� ����
   - 5�� ������ ���� ������ �߰��ϱ�*/
   CREATE TABLE TB_BOOK ( 
       BK_NO NUMBER CONSTRAINT BOOK_PK PRIMARY KEY,
       BK_TITLE VARCHAR2(50) CONSTRAINT BOOK_NN_TITLE NOT NULL,
       BK_AUTHOR VARCHAR2(50) CONSTRAINT BOOK_NN_AUTHOR NOT NULL,
       BK_PRICE NUMBER,
       BK_PUB_NO NUMBER,
       FOREIGN KEY(BK_PUB_NO) REFERENCES TB_PUBLISHER(PUB_NO)ON DELETE CASCADE
   );

    INSERT INTO TB_PUBLISHER VALUES(1,'��ο� ���','�����',7000,1);
    INSERT INTO TB_PUBLISHER VALUES(2,'��ζ� ���','����',7500,2);
    INSERT INTO TB_PUBLISHER VALUES(3,'��δ� ��ζ�','����',9000,1);
    INSERT INTO TB_PUBLISHER VALUES(4,'��ΰ� �θ�','�����',9500,2);
    INSERT INTO TB_PUBLISHER VALUES(5,'��ΰ� �θ�','���ö',30000,3);
 /*  ȸ���� ���� �����͸� ������� ȸ�� ���̺� (TB_MEMBER)
   �÷��� : MEMBER_NO(ȸ����ȣ) NUMBER -- �⺻Ű(MEMBER_PK)
   MEMBER_ID(���̵�) VARCHAR2(30) -- �ߺ�����(MEMBER_UQ)
   MEMBER_PWD(��й�ȣ)  VARCHAR2(30) -- NOT NULL(MEMBER_NN_PWD)
   MEMBER_NAME(ȸ����) VARCHAR2(20) -- NOT NULL(MEMBER_NN_NAME)
   GENDER(����)  CHAR(1)-- 'M' �Ǵ� 'F'�� �Էµǵ��� ����(MEMBER_CK_GEN)
   ADDRESS(�ּ�) VARCHAR2(70)
   PHONE(����ó) VARCHAR2(13)
   STATUS(Ż�𿩺�) CHAR(1) - �⺻������ 'N' ���� ����, �׸��� 'Y' Ȥ�� 'N'���θ� �Էµǵ��� ��������(MEMBER_CK_STA)
   ENROLL_DATE(������) DATE -- �⺻������ SYSDATE, NOT NULL ��������(MEMBER_NN_EN)

   - 5�� ������ ���� ������ �߰��ϱ�*/
   CREATE TABLE TB_MEMBER(
       MEMBER_NO NUMBER CONSTRAINT MEMBER_PK PRIMARY KEY,
       MEMBER_ID VARCHAR2(30) CONSTRAINT MEMBER_UQ UNIQUE,
       MEMBER_PWD VARCHAR2(30) CONSTRAINT MEMBER_NN_PWD NOT NULL,
       MEMBER_NAME VARCHAR2(20) CONSTRAINT MEMBER_NN_NAME NOT NULL,
       GENDER CHAR(1)CHECK(GENDER IN('M','F')),
       ADRESS VARCHAR2(70) ,
       PHONE VARCHAR2(13) ,
       STATUS CHAR(1)DEFAULT 'N' CONSTRAINT MEMBER_CK_STA CHECK(STATUS IN('Y','N')),
       ENROLL_DATE DATE DEFAULT SYSDATE CONSTRAINT MEMBER_NN_EN NOT NULL
   );
   INSERT INTO TB_MEMBER VALUES(1,'user1','1213','���̺�','M','������','010-2222-7805','N',SYSDATE);
   INSERT INTO TB_MEMBER VALUES(2,'user2','1223','���̼�','F','�����','010-4321-1251','N',SYSDATE);
   INSERT INTO TB_MEMBER VALUES(3,'user3','1233','��ֿ�','F','�����','010-2555-2314','Y',SYSDATE);
   INSERT INTO TB_MEMBER VALUES(4,'user4','1243','ħ����','M','�Ⱦ��','010-8723-7178','N',SYSDATE);
   INSERT INTO TB_MEMBER VALUES(5,'user5','1253','��ȣ��','M','�˼�������','010-6922-2995','N',SYSDATE);
   
/*   4. � ȸ���� � ������ �뿩�ߴ����� ���� �뿩��� ���̺�(TB_RENT)
   �÷�  :  RENT_NO(�뿩��ȣ) NUMBER -- �⺻Ű(RENT_PK)
	RENT_MEM_NO(�뿩ȸ����ȣ) NUMBER -- �ܷ�Ű(RENT_FK_MEM) TB_MEMBER�� �����ϵ���
			�̶� �θ� ������ ������ �ڽ� ������ ���� NULL�� �ǵ��� �ɼ� ����
	RENT_BOOK_NO(�뿩������ȣ) NUMBER -- �ܷ�Ű(RENT_FK_BOOK) TB_BOOK�� �����ϵ���
			�̶� �θ� ������ ������ �ڽ� ������ ���� NULL���� �ǵ��� �ɼ� ����
	RENT_DATE(�뿩��) DATE -- �⺻�� SYSDATE

   - 3�� ���� ���õ����� �߰��ϱ�*/
   CREATE TABLE TB_RENT(
       RENT_NO NUMBER CONSTRAINT RENT_PK PRIMARY KEY,
       RENT_MEM_NO NUMBER, --�ڽ� ���̺� ������ְ�
       FOREIGN KEY (RENT_MEM_NO) REFERENCES TB_MEMBER(MEMBER_NO)ON DELETE SET NULL, 
       --FOREIGN KEY�� �̿��� �θ����̺��� ������ �� �θ� �����ϸ� �ڽ� ���̺��� NULL���� �������� ����
       RENT_BOOK_NO NUMBER,
       FOREIGN KEY (RENT_BOOK_NO) REFERENCES TB_BOOK(BK_NO) ON DELETE SET NULL,
       RENT_DATE DATE DEFAULT SYSDATE 
       );
    INSERT INTO TB_RENT VALUES(1,1,3,SYSDATE);