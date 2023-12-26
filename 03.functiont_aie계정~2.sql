/*
    <�Լ�>
    ���޵� �÷����� �о�鿩 �Լ��� ������ ��� ��ȯ
    
    - ������ �Լ� : N���� ���� �о�鿩 N���� ������� ��ȯ(�� �ึ�� �Լ� ����)
    - �׷� �Լ� : N���� ���� �о�鿩 1���� ������� ��ȯ(�׷캰�� �Լ� ����)
    
    >> SELECT���� ������ �Լ��� �׷��Լ��� �Բ� ����� �� ����
    
    >> �Լ����� ����� �� �ִ� ��ġ : SELECT��, WHERE ��, ORDER BY��, HAVING��
*/
-----------------------------------------���� �� �Լ� ----------------------------------------------
--===================================================================================
--                                                            <���� ó�� �Լ�>
--===================================================================================
/*
    LENGTH / LENGTHB => NUMBER�� ��ȯ
    
    LENGTH(�÷� | '���ڿ�') : �ش� ���ڿ��� ���ڼ� ��ȯ
    LENGTHB(�÷� | '���ڿ�') : �ش� ���ڿ��� byte�� ��ȯ
        - �ѱ� : XE������ �� => 1���ڴ� 3byte(������ � 1���ڿ� �ش�)
                    EE������ �� => 1���ڴ� 2byte
        - �׿� : 1���ڴ� 1byte
*/

SELECT LENGTH('����Ŭ'), LENGTHB('����Ŭ')
FROM DUAL;      -- ����Ŭ���� �����ϴ� ���� ���̺�

SELECT LENGTH('oracle'), LENGTHB('oracle')
FROM DUAL;

SELECT LENGTH('���Ǥ���') || '����' , LENGTHB('���Ǥ���') || 'byte'
FROM DUAL;

SELECT EMP_NAME, LENGTH(EMP_NAME)  || '����' , LENGTHB(EMP_NAME) || 'byte',
             EMAIL, LENGTH(EMAIL) || '����', LENGTHB(EMAIL) || 'byte'
  FROM EMPLOYEE; 
  
--------------------------------------------------------------------------------------------------
/*
    INSTR : ���ڿ��κ��� Ư�� ������ ������ġ(INDEX)�� ã�Ƽ� ��ȯ(��ȯ��:NUMBER)
       - ORACLE���� INDEX��ȣ�� 1���ͽ���. ã�� ���ڰ� ������ 0��ȯ
       
    INSTR(�÷� | '���ڿ�', ' ã�� ���ڿ�', [ã����ġ�� ���۰�, [����]) 
    
    ã����ġ�� ���۰�
    1 : �տ������� ã��(�⺻��)
    -1 : �ڿ������� ã��
*/

SELECT INSTR('JAVASCRIPTJAVAORACLE', 'A') FROM DUAL;         -- ��� : 2
SELECT INSTR('JAVASCRIPTJAVAORACLE', 'A', 1) FROM DUAL;      -- ��� : 2
SELECT INSTR('JAVASCRIPTJAVAORACLE', 'A', -1) FROM DUAL;    -- ��� : 17
SELECT INSTR('JAVASCRIPTJAVAORACLE', 'A', 1, 3) FROM DUAL;  -- ��� : 12
SELECT INSTR('JAVASCRIPTJAVAORACLE', 'A', -1, 2) FROM DUAL; -- ��� : 14

SELECT EMAIL, INSTR(EMAIL, '_') "_��ġ", INSTR(EMAIL, '@') "@��ġ"
  FROM EMPLOYEE;

