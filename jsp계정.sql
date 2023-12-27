CREATE SEQUENCE SEQ_BOARD;

CREATE TABLE board (
	num	number PRIMARY KEY,
	name varchar2(20) NOT NULL,
	subject varchar2(50) NOT NULL,
	content	varchar2(4000) NOT NULL,
	pos	number,
	ref	number,
	depth number,
	regdate	date,
	pass varchar2(15) NOT NULL,
	ip varchar2(15),
	count number default 0
);

insert into board values(SEQ_BOARD.NEXTVAL, '�ڱ浿', '����1', '����1', 0, SEQ_BOARD.CURRVAL, 0, '2023-04-01', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '��浿', '����2', '����2', 0, SEQ_BOARD.CURRVAL, 0, '2023-04-05', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '�۱浿', '����3', '����3', 0, SEQ_BOARD.CURRVAL, 0, '2023-04-12', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '�ѱ浿', '����4', '����4', 0, SEQ_BOARD.CURRVAL, 0, '2023-04-14', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '���浿', '����5', '����5', 0, SEQ_BOARD.CURRVAL, 0, '2023-04-25', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '���浿', '����6', '����6', 0, SEQ_BOARD.CURRVAL, 0, '2023-05-04', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '�ӱ浿', '����7', '����7', 0, SEQ_BOARD.CURRVAL, 0, '2023-05-07', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '�ű浿', '����8', '����8', 0, SEQ_BOARD.CURRVAL, 0, '2023-05-11', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '�ڱ浿', '����9', '����9', 0, SEQ_BOARD.CURRVAL, 0, '2023-05-22', '1234', '0:0:0:0:0:0:0:1', default);
insert into board values(SEQ_BOARD.NEXTVAL, '���浿', '����10', '����10', 0, SEQ_BOARD.CURRVAL, 0, '2023-05-29', '1234', '0:0:0:0:0:0:0:1', default);

commit;