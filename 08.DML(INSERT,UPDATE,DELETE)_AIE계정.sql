/*
    * DML(DATE MANIPULATION LANGUGE) : ������ ���۾��
       ���̺� ���� ����(INSERT)�ϰų�, ����(UPDATE), ����(DELETE), �˻�(SELECT)�ϴ� ����
*/
--===================================================================================
/*
    1. INSERT
        ���̺� ���ο� ���� �߰��ϴ� ����
        
        [ǥ����]
        1) INSERT INTO ���̺�� VALUES(��1, ��2, ��3,...)
            ���̺��� ��� �÷��� ���� ���� �־� �� ���� �ְ��� �Ҷ�
            �÷��� ������� VALUES�� ���� �ִ´�
            
            �����ϰ� ���� �־��� �� => not enough value����
            ���� �� ���� �־��� �� => too many values����
*/
INSERT INTO EMPLOYEE VALUES(300, '�̽ÿ�', '051117-1234567', 'lee_elk@elk.or.kr', '01023456789'
                                                        , 'D1', 'J5', 3500000, 0.2, 200, SYSDATE, NULL, DEFAULT);
                                                        
INSERT INTO EMPLOYEE VALUES(301, '�̽ÿ�', '051117-1234567', 'lee_elk@elk.or.kr', '01023456789'
                                                        , 'D1', 'J5', 3500000, 0.2, 200, SYSDATE, NULL, DEFAULT, NULL);  
      -- ���� ���ų� ������ ����

----------------------------------------------------------------------------------------------------
/*
    2) INSERT INTO ���̺��(�÷���, �÷���, �÷���...) VALUES(��, ��, ��...)
        ���̺� ���� ������ �÷��� ���� ���� �� ���
        ������� �߰� �Ǳ� ������ ���õ��� ���� �÷��� �⺻������ NULL�� ��
        => �ݵ�� �־�ߵ� �÷� : �⺻Ű, NOT NULL�� �÷�
        ��, �⺻��(DEFAULT)�� �����Ǿ� �ִ� �÷��� NULL�� �ƴ� �⺻���� ��
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE,  HIRE_DATE) 
        VALUES  (301, '����â','031017-1234567', 'J1', SYSDATE);

INSERT INTO EMPLOYEE(HIRE_DATE, EMP_ID, JOB_CODE, EMP_NAME, EMP_NO) 
        VALUES  (SYSDATE, 302, 'J1', '�����', '031017-1234567');

SELECT * FROM EMPLOYEE; 

----------------------------------------------------------------------------------------------------
/*
    3) ���������� �̿��� INSERT
        VALUES�� ���� ���� ����ϴ� ��� ���������� ��ȸ�� ������� ��� INSERT ����(�����൵ ����)
        - INSERT INTO ���̺�� (��������);
*/
-- ���̺� ����
CREATE TABLE EMP_01 (
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(20),
    DEPT_NAME VARCHAR2(35)
);

-- ��ü ����� ���, �����, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_TITLE
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID);

INSERT INTO EMP_01
            (SELECT EMP_ID, EMP_NAME, DEPT_TITLE
            FROM EMPLOYEE
            LEFT JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID));

----------------------------------------------------------------------------------------------------
/*
    4) INSERT ALL : �ΰ� �̻��� ���̺� ���� INSERT�� ��
        ��, �̶� ���Ǵ� ���������� ������ ���
        
        [ǥ����]
        INSERT ALL
        INTO ���̺��1 VALUES(�÷���, �÷���,...)
        INTO ���̺��2 VALUES(�÷���, �÷���,...)
            ��������;
*/
-- ���̺� 2�� ����
CREATE TABLE EMP_DEPT
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE
         FROM EMPLOYEE
       WHERE 1=0;  

CREATE TABLE EMP_MANAGER
AS SELECT EMP_ID, EMP_NAME, MANAGER_ID
         FROM EMPLOYEE
      WHERE 1=0;

-- �μ��ڵ尡 D1�� ������� ���, �����, �μ��ڵ�, �Ի���, �����ȣ ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
  FROM EMPLOYEE
WHERE DEPT_CODE = 'D1';  

INSERT ALL
INTO EMP_DEPT VALUES(EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE)
INTO EMP_MANAGER VALUES(EMP_ID, EMP_NAME, MANAGER_ID)
        SELECT EMP_ID, EMP_NAME, DEPT_CODE, HIRE_DATE, MANAGER_ID
        FROM EMPLOYEE
        WHERE DEPT_CODE = 'D1'; 

----------------------------------------------------------------------------------------------------
/*
    5) ������ �����Ͽ� �� ���̺� INSERT ����
     
     [ǥ����]
     INSERT ALL
     WHEN ����1 THEN
            INTO ���̺��1 VALUES(�÷���, �÷���...)
     WHEN ����2 THEN
            INTO ���̺��2 VALUES(�÷���, �÷���...)
*/
-- 2000�⵵ ������ �Ի��� ������� ���� ������ ���� ���̺� ����
CREATE TABLE EMP_OLD
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
        FROM EMPLOYEE
     WHERE 1=0;

-- 2000�⵵ ���Ŀ� �Ի��� ������� ���� ������ ���� ���̺� ����
CREATE TABLE EMP_NEW
AS SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
        FROM EMPLOYEE
     WHERE 1=0; 