--------------------------------------------------------------------------------------------------
/*
    SUBSTR : ���ڿ����� Ư�� ���ڿ��� �����Ͽ� ��ȯ(CHARACTER)
    
    SUBSTR(�÷� | '���ڿ�', POSITION, [LENGTH])
     - POSITION : ���ڿ��� ������ ������ġ INDEX
     - LENGTH : ������ ���� ����(������ �Ǹ��������� ����)
*/
SELECT SUBSTR('ORACLEHTMLCSS', 7) FROM DUAL;        -- ��� : HTMLCSS
SELECT SUBSTR('ORACLEHTMLCSS', 7, 4) FROM DUAL;       -- ��� : HTML
SELECT SUBSTR('ORACLEHTMLCSS', 1, 6) FROM DUAL;       -- ��� : ORACLE
SELECT SUBSTR('ORACLEHTMLCSS', -7, 4) FROM DUAL;    -- ��� : HTML(INDEX�� �����̸� �ڿ������� INDEX��ȣ�� ����)

-- �ֹι�ȣ���� ������ �����Ͽ� �����, �ֹι�ȣ, ������ ��ȸ
SELECT EMP_NAME, EMP_NO, SUBSTR(EMP_NO, 8, 1) ����
FROM EMPLOYEE;

-- ���ڻ���鸸 ���, �����, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO, 8, 1) ����
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) = '2' OR SUBSTR(EMP_NO, 8, 1) = '4';

-- ���ڻ���鸸 ���, �����, ������ ��ȸ
SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO, 8, 1) ����
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN (1,3); -- emp_no�� 8��°���� 1����  1�̳� 3�̸� ������

-- �����, �̸���, ���̵�(@ǥ�� �ձ�����) ��ȸ
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL,1, INSTR(EMAIL,'@')-1)  ���̵�    
FROM EMPLOYEE;

--------------------------------------------------------------------------------------------------
/*
    LPAD / RPAD : ���ڿ��� ��ȸ�� �� ���ϰ��ְ� ��ȸ�ϰ��� �� ��(CHARACTER: ��ȯ��)
    
    LPAD / RPAD('���ڿ�', ���������� ��ȯ�� ������ ����, [�����̰����ϴ� ����])
    ���ڿ��� �����̰����ϴ� ���ڸ� ���� Ȥ�� �����ʿ� ���ٿ��� ���� ���̸�ŭ�� ���ڿ� ��ȯ
*/
-- EMAIL�� 20���̷� ���������ķ� ���(�������� �������� ä���� ���)
SELECT EMP_NAME, LPAD(EMAIL, 20)
FROM EMPLOYEE;

SELECT EMP_NAME, LPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

SELECT EMP_NAME, RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

-- ���, �����, �ֹι�ȣ ���(123456-1****** �� ����)
SELECT EMP_ID, EMP_NAME, RPAD(SUBSTR(EMP_NO,1,8),14,'*')
FROM EMPLOYEE;

SELECT EMP_ID, EMP_NAME, SUBSTR(EMP_NO,1,8) || '******'
FROM EMPLOYEE;

--------------------------------------------------------------------------------------------------
/*
    LTRIM / RTRIM : ���ڿ����� Ư�� ���ڸ� ������ ������ ���� ��ȯ(CHARACTER: ��ȯ��)
    TRIM : ���ڿ��� ��/�� ���ʿ� �ִ� ������ ���ڸ� ������ ������ ���� ��ȯ
    
    [ǥ����]
    LTRIM / RTRIM('���ڿ�', [�����ϰ����ϴ� ���ڿ�])
    TRIM( [LEADING | TRAILING | BOTH]�����ϰ����ϴ� ���ڿ� FROM '���ڿ�')
*/
SELECT LTRIM('     A I   E     ') || '�ֵ��ο���' FROM DUAL;        -- �����ϰ����ϴ� ���ڿ� ������ �⺻�� ����
SELECT LTRIM('JAVAJAVASCRIPTSPRING', 'JAVA') FROM DUAL;
SELECT LTRIM('BCABACBDFGIABC','ABC') FROM DUAL;
SELECT LTRIM('738473KLIK28373','0123456789') FROM DUAL;

SELECT RTRIM('BCABACBDFGIBACABAB','ABC') FROM DUAL;
SELECT RTRIM('738473KLIK28373','0123456789') FROM DUAL;

