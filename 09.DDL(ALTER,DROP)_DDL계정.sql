/*
    <ALTER>
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    ALTER TABLE ���̺�� �����ҳ���;
    
    * ������ ����
       1) �÷� �߰� / ���� / ����
       2) �������� �߰� / ����   -> ���� �Ұ�(�����ϰ����ϸ� ���� �� ���� �߰�)
       3) �÷��� / �������Ǹ� / ���̺�� ����
*/

--===== 1) �÷� �߰� / ���� / ����
-- 1. �÷� �߰� (ADD) : ADD �÷��� ������Ÿ�� [DEFAULT �⺻��]

-- DEPT_COPY���̺� CNAME �÷� �߰�
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
--> ���ο� �÷��� ���������� �⺻������ NULL�� ä����

-- DEPT_COPY���̺� LNAME �÷� �߰�, �⺻���� �ѱ����� �߰�
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '�ѱ�';
--> ���ο� �÷��� ���������� ���� ������ �⺻������ ä����

-- 2. �÷� ���� (MODIFY) : 
-->     ������ Ÿ�� ���� : MODIFY �÷��� �ٲٰ����ϴµ�����Ÿ��
-->     DEFAULT�� ���� : MODIFY �÷��� DEFAULT �ٲٰ����ϴ±⺻��

-- DEPT_COPY���̺��� DEPT_ID�� ������ Ÿ���� CHAR(3)���� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);


-- DEPT_COPY���̺��� DEPT_ID�� ������ Ÿ���� NUMBER���� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;
-- �����߻� : �÷����� ������ ����. ���� �÷��� ������ Ÿ���� �����ϱ� ���ؼ��� �ش� �÷��� ���� ��� ������ ���� ����

-- DEPT_COPY���̺��� DEPT_TITLE�� ������ Ÿ���� VARCHAR2(10) ����
ALTER TABLE DEPT_COPY MODIFY  DEPT_TITLE VARCHAR2(10);
-- �����߻� : �÷��� ���� 10BYTE�� �Ѵ� �����Ͱ� �������

-- DEPT_TITLE : VARCAHR2(40)
-- LOCATION_ID : VARCHAR2(2)
-- LNAME : '�̱�'���� ����

-- ���ߺ���
ALTER TABLE DEPT_COPY
    MODIFY DEPT_TITLE VARCHAR2(40)
    MODIFY LOCATION_ID VARCHAR2(2)
    MODIFY LNAME DEFAULT '�̱�';

-- 3. �÷� ����(DROP COLUMN)
/*
    [ǥ����]
    ALTER TABLE ���̺�� DROP COLUMN �÷���;
*/
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY;

-- DEPT_COPY2 ���̺��� LNMAE �÷� ����
ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;

-- �÷� ������ ���� �ȵ�
ALTER TABLE DEPT_COPY2
    DROP COLUMN DEPT_TITLE
    DROP COLUMN LNAME;

ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;
ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;

ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;
--> �����߻� : �ּ� �Ѱ��� �÷��� �����ؾ� ��

------------------------------------------------------------------------------------------------------
--    2) �������� �߰� / ����
--===== 1. �������� �߰�
/*
    * ALTER TABLE ���̺�� �����ҳ���;
       - PRIMARY KEY : ALTER TABLE ���̺�� ADD PRIMARY KEY(�÷���);
       - FOREIGN KEY : ALTER TABLE ���̺�� ADD FOREIGN KEY(�÷���) REFERENCES ���������̺��[(�������÷���)];
       - UNIQUE          : ALTER TABLE ���̺�� ADD UNIQUE(�÷���);
       - CHECK           : ALTER TABLE ���̺�� ADD CHECK(�÷��� ���� ���ǽ�);
       - NOT NULL      : ALTER TABLE ���̺�� MODIFY �÷��� NOT NULL;
*/

--===== 2. �������� ����
/*
    [ǥ����]
    ALTER TABLE ���̺�� DROP CONSTRAINT ��������;
    ALTER TABLE ���̺�� MODIFY �÷��� NULL;                        --> NULL�϶��� ����
*/
ALTER TABLE EMPLOYEE DROP CONSTRAINT F_JOB;

ALTER TABLE EMP_DEPT MODIFY EMP_NAME NULL; 

------------------------------------------------------------------------------------------------------
--    3) �÷��� / �������Ǹ� / ���̺�� ���� (RENAME)
--==== 1. �÷��� ���� : RENAME COLUMN �����÷��� TO �ٲ��÷���
-- DEPT_COPY ���̺��� DEPT_TITLE�� DEPT_NAME ����  �÷��� ����
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

--==== 2. �������Ǹ� ���� : RENAME CONSTRAINT �����������Ǹ� TO �ٲ��������Ǹ�
-- EMPLOYEE_COPY���̺��� �⺻Ű�� ���������� �̸� ����
ALTER TABLE EMPLOYEE_COPY RENAME CONSTRAINT SYS_C007417 TO EC_PK;

--==== 3. ���̺�� ���� :  [�������̺��] RENAME TO �ٲ����̺��
-- DEPT_COPY => DEPT_TEST
ALTER TABLE DEPT_COPY RENAME  TO DEPT_TEST;

------------------------------------------------------------------------------------------------------
-- ���̺� ����
-- DROP TABLE ���̺��;
/*
    ����
    ��򰡿��� �����ǰ� �ִ� �θ����̺��� �Ժη� ���� �ȵ�
    ���� ������ �ϰ�ʹٸ�
    ���1. �ڽ����̺��� ���� ���� �� �θ����̺� ����
    ���2. �׳� �θ����̺� �����ϴµ� �������Ǳ��� ���� �����ϴ� ���
                             DROP TABLE ���̺�� CASCADE CONSTRINT;
*/
DROP TABLE DEPT_TEST;