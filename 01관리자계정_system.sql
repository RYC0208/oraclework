--  ���� �ּ� (ctrl + /)
/*
    ������ �ּ�
    alt + shift + c
*/

-- Ŀ���� ���ڰŸ��� ctrl + enter : �� �� ����
-- ���� ���� ����
show user;

-- ����� ���� ��ȸ
select * from DBA_USERS;

-- ���� �����
-- [ǥ����]   create user ����ڸ� identified by ��й�ȣ;
-- ����Ŭ 12���� ���� �Ϲݻ���ڴ� c##�� �ٿ� �̸��� �۸��Ѵ�
-- create user user1 IDENTIFIED BY 1234;
create user c##user1 IDENTIFIED by user1234;
create user c##user6 IDENTIFIED by "1234";
create user mybatis IDENTIFIED by user1234;
-- ����� �̸��� c## ���̴¤������� ȸ���ϴ� ���
ALTER SESSION set "_oracle_script" = true;
create user user7 identified by user7;

-- ����� �̸��� ��ҹ��ڸ� ������ �ʴ´�
-- ���� ����� ���� ����
create user aie identified by aie;

-- ���� ����
-- [ǥ����] grant ����1, ����2, ... to ������;
grant RESOURCE, CONNECT to aie;

-- ���̺����̽��� �󸶸�ŭ�� ������ �Ҵ��� �������� �ο�
alter user aie default TABLESPACE users quota UNLIMITED on users;

-- ���̺����̽��� ������ Ư�� �뷮��ŭ �Ҵ��Ϸ���
alter user user7 quota 30M on users;

-- user ����
-- [ǥ����] drop user ����ڸ�;  => ���̺��� ���� ����
-- [ǥ����] drop user ����ڸ� cascade; => ���̺��� ���� ��
drop user c##user1;

--workbook ����� ���� �����
ALTER SESSION set "_oracle_script" = true;
create user workbook identified by workbook;
grant RESOURCE, CONNECT to workbook;
alter user workbook default TABLESPACE users quota UNLIMITED on users;

--DDL ����� ���� �����
ALTER SESSION set "_oracle_script" = true;
create user ddl identified by ddl;
grant RESOURCE, CONNECT to ddl;
alter user ddl default TABLESPACE users quota UNLIMITED on users;

ALTER SESSION set "_oracle_script" = true;
create user mybatis identified by mybatis;
grant RESOURCE, CONNECT to mybatis;
alter user mybatis default TABLESPACE users quota UNLIMITED on users;

ALTER SESSION set "_oracle_script" = true;
create user springboot identified by springboot;
grant RESOURCE, CONNECT to springboot;
alter user springboot default TABLESPACE users quota UNLIMITED on users;