-- TRIM�� �⺻������ ���ʸ�� ����(�⺻��: ����) ����
SELECT TRIM('     A I   E     ') || '�ֵ��ο���' FROM DUAL;   
SELECT TRIM('A' FROM 'AAABDKD342AAAA') FROM DUAL;

-- LEADING : ���� ���� ����
SELECT TRIM(LEADING 'A' FROM 'AAAAKDJDIAAAA') FROM DUAL;
-- TRAILING : ���� ���� ����
SELECT TRIM(TRAILING 'A' FROM 'AAAAKDJDIAAAA') FROM DUAL;
-- BOTH : �հ� ���� ���� ���� => �⺻��:��������
SELECT TRIM(BOTH 'A' FROM 'AAAAKDJDIAAAA') FROM DUAL;

--------------------------------------------------------------------------------------------------
/*
    LOWER / UPPER / INITCAP : ���ڿ��� �빮�� Ȥ�� �ҹ��� Ȥ�� �ܾ��� �ձ��ڸ� �빮�ڷ� ��ȯ
    
    [ǥ����]
    LOWER / UPPER / INITCAP('�����ڿ�')
*/
SELECT LOWER('Java JavaScript Oracle') FROM DUAL;
SELECT UPPER('Java JavaScript Oracle') FROM DUAL;
SELECT INITCAP('java javascript oracle') FROM DUAL;
--------------------------------------------------------------------------------------------------
/*
    CONCAT : ���ڿ� �ΰ��� �ϳ��� ��ģ ��� ��ȯ
    
    [ǥ����]
    CONCAT('���ڿ�', '���ڿ�')
*/
SELECT CONCAT('oracle','(����Ŭ)') from dual;  --��Ĺ�� �������� ���� �������� �ʰ� �� 2���� �����ϴ�
SELECT 'oracle' || '(����Ŭ)' from dual;

-- SELECT CONCAT('oracle','(����Ŭ)','02-313-0470') from dual;    �μ��� 2���� ����
SELECT 'oracle' || '(����Ŭ)' || ' 02-313-0470' from dual;
--------------------------------------------------------------------------------------------------
/*
    REPLACE : �������ڿ��� ���ο� ���ڿ��� �ٲ�
    
    [ǥ����]
    REPLACE('���ڿ�', '�������ڿ�', '�ٲܹ��ڿ�')
*/
SELECT EMP_NAME, EMAIL, REPLACE(EMAIL, 'kh.or.kr', 'aie.or.kr')
FROM EMPLOYEE;

--===================================================================================
--                            <���� ó�� �Լ�>
--===================================================================================

/*
    ABS : ���밪�� ���ϴ� �Լ�
    
    [ǥ����]
    ABS(NUMBER)
*/
SELECT ABS(-10) FROM DUAL;
SELECT ABS(-3.1415) FROM DUAL;

--------------------------------------------------------------------------------------------------
/*
    MOD : �� ���� ���� �������� ��ȯ
    
    [ǥ����]
    MOD(NUMBER, NUMBER)
*/
SELECT MOD(10, 3) FROM DUAL;
SELECT MOD(10.9, 2) FROM DUAL;      -- �� ������� ����

--------------------------------------------------------------------------------------------------
/*
    ROUND : �ݿø��� ��� ��ȯ
    
    [ǥ����]
    ROUND(NUMBER, [��ġ])
*/
SELECT ROUND(1234.56) FROM DUAL;    -- ��ġ ������ 0
SELECT ROUND(12.34) FROM DUAL;
SELECT ROUND(1234.5678, 2) FROM DUAL;
SELECT ROUND(1234.56, 4) FROM DUAL;
SELECT ROUND(1234.56, -2) FROM DUAL;

