--���̺� �÷��� ���� ��ȸ
/*
(')Ȧ����ǥ: ���ڿ��� ��
(")�ֵ���ǥ: �÷����� ��
*/
    <select>
    ������ ��ȸ�� �� ����ϴ� ����
    >>RESULT SET : SELECT ���� ���� ��ȸ�� �����(��ȸ�� ����� ����)
    [ǥ����]
    SELECT ��ȸ�Ϸ��� �÷���, ��ȸ�Ϸ��� �÷���,///
    FROM ���̺��
    */
    SELECT*
    FROM EMPLOYEE;
    
    SELECT*
    FROM DEPARTMENT;
    --EMPLOYEE ���̺��� ���,�̸�,��ȭ��ȣ�� ��ȸ
    SELECT EMP_ID,EMP_NAME,PHONE
    FROM EMPLOYEE;
    --1. JOB���̺� ���޸� ��ȸ
    SELECT JOB_NAME
    FROM JOB;
    --2. DEPARTMENT ���̺� ��� �÷� ��ȸ
    SELECT*
    FROM DEPARTMENT;
    --3. DEPARTMENT ���̺��� �μ��ڵ� �μ��� ��ȸ
    SELECT DEPT_ID,DEPT_TITLE
    FROM DEPARTMENT;
    --4. EMPLOYEE ���̺� �����, �̸��� , ��ȭ��ȣ, �Ի���, �޿� ��ȸ
    SELECT EMP_NAME,EMAIL,PHONE,HIRE_DATE,SALARY
    FROM EMPLOYEE;
    /*
    <�÷� ���� ���� �������>
    SELECT�� �÷��� �ۼ� �κп� ������� ��� ����(�̶� �������� ��� ��ȸ)
    */
    --EMPLOYEE���� �����, ����� ����(�޿�*12) ��ȸ
    SELECT EMP_NAME, SALARY*12
    FROM EMPLOYEE;  
    --EMPLOYEE���� �����,�޿�,���ʽ�
    SELECT EMP_NAME,SALARY,BONUS
    FROM EMPLOYEE;
    --EMPLOYEE���� �����,�޿�,���ʽ�,����,���ʽ��� ������ ����((���ʽ�*�޿�))
    SELECT EMP_NAME �����,SALARY AS �޿�,BONUS "���ʽ�",
    SALARY*12 "����(��)",(SALARY+BONUS*SALARY)*12"�� �ҵ�"
    --()�� ���� Ư�� ��ȣ�� ���� �ݵ�� ("")�� �ٿ��ش�.
    FROM EMPLOYEE;
    --������� �� NULL�� �����ϸ� ����� ������ NULL�� ��. ���� ó��(���߿�)
    
    --EMPLOYEE���� �����, �Ի���, �ٹ��ϼ�(���� ��¥ - �Ի���)
    --DATE�� ������ ���� ���� : ������� �� ����
    --* ���� ��¥ : SYSDAYE
    SELECT EMP_NAME,HIRE_DATE,SYSDATE-HIRE_DATE
    FROM EMPLOYEE;
    --�Լ� ������ DETE ��¥ó���ϸ� �ʴ����� ������ �� ����
    ----------------------------------------------------------------
    /*
    <�÷��� ��Ī �����ϱ�>
    �������� �÷����� ����� �� ���� �״�� �÷����� ��. �̶� ������ �ο��ϸ� ����ϰ� ó��
    [ǥ����]
    �÷��� ��Ī/ �÷��� AS ��Ī/ �÷��� "��Ī"/�÷��� AS "��Ī"
    
    ��Ī�� ���⳪ Ư������ ���ԵǸ� �ݵ��("")�ֵ���ǥ�� �־���� �Ѵ�
    */
    SELECT EMP_NAME �̸�,HIRE_DATE "�Ի� ��¥",SYSDATE-HIRE_DATE AS "�ٹ� �� ��"
    FROM EMPLOYEE;
    ----------------------------------------------------------------
/*
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�(')
    
    SELECT���� ���ͷ��� �����ϸ� ��ġ ���̺�� �����ϴ� ������ ó�� ��ȸ ����
    ��ȸ�� RESULT SET�� ��� �࿡ �ݺ������� ���
*/
-- EMPLOYEE�� ���,�����,�޿�(��) ��ȸ
    SELECT EMP_ID, EMP_NAME, SALARY, '��' AS "����"
    FROM EMPLOYEE;
     SELECT EMP_ID, EMP_NAME,'��' AS "����", SALARY
    FROM EMPLOYEE;
    
