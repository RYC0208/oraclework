-- 1.3 �� ���Ѻο������� �����ϸ� ����. ���Ѻο� �Ŀ��� ���� ����
CREATE TABLE TEST (
    ID VARCHAR2(30),
    NAME VARCHAR2(20)
);

-- 1.4 �� ���� �ο� ���� �� ��
INSERT INTO TEST VALUES('user01', 'ȫ�浿');

--------------------------------------------------------
-- 2.1 �� ���� �ο� ���� �� ��
SELECT * FROM AIE.EMPLOYEE;

-- 2.2 ���� �ο� ��
INSERT INTO AIE.DEPARTMENT VALUES('D0', '������', 'L2');

SELECT * FROM AIE.DEPARTMENT;
COMMIT;