--------------------------------------------------------------------------------------------------
/*
    CEIL : �ø��� ��� ��ȯ
    
    [ǥ����]
    CEIL(NUMBER)
*/
SELECT CEIL(123.456) FROM DUAL;
SELECT CEIL(-123.456) FROM DUAL;
--------------------------------------------------------------------------------------------------
/*
    FLOOR : ������ ��� ��ȯ
    
    [ǥ����]
    FLOOR(NUMBER)
*/
SELECT FLOOR(123.456) FROM DUAL;
SELECT FLOOR(-123.456) FROM DUAL;
--------------------------------------------------------------------------------------------------
/*
    TRUNC : ��ġ ���� ������ ����ó�� �Լ�
    
    [ǥ����]
    TRUNC(NUMBER, [��ġ])
*/
SELECT TRUNC(123.78) FROM DUAL;
SELECT TRUNC(123.7867, 2) FROM DUAL;
SELECT TRUNC(123.7867, -2) FROM DUAL;

SELECT TRUNC(-123.78) FROM DUAL;
SELECT TRUNC(-123.78, -2) FROM DUAL;

--===================================================================================
--                                                            <��¥ ó�� �Լ�>
--===================================================================================
/*
    SYSDATE : �ý��� ��¥�� �ð� ��ȯ
*/
SELECT SYSDATE FROM DUAL;

--------------------------------------------------------------------------------------------------
/*
    MONTHS_BETWEEN(DATE1, DATE2) : �� ��¥ ������ ���� �� ��ȯ
*/
SELECT EMP_NAME, HIRE_DATE, SYSDATE-HIRE_DATE �ٹ��ϼ�
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, CEIL(SYSDATE-HIRE_DATE) �ٹ��ϼ�
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) �ٹ�������
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) �ٹ�������
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) || ' ������' �ٹ�������
FROM EMPLOYEE;

SELECT EMP_NAME, HIRE_DATE, CONCAT(CEIL(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)), '������') �ٹ�������
FROM EMPLOYEE;

--------------------------------------------------------------------------------------------------
/*
    ADD_MONTHS(DATE, NUMBER) : Ư����¥�� �ش� ���ڸ�ŭ�� �������� ���� �� ��¥ ��ȯ
*/
SELECT ADD_MONTHS(SYSDATE, 1) FROM DUAL;

-- �����, �Ի���, �Ի��� �������� ��¥(6���� ��) ��ȸ
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 6) "�������� ��¥"
FROM EMPLOYEE;

--------------------------------------------------------------------------------------------------
/*
    NEXT_DAY(DATE, ����(����|����)) : Ư�� ��¥ ���Ŀ� ����� �ش� ������ ��¥�� ��ȯ
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������') FROM DUAL;
SELECT SYSDATE, NEXT_DAY(SYSDATE, '��') FROM DUAL;

-- 1:�Ͽ���
SELECT SYSDATE, NEXT_DAY(SYSDATE, 2) FROM DUAL;

-- SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MONDAY') FROM DUAL;  -- ���� ����� KOREA�̱� ����

-- ����
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'MONDAY') FROM DUAL;

ALTER SESSION SET NLS_LANGUAGE = KOREAN;
--------------------------------------------------------------------------------------------------
/*
    LAST_DAY(DATE) : �ش� ���� ������ ��¥ ��ȯ
*/
SELECT LAST_DAY(SYSDATE) FROM DUAL;

-- �����, �Ի���, �Ի��� ���� ������ ��¥ ��ȸ
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE)
FROM EMPLOYEE;

