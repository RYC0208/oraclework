-- JSP ����� ���� �����
ALTER SESSION set "_oracle_script" = true;
create user jsp identified by jsp;
grant RESOURCE, CONNECT to jsp;
alter user jsp default TABLESPACE users quota UNLIMITED on users;