create table reply(
	no number primary key,
	content varchar2(400),
	ref number,
	name varchar2(20),
	redate date
);

create sequence SEQ_REPLY;

insert into reply values(SEQ_REPLY.NEXTVAL,'�Ϳ�! ù ���', 1, '��ó��','2023/12/02');
insert into reply values(SEQ_REPLY.NEXTVAL,'��������', 1, '�ڸ���','2023/12/12');
insert into reply values(SEQ_REPLY.NEXTVAL,'�����ϱ���', 1, '�̱���','2023/12/15');
insert into reply values(SEQ_REPLY.NEXTVAL,'�Ƹ��ٿ���', 1, 'Ȳ�Ƹ�','2024/01/03');