-- �����, �Ի���, �Ի��� ���� ������ ��¥, �Ի��� ���� �ٹ��ϼ� ��ȸ
SELECT EMP_NAME, HIRE_DATE, LAST_DAY(HIRE_DATE), LAST_DAY(HIRE_DATE)-HIRE_DATE+1
FROM EMPLOYEE;
--------------------------------------------------------------------------------------------------
/*
    EXTRACT : Ư�� ��¥�� ���� ��|��|�� ���� �����Ͽ� ��ȯ�ϴ� �Լ�(NUMBER: ��ȯ��)
    
    [ǥ����]
    EXTRACT(YEAR FROM DATE) : �⵵�� ����
    EXTRACT(MONTH FROM DATE) : ���� ����
    EXTRACT(DAY FROM DATE) : �ϸ� ����
*/
-- �����, �Ի�⵵, �Ի��, �Ի��� ��ȸ
SELECT EMP_NAME,
              EXTRACT(YEAR FROM HIRE_DATE) �Ի�⵵,
              EXTRACT(MONTH FROM HIRE_DATE) �Ի��,
              EXTRACT(DAY FROM HIRE_DATE) �Ի���
FROM EMPLOYEE
ORDER BY �Ի�⵵, �Ի��, �Ի���;

--===================================================================================
--                                                            <����ȯ �Լ�>
--===================================================================================
/*
    TO_CHAR : ���� �Ǵ� ��¥�� ���� ����Ÿ������ ��ȯ
    
    [ǥ����]
    TO_CHAR(����|��¥, [����])
        - ���� : ��ȯ ����� Ư�� ���Ŀ� �°� ����ϵ��� ��
*/

---------------------------------------- ���� => ���� --------------------------------------------
/*
    9 : �ش� �ڸ��� ���ڸ� �ǹ�
        - ���� ���� ��� �Ҽ��� �̻��� ����, �Ҽ��� ���ϴ� 0���� ǥ��
    0 : �ش� �ڸ��� ���ڸ� �ǹ�
       - ���� ���� ��� 0ǥ��, ������ ���̸� ���������� ǥ���� �� �ַ� ���
    FM : �ش� �ڸ��� ���� ���� ��� �ڸ��������� ���� (9,0 �ִ°��� ����)       
*/
SELECT TO_CHAR(1234) FROM DUAL;
SELECT TO_CHAR(1234, '999999')  FROM DUAL;  -- 6�ڸ����� ����, ��������, ��ĭ����
SELECT TO_CHAR(1234, '000000')  FROM DUAL;  -- 6�ڸ����� ����, ��������, ��ĭ�� 0���� ä��

SELECT TO_CHAR(1234, 'L99999') �ڸ� FROM DUAL;  -- L(LOCAL) ���� ������ ������ ȭ�����(��ĭ����)

SELECT TO_CHAR(123412, 'L999,999,999') �ڸ� FROM DUAL;

-- ���, �̸�, �޿�(\1,111,111), ����(\123,234,234) ��ȸ
SELECT EMP_ID, EMP_NAME, TO_CHAR(SALARY, 'L99,999,999') �޿�, TO_CHAR(SALARY*12, 'L999,999,999') ����
FROM EMPLOYEE;

-- FM
SELECT TO_CHAR(123.456, 'FM99990.999'),
              TO_CHAR(1234.56, 'FM9990.99'),
              TO_CHAR(0.1000, 'FM9990.999'),
              TO_CHAR(0.1000, 'FM9990.00'),
              TO_CHAR(0.1000, 'FM9999.999')
    FROM DUAL;
    
SELECT TO_CHAR(123.456, '99990.999'),
              TO_CHAR(1234.56, '9990.99'),
              TO_CHAR(0.1000, '9990.999'),
              TO_CHAR(0.1000, '9990.00'),
              TO_CHAR(0.1000, '9999.999')
    FROM DUAL;

---------------------------------------- ��¥ => ���� --------------------------------------------
-- �ð�
SELECT TO_CHAR(SYSDATE, 'AM') "�ѱ���¥",
              TO_CHAR(SYSDATE, 'PM', 'nls_date_language=american') "�̱���¥"
    FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS') FROM DUAL;  -- 12�ð� ����
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') FROM DUAL;

-- ��¥
ALTER SESSION SET NLS_LANGUAGE = KOREAN;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON, YYYY') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY"�� "MM"�� " DD"�� " DAY') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DL') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YY-MM-DD') FROM DUAL;

