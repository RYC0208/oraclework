/*
    <DCL : DATA CONTROL LANGUAGE>
    ������ �����
    �������� �ý��۱��� �Ǵ� ��ü�� ���ٱ��� �ο�(GRANT)�ϰų� ȸ��(REVOKE)�ϴ� ����
    
    > �ý��� ���� : DB�� �����ϴ� ����, ��ü���� ������ �� �ִ� ����
    > ��ü���� ���� : Ư�� ��ü���� ������ �� �ִ� ����
*/
----------------------------------------------------------------------------------------
/*
    1. �ý��� ������ ����
       - CREATE SESSION : ������ �� �ִ� ����
       - CREATE TABLE : ���̺��� ������ �� �ִ� ����
       - CREATE VIEW : �並 ������ �� �ִ� ����
       - CREATE SEQUENCE : ������ ������ �� �ִ� ����
       ....
*/
-- 1.1 SAMPLE / sample �輺 ����
ALTER SESSION set "_oracle_script" = true;
create user sample identified by sample;
-- ���ӱ����� ���� ���Ӹ���

-- 1.2 ������ ���� CREATE SESSION ���Ѻο�
GRANT CREATE SESSION TO SAMPLE;

/*
-- SAMPLE�������� ���̺���� �Ұ� : ���Ѻο��� ���ؼ�
CREATE TABLE TEST (
    ID VARCHAR2(30),
    NAME VARCHAR2(20)
);
*/
-- 1.3 ���̺��� ������ �� �ִ� CREATE TABLE ���� �ο�(���̺���� ����)
GRANT CREATE TABLE TO SAMPLE;

-- 1.4 TABLESPACE �Ҵ�(������ ���� �ȵ�)
ALTER USER SAMPLE QUOTA 2M ON USERS;


----------------------------------------------------------------------------------------
/*
    2. ��ü ���� ����
        Ư�� ��ü�� �����Ͽ� ������ �� �ִ� ����
        
        ���� ����
        SELECT      TABLE, VIEW, SEQUENCE
        INSERT      TABLE, VIEW
        UPDATE      TABLE, VIEW
        DELETE      TABLE, VIEW
        .....
        
        [ǥ����]
        GRANT �������� ON Ư����ü TO ������;
        - GRANT ���� ���� ON ������ ������ �ִ� USER.Ư����ü TO ��������USER;
*/
-- 2.1 SMAPLE�������� AIE���� EMPLOYEE���̺��� SELECT�� �� �ִ� ���Ѻο�
GRANT SELECT ON AIE.EMPLOYEE TO SAMPLE;

-- 2.2 SMAPLE�������� AIE������ DEPARTMENT���̺� INSERT�� �� �ִ� ���Ѻο�
GRANT INSERT ON AIE.DEPARTMENT TO SAMPLE;
GRANT SELECT ON AIE.DEPARTMENT TO SAMPLE;