INSERT ALL
WHEN HIRE_DATE < '2000/01/01'  THEN
        INTO EMP_OLD VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
WHEN HIRE_DATE >= '2000/01/01'  THEN
        INTO EMP_NEW VALUES(EMP_ID, EMP_NAME, HIRE_DATE, SALARY)
SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY
  FROM EMPLOYEE;

--===================================================================================
/*
    2. UPDATE
        ���̺� ����Ǿ� �ִ� ������ �����͸� �����ϴ� ����
        
        [ǥ����]
        UPDATE ���̺��
        SET �÷��� = �ٲܰ�,
                �÷��� = �ٲܰ�,
                ...
        [WHERE ����];
        
        * ������ ��
           WHERE���� ������ ��� ���� �����Ͱ� �����
*/
-- ���̺� ����
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT;

-- D3 �μ��� �μ����� '������ȹ������ ����'
UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��';

ROLLBACK;

UPDATE DEPT_COPY
SET DEPT_TITLE = '������ȹ��'
WHERE DEPT_ID = 'D3';

-- ���� ���̺� ����
CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
         FROM EMPLOYEE;
         
-- ������ ����� �޿��� 400�������� ����

-- ������ ����� �޿��� 410������, ���ʽ��� 0.25�� ����

-- ��ü����� �޿��� ���� �޿��� 10%�λ��� �ݾ����� ����(�����޿� * 1.1) = (�����޿� + (�����޿� * 0.1))

----------------------------------------------------------------------------------------------------
/*
    2.1 UPDATE�� �������� ���
    
    [ǥ����]
    UPDATE ���̺��
    SET �÷��� = (��������)
    [WHERE ����];
*/
-- ������ ����� �޿��� ���ʽ����� ����������� �޿��� ���ʽ������� ����
UPDATE EMP_SALARY
SET SALARY = (SELECT SALARY
                            FROM EMPLOYEE
                          WHERE EMP_NAME = '������'),  
        BONUS = (SELECT BONUS
                            FROM EMPLOYEE
                          WHERE EMP_NAME = '������')
WHERE EMP_NAME = '������';                       

UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                                        FROM EMPLOYEE
                                        WHERE EMP_NAME = '������')
WHERE EMP_NAME = '������'; 

-- �̽ÿ�, ����â, �����, ������, �������� ������� �޿��� ���ʽ��� ����������� ������ ����
UPDATE EMP_SALARY
SET (SALARY, BONUS) = (SELECT SALARY, BONUS
                                        FROM EMPLOYEE
                                        WHERE EMP_NAME = '������')
WHERE EMP_NAME IN ('�̽ÿ�', '����â', '�����', '������', '��������');

--==  JOIN���� ������ ����
-- ASIA �������� �ٹ��ϴ� ������� ���ʽ��� 0.3���� ����

-- ASIA ������ �ٹ��ϴ� ����� ��ȸ
SELECT EMP_ID
FROM EMPLOYEE
JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
WHERE LOCAL_NAME LIKE 'ASIA%';

UPDATE EMP_SALARY
SET BONUS = 0.3
WHERE EMP_ID IN (SELECT EMP_ID
                                FROM EMPLOYEE
                                JOIN DEPARTMENT ON (DEPT_CODE = DEPT_ID)
                                JOIN LOCATION ON (LOCAL_CODE = LOCATION_ID)
                                WHERE LOCAL_NAME LIKE 'ASIA%');

ALTER TABLE EMPLOYEE ADD FOREIGN KEY(JOB_CODE) REFERENCES JOB;

----------------------------------------------------------------------------------------------------
-- UPDATE�ÿ��� �ش� �÷������� �������ǿ� ���� �Ǹ� �ȵ�
-- ����� 200���� ����� �̸� NULL ����
UPDATE EMPLOYEE
SET EMP_NAME = NULL
WHERE EMP_ID = 200;     -- NOT NULL �������� ����

-- �������� ����� �����ڵ带 J9�� ����
UPDATE EMPLOYEE
SET JOB_CODE = 'D9'
WHERE EMP_NAME = '������';     -- �ܷ�Ű �������� ����
----------------------------------------------------------------------------------------------------
/*
    3.  DELETE
         ���̺� ����� �����͸� �����ϴ� ����(������� ����)
         
         [ǥ����]
         DELETE FROM ���̺��
         [WHERE ����];
         
         * ���ǻ���
         WHERE���� ������ ���������� ����� ����
*/

-- '������'����� ����
DELETE FROM EMPLOYEE;

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_NAME = '������';

ROLLBACK;

DELETE FROM EMPLOYEE
WHERE EMP_ID = 300;

-- JOB_CODE�� J1�� �μ� ����
DELETE FROM JOB
WHERE JOB_CODE = 'J1';
-- �������ǿ� ����Ǵ� ������ �ȵ�

/*
    * TRUNCATE : ���̺��� ��ü �����͸� ������ �� ����ϴ� ����
                            DELETE���� ����ӵ��� ������
                            ������ �������� �Ұ�, ROLLBACK�Ұ�
                            
       [ǥ����]
       TRUNCATE TABLE ���̺��;
*/
TRUNCATE TABLE EMP_SALARY;
ROLLBACK;       -- �ѹ�ȵ