-- �����, �Ի���(23-02-02), �Ի���(2023�� 2�� 2�� �ݿ���) ��ȸ

SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YY-MM-DD') �Ի���, TO_CHAR(HIRE_DATE, 'DL') �Ի�����
FROM EMPLOYEE;

SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YY-MM-DD') �Ի���, TO_CHAR(HIRE_DATE, 'YYYY"�� "MM"�� " DD"�� " DAY') �Ի�����
FROM EMPLOYEE;

-- �⵵
SELECT TO_CHAR(SYSDATE, 'YYYY'),
             TO_CHAR(SYSDATE, 'YY'),
             TO_CHAR(SYSDATE, 'RRRR'),
             TO_CHAR(SYSDATE, 'YEAR')       -- ��������
  FROM DUAL; 
  
 -- ��
 SELECT TO_CHAR(SYSDATE, 'MM'),
              TO_CHAR(SYSDATE, 'MON'),
              TO_CHAR(SYSDATE, 'MONTH'),
              TO_CHAR(SYSDATE, 'RM')        -- �θ���ȣ
    FROM DUAL;

-- ��
SELECT TO_CHAR(SYSDATE, 'DD'),      -- �� �������� ����°
              TO_CHAR(SYSDATE, 'DDD'),   -- �� �������� ����°
              TO_CHAR(SYSDATE, 'D')        -- �� ����(�Ͽ���)���� ����°
FROM DUAL;

-- ���Ͽ� ���� ����
SELECT TO_CHAR(SYSDATE, 'DAY'),
             TO_CHAR(SYSDATE, 'DY')
FROM DUAL;             
--------------------------------------------------------------------------------------------------
/*
    TO_DATE : ���� �Ǵ� ���� Ÿ���� ��¥Ÿ������ ��ȯ
    
    [ǥ����]
    TO_DATE(����|����, [����])
*/
SELECT TO_DATE(20231110) FROM DUAL;
SELECT TO_DATE(231110) FROM DUAL;

-- SELECT TO_DATE(011110) FROM DUAL;  ���� ���·� ������ ���� 0�϶� ����
SELECT TO_DATE('011110') FROM DUAL;

SELECT TO_DATE('070407 020830', 'YYMMDD HHMISS') FROM DUAL; -- ����ϸ� ���
SELECT TO_CHAR(TO_DATE('070407 020830', 'YYMMDD HHMISS'), 'YY-MM-DD HH:MI:SS') FROM DUAL;

/*
    YY : ������ �տ� '20'�� �ٴ´�
    RR : 50���� �������� 50���� ������ �տ� '20' ���̰�, 50���� ũ�� �տ� '19'�� ���δ�
*/
SELECT TO_DATE('041110','YYMMDD'), TO_DATE('981110','YYMMDD') FROM DUAL; 
SELECT TO_DATE('041110','RRMMDD'), TO_DATE('981110','RRMMDD') FROM DUAL;  

--------------------------------------------------------------------------------------------------
/*
    TO_NUMBER : ���� Ÿ���� ���� Ÿ������ ��ȯ
    
    TO_NUMBER(����, [����])
*/
SELECT TO_NUMBER('0212341234') FROM DUAL;
SELECT '1000' + '5500' FROM DUAL;  -- ������ ���� �ڵ����� ���ڷ� ����ȯ
SELECT TO_NUMBER('1,000', '9,999,999') + TO_NUMBER('1,000,000', '9,999,999') FROM DUAL;

--==============================================================================
--                            <NULL ó�� �Լ�>
--==============================================================================

/*
    NVL(�÷�, �ش��÷��� NULL�� ��� ��ȯ�� ��)
*/
SELECT EMP_NAME , NVL(BONUS, 0)
FROM EMPLOYEE;

--����� , ���ʽ� ���� ���� ��ȸ*
SELECT EMP_NAME, (SALARY* BONUS + SALARY) * 12
--SELECT EMP_NAME, (SALARY*(1+BONUS)) *12
FROM EMPLOYEE;