------------------------------------------------------------------
/*
    <���� ������: ||>
    ���� Į�������� ��ġ �ϳ��� �÷����ΰ� ó�� �����ϰų�, �÷����� ���ͷ��� ������ �� ����
*/
    --EMPLOYEE�� ���, �����, �޿��� �ϳ��� �÷����� ��ȸ
    --EMPLOYEE�� ���, �����, �޿��� �ϳ��� �÷����� ��ȸ
    SELECT EMP_ID || EMP_NAME ||SALARY
    FROM EMPLOYEE;
    
    SELECT EMP_ID, EMP_NAME, SALARY ||'��'
    FROM EMPLOYEE;

    --ȫ�浿�� ������ 900000�� �Դϴ�.
    SELECT EMP_NAME||'�� ������ ' || SALARY||'�� �Դϴ�'
        -- EMPLOYEE�� �ִ� �̸����� ||(���� ������) '�� ������'(���ڿ��� '���) 
    FROM EMPLOYEE;
    -- ȫ�浿�� ��ȭ��ȣ�� PHONE�̰� �̸����� EMAIL �Դϴ�.
    SELECT EMP_NAME||'�� ��ȭ��ȣ�� +'||PHONE||' �̰� �̸����� '|| EMAIL||' �Դϴ�.'
    FROM EMPLOYEE;
    --------------------------------------------------------------
    /*
    <DISTINICT>
    �÷��� �ߺ��� ������ �ѹ����� ǥ���ϰ��� �� ��
    */
    SELECT JOB_CODE
    FROM EMPLOYEE;
    
    --EMPLOYEE ���� ���� �ڵ� �ߺ������Ͽ� ��ȸ
    SELECT DISTINCT JOB_CODE
    FROM EMPLOYEE;
    
    --EMPLOYEE���� �μ��ڵ� �ߺ������Ͽ� ��ȸ
    SELECT DEPT_CODE
    FROM EMPLOYEE;
    
    --���� ���� / SELECT������ DISTNICT�� �ѹ��� ����� �� ����.
    --SELECT DISTINCT DEPT_DOE, DISTINCT JOB_CODE ����
    
    --DEPT_CODE,JOB_CODE 2���� �������� ��������� �� �ߺ�����
    SELECT DISTINCT DEPT_CODE,JOB_CODE
    FROM EMPLOYEE;

--------------------------------------------------------------------------------
/*
 <WHERE>
 ��ȸ�ϰ��� �ϴ�  ���̺��� Ư�� ���ǿ� �����ϴ� �����͸� ��ȸ�� ��
 WHERE���� ���ǽ��� ����
 
 [ǥ����}
 SELECT �÷�,    �÷�    ,    �������    ,    .....
 FROM ���̺��
 WHERE ���ǽ�;
 >> �� ������
 >, <  , >=  , <=      ��Һ�
 =                     ������ ��
 !=, ^=,<>             ���������� ��
*/
--EMPLOYEE���� �μ��ڵ尡 'D9'�� ������� ��� �÷� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

--EMPLOYEE���� �μ��ڵ尡 'D1'�� �ƴ� ������� ���, �����, �μ��ڵ带 ��ȸ
SELECT EMP_ID, EMP_NAME,DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE<>'D1'; -- !=,<>, ^=

-- EMPLOYEE���� �޿��� 400���� �̻��� ������� �����, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 4000000;

--EMPLOYEE���� �������� ����� ���,�����,�Ի��� ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN='N';

--��������--
SELECT EMP_ID, SALARY, HIRE_DATE, SALARY*12
FROM EMPLOYEE
WHERE SALARY >= 3000000;

SELECT EMP_ID, SALARY, SALARY*12, DEPT_CODE
FROM EMPLOYEE
WHERE SALARY*12 >= 50000000;

SELECT EMP_ID, EMP_NAME,JOB_CODE,END_DATE
FROM EMPLOYEE
WHERE JOB_CODE <> 'J3';

--------------------------------------------------------------------------------
/*
    >>�� ������
    �������� ������ ��� �����ϰ��� �� ��
    
    AND(~�̸鼭, �׸���)
    OR(~�̰ų�, �Ǵ�)
    NOT(����):�÷��� �� �Ǵ� BETWEEN�տ� ����
*/
--�μ��ڵ尡 'D9'�̸鼭 �޿��� 500���� �̻��� ������� �����,�μ��ڵ�,�޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9' AND SALARY >=5000000;

--�μ��ڵ尡 'D6'�̰ų� �޿��� 3000000���� �̻��� ������� �����, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >=3000000;
--�޿��� 350���� �̻� 600���� ������ ����� ��� ,����� ,�޿� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY >=3500000 AND SALARY <=6000000;
--------------------------------------------------------------------------------
/*
 >>BETWEEN AND
 ~�̻� ~������ ������ ������ ������ ��
 [ǥ����]
 �񱳴���÷� BETWEEN ���Ѱ� AND ���Ѱ�
 ->�ش� �÷����� ���Ѱ��̻��̰� ���Ѱ� ������ ���
 */
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 6000000;

SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
WHERE NOT SALARY BETWEEN 3500000 AND 6000000;

--�Ի����� 90/01/01 ~01/01/01
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE HIRE_DATE BETWEEN '90/01/01' AND '01/01/01';
--------------------------------------------------------------------------------
/*
>>LIKE
���ϰ��� �ϴ� �÷����� ���� ������ Ư�� ���Ͽ� �����ϴ� ��� ��ȸ

[ǥ����]
�񱳴���÷� LIKE 'Ư������'
:Ư������ ���ý� '%''_' ���ϵ� ī��� ����� �� ����

%:0���� �̻�
EX) �񱳴�� �÷� '����%' =>�񱳴�� �÷�����'����'�� ���۵Ǵ� �͵��� ��ȸ
    �񱳴�� �÷� LIT '%����' =>   �񱳴�� �÷����� '����'�� ������ �͵��� ��ȸ
     �񱳴�� �÷� LIT '%����%'
*/

--����� �� ����' ��'���� ������� ���, ����� ��ȸ
SELECT EMP_ID ,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'��%';

--����� �̸��� '��'�� ���Ե� ��� ������� ���, ����� ��ȸ
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'%��%';

--����� �� �ι�° �̸���' ��'���� ������� ���, ����� ��ȸ
SELECT EMP_ID ,EMP_NAME
FROM EMPLOYEE
WHERE EMP_NAME LIKE'_��_';

--��ȭ��ȣ �� 3��° ���ڰ� '1'�� ����� ��� ,����� ,��ȭ��ȣ ��ȸ

SELECT EMP_ID, EMP_NAME,PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '__1%';

--�̸��� �� _�տ� ���ڰ� 3������ ������� ���, �����, �̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '____%';
/*
���ϵ� ī��� �ν��� ��
- �����Ϳ� ���ϵ� ī�带 ��������� ��
    :������ ������ ����ϰ��� �ϴ� �� �տ� ������ ���ϵ� ī��(�ƹ��ų� ����, ���� , Ư������)��
    �����ϰ� ������ ���ϵ� ��ī�带 ESCAPE�� ����ؾ���
*/
SELECT EMP_ID, EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___$_%' ESCAPE '$';

--�̸��� �� _�տ� ���ڰ� 3������ ������� ������ ������� ���,�����,�̸��� ��ȸ
SELECT EMP_ID,EMP_NAME,EMAIL
FROM EMPLOYEE
WHERE NOT EMAIL NOT LIKE'___e_%' ESCAPE'e';

SELECT EMP_ID,EMP_NAME,HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';

SELECT EMP_NAME , PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%'AND SALARY >= 2500000;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '�ؿܿ���%';

/*
>>IS NULL/ IS NOT NULL
�÷����� NULL�� �ִ� ��� NULL�� �񱳿� ���Ǵ� ������
*/
--���ʽ��� ���� �ʴ� ����� ���, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
--WHERE BONUS = NULL; ��ȸ �ȵ�
WHERE BONUS IS NULL;

--���ʽ��� �޴� ����� ���, �����, �޿�, ���ʽ� ��ȸ
SELECT EMP_ID, EMP_NAME, SALARY, BONUS
FROM EMPLOYEE
WHERE BONUS IS NOT NULL;
--WHERE NOT BONUS IS NULL; ��� ����

--����� ���� ������� ��� ,�����, �����ȣ ��ȸ
SELECT EMP_ID, EMP_NAME, MANAGER_ID
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL;

--�μ���ġ�� ���� �ʾ����� ���ʽ��� �޴� ������� ��� ��, ���ʽ�, �μ��ڵ� ��ȸ
SELECT EMP_NAME, BONUS, DEPT_CODE
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
-------------------------------------------------------------------------------

/*
    >>IN/NOT IN
    IN : Į������ ���� ������ ����߿� ��ġ�ϴ� ���� �ִ°͸� ��ȸ
    NOT IN: �÷����� ���� ������ ����߿� ��ġ�ϴ� ���� ������ �������� ��ȸ
    
    [ǥ����]
    �񱳴�� �÷� IN('��1','��2','��3','��4......)
    
*/
--�μ��ڵ尡 D5,D6,D8 �� ����� �����,�μ��ڵ�,�޿���ȸ
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
--WHERE DEPT_CODE = 'D5' OR DEPT_CODE = 'D6' OR DEPT_CODE = 'D8';
WHERE DEPT_CODE  IN('D5','D6','D8');

--�μ��ڵ尡 D5,D6,D8�� �ƴ� ����� �����,�μ��ڵ�,�޿���ȸ
SELECT EMP_NAME, DEPT_CODE,SALARY
FROM EMPLOYEE
WHERE DEPT_CODE NOT IN('D5','D6','D8');
-------------------------------------------------------------------------------
/*
    �������� �켱����/
    1. ()
    2. ��� ������
    3. ���� ������
    4. �� ������
    5. IS NULL/ LIKE '����'/ IN
    6. BETWEEN
    7. NOT(�� ������)
    8. AND(�� ������)
    9. OR(�� ������)
*/
-- ���� �ڵ尡 J7�̰ų� J2�� ����� �� �޿��� 200���� �̻��� ������� ��� �÷� ��ȸ
SELECT EMP_NAME,JOB_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN('J7','J2') AND SALARY >=2000000;

SELECT EMP_NAME, MANAGER_ID,DEPT_CODE
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;

SELECT EMP_ID, EMP_NAME,BONUS,SALARY*12 ����
FROM EMPLOYEE
WHERE SALARY*12 >= 30000000 AND BONUS IS NULL;

SELECT EMP_ID,EMP_NAME,HIRE_DATE, DEPT_CODE
FROM EMPLOYEE
WHERE HIRE_DATE >='95/01/01' AND DEPT_CODE IS NOT NULL;

SELECT EMP_ID,EMP_NAME,SALARY,HIRE_DATE, BONUS
    FROM EMPLOYEE
WHERE SALARY BETWEEN 2000000 AND  5000000 
    AND HIRE_DATE >='01/01/01' 
    AND BONUS IS NULL;

SELECT EMP_ID, EMP_NAME, SALARY
    FROM EMPLOYEE
WHERE SALARY*(1+BONUS)*12 IS NOT NULL 
    AND EMP_NAME LIKE '%��%';
-------------------------------------------------------------------------------
/*
 <ORDER BY ��>
 - ����
 - SELECT�� ���� ������ �ٿ� �ۼ�, ���� �������� �� �������� ����
 [ǥ����]
 SELECT �÷�, �÷�, .....
 FROM ���̺� ��
 WHERE ���ǽ�
 ORDER BY ���ı����� �Ǵ� �÷��� | ��Ī | �÷����� [ ASC | DESC]|[NULLS FIRST |
          NULLS LAST]
          
*ASC : �������� ���� ( ������ �⺻�� )
*DESC : �������� ����
*NULLS FIRST : �����ϰ��� �ϴ� �÷����� NULL�� �ִ� ��� �ش� �����͸� �� �տ� ��ġ(������ DESC�϶��� �⺻��)
&NULLS LAST : �����ϰ��� �ϴ� �÷����� NULL�� �ִ� ��� �ش� �����͸� �� �ڿ� ��ġ(������ ASC�϶��� �⺻��)
*/

--���ʽ��� ����
SELECT EMP_NAME, BONUS, SALARY
FROM EMPLOYEE
-- ORDER BY BONUS; �������� �⺻�� NULL�� ���� ��
--ORDER BY BONUS ASC;
--ORDER BY BONUS NULLS FIRST;
--ORDER BY BONUS DESC; --���������� �ݵ�� DESC ��� , NULL�� �� �տ� ��
ORDER BY BONUS DESC, SALARY ; --���� ������ ����

--�� ����� �����, ������ȸ ( ������ �������� ���� ��ȸ)
SELECT EMP_NAME, SALARY *12 ����
FROM EMPLOYEE
ORDER BY SALARY ;