SELECT EMP_NAME,SALARY*(1+NVL(BONUS,0)) * 12
FROM EMPLOYEE;

SELECT EMP_NAME, NVL(DEPT_CODE, '�μ� ����')
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    NVL2(�÷�, ��ȯ�� 1, ��ȯ�� 2)
    -�÷����� ������ ��� ��ȯ���� 1
    -�÷����� NULL�� ��� ��ȯ���� 2
    
*/
--���ʽ��� �޴� ����� 50%�� �������� , ���ʽ��� ���� �ʴ� ����� 10%�� �������� ��ȸ
SELECT EMP_NAME,SALARY,  BONUS, SALARY*NVL2(BONUS,0.5,0.1)
FROM EMPLOYEE;
--------------------------------------------------------------------------------
SELECT EMP_NAME, NVL2(DEPT_CODE, '�μ� ����','�μ� ����') �μ�����
FROM EMPLOYEE;

---------------------------------------------------------------------------------
/*
 NULLIF(�񱳴��1, �񱳴��2)
 - �ΰ��� ���� ��ġ�ϸ� NULL��ȯ
 - �ΰ��� ���� ��ġ���� ������ �����1�� ��ȯ(���� ���� EX/ '1234', '4567' �̸� '1234'�� ��ȯ
 */
 SELECT NULLIF('1234','1234')FROM DUAL;
 SELECT NULLIF('1234','5678')FROM DUAL;
 --==============================================================================
 --                          < �����Լ�>
 --=============================================================================
 /*
  DECODE(���ϰ��� �ϴ� ���(�÷�|�������|�Լ���), �񱳰�1, �����1, �񱳰�2, �����2,...)
  
  SWITCH (�񱳴��){
  CASE �񱳰� 1:
  ����� 1;
  CASE �񱳰� 2:
  ����� 2;
  DEFAULT:--
  �����3;
  ...
*/
--����� , ����
SELECT EMP_NAME,DECODE (SUBSTR(EMP_NO ,8,1), '1', '����', '2','����','ȥ��')����
FROM EMPLOYEE;

--������ �޿��� ���޺��� �λ��ؼ� ��ȸ
--J7 �̸� �޿��� 10% �λ�
--J6 �̸� �޿��� 15% �λ�
--J5 �̸� �޿��� 20% �λ�
--�׿� �̸� �޿��� 5% �λ�
--�����, �����ڵ�, ���� �޿�, �λ�� �޿�

SELECT EMP_NAME,JOB_CODE,SALARY,
--  DECODE(JOB_CODE, 'J7', SALARY * 1.10, <= �̰� �� ���ƺ���
       DECODE(SUBSTR(JOB_CODE,2,1), '7', SALARY * 1.10,
       '6', SALARY * 1.15,
       '5', SALARY * 1.20,  
        SALARY * 1.05)

FROM EMPLOYEE;

--------------------------------------------------------------------------------
SELECT  EMP_NAME, RPAD(SUBSTR(EMP_NO,1,8),14,'*')
FROM EMPLOYEE;

SELECT EMP_NAME, FLOOR(ABS(HIRE_DATE-SYSDATE)) �ٹ��ϼ�1, 
       FLOOR(ABS(SYSDATE-HIRE_DATE)) �ٹ��ϼ�2
FROM EMPLOYEE;

SELECT EMP_NAME
     , DEPT_CODE
     , SUBSTR(EMP_NO,1,2)||'��'||SUBSTR(EMP_NO,3,2)||'��'||SUBSTR(EMP_NO,5,2)||'��' �������
     , EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE (SUBSTR(EMP_NO,1,2),'RRRR'))
FROM EMPLOYEE;
---------------------------------------------------------------------------------

/*
CASE WHEN ���ǽ�1 THEN �����1
    WHEN ���ǽ�2 THEN �����2
    ...
    ELSE �����N
END
*/
--�����, �޿�, �޿��� 5�鸸�� �̻��̸� '���', 350���� �̻��̸� '�߱�', ��������'�ʱ�'
SELECT EMP_NAME, SALARY
      ,CASE WHEN SALARY >= 5000000 THEN '���'
            WHEN SALARY >= 3500000 THEN '�߱�'
            ELSE '�ʱ�'
       END �޼�
FROM EMPLOYEE;
--==============================================================================
--                             <�׷� �Լ�>
--==========================================================================
/*
    SUM(����Ÿ���� �÷�):�ش� �÷������� �հ踦 ���ؼ� ��ȯ
*/
-- �� ����� �� �޿��� ��ȸ
SELECT SUM(SALARY)"�� �޿���"
FROM EMPLOYEE;
-- ���� ����� �� �޿��� ��ȸ
SELECT SUM(SALARY) " ���ڻ���� �� �޿���"
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) IN('1','3');

--�μ��ڵ尡 'D5'�� ����� �� �޿��� ��ȸ
SELECT SUM(SALARY) "D5��� �� �޿���"
FROM EMPLOYEE
WHERE DEPT_CODE= 'D5';

-- �μ��ڵ尡'D5'�� ����� ������ �� �հ�� ��ȸ
SELECT SUM(SALARY*NVL(BONUS,0)+SALARY*12)
FROM EMPLOYEE
WHERE DEPT_CODE= 'D5';

-- �� ����� �� �޿��� ��ȸ
SELECT TO_CHAR(SUM(SALARY),'L999,999,999')"�� �޿���"
FROM EMPLOYEE;

/*
    AVG(����Ÿ���÷�): �ش� �÷� ������ ����� ��ȯ
*/
SELECT AVG(SALARY)"��� �޿���"
FROM EMPLOYEE;

SELECT ROUND(AVG(SALARY))"��� �޿���"
FROM EMPLOYEE;

SELECT ROUND(AVG(SALARY),2)"��� �޿���"
FROM EMPLOYEE;

------------------------------------------------------------------------------
/*
 MIN(��� Ÿ���÷�): �ش� �÷����� �߿� ���� ���� �� ��ȯ
 MAX(��� Ÿ���÷�): �ش� �÷��� �� �߿� ���� ū �� ��ȯ
*/
--���������� �̸��� ���� ������, �޿��� ���� ���� �޴� ��, �Ի����� ���� ���� �Ի��� ��¥
SELECT MIN(EMP_NAME), MIN(SALARY),MIN(HIRE_DATE) -- ������ �Լ���,�׷��Լ��� �Բ� �� �� ����
FROM EMPLOYEE;
--���������� �̸��� ���� ū��, �޿��� ���� ũ�� �޴� ��, �Ի����� ���� ���߿� �Ի��� ��¥
SELECT MAX(EMP_NAME), MAX(SALARY),MAX(HIRE_DATE) -- ������ �Լ���,�׷��Լ��� �Բ� �� �� ����
FROM EMPLOYEE;
--------------------------------------------------------------------------------
/*
    COUNT(*|�÷�|DISTINCT �÷�) : ���� ���� ��ȯ
    
    COUNT(*) : ��ȸ�� ����� ��� ���� ���� ��ȯ
    COUNT(�÷�) : ������ �÷��� NULL���� ������ ���� ���� ��ȯ
    COUNT(DISTINCT �÷�) : �ش� �÷��� �ߺ��� ������ ���� ���� ���� ��ȯ
*/
--��ü ��� �� ��ȸ
SELECT COUNT(*)
FROM EMPLOYEE;

--���� ��� �� ��ȸ
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1)IN('2','4');

--���ʽ��� �޴� ��� �� ��ȸ
SELECT COUNT(BONUS)
FROM EMPLOYEE;

--�μ� ��ġ�� ���� ����� ��
SELECT COUNT (DEPT_CODE)
FROM EMPLOYEE;

--���� ������� �� ��� �μ��� ��ġ�Ǿ�����
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;