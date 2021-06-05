--===============================
-- ������ ����
--===============================
create user spring
identified by spring
default tablespace users;

grant connect, resource to spring;

--===============================
-- spring ����
--===============================

create table dev(
    no number,
    name varchar2(50) not null,
    career number not null,
    email varchar2(200) not null,
    gender char(1),
    lang varchar2(500) not null,
    constraint pk_dev_no primary key(no),
    constraint ck_dev_gender check(gender in ('M', 'F'))
);

create sequence seq_dev_no;

select
    *
from
    dev;
    

--ȸ�����̺� ����
create table member(
    id varchar2(15),
    password varchar2(300) not null,
    name varchar2(256) not null,
    gender char(1),
    birthday date,
    email varchar2(256),
    phone char(11) not null,
    address varchar2(512),
    hobby varchar2(256),
    enroll_date date default sysdate, 
    enabled number default 1,               --Ȱ��ȭ���� 1(Ȱ��ȭ), 0(��Ȱ��ȭ)
    constraint pk_member_id primary key(id),
    constraint ck_member_gender check(gender in ('M', 'F')),
    constraint ck_member_enabled check(enabled in (1,0))
);

insert into spring.member values ('abcde','1234','�ƹ���','M',to_date('88-01-25','rr-mm-dd'),'abcde@naver.com','01012345678','����� ������','�,���,����',default,default);
insert into spring.member values ('qwerty','1234','�踻��','F',to_date('78-02-25','rr-mm-dd'),'qwerty@naver.com','01098765432','����� ���Ǳ�','�,���',default,default);
insert into spring.member values ('admin','1234','������','F',to_date('90-12-25','rr-mm-dd'),'admin@naver.com','01012345678','����� ������','����',default,default);
commit;

select
    *
from
    member;
    
update 
    member
set
    password = '$2a$10$LrjcOx/0ZjEsfwBLajFgGu/Nw5/cwiiPv0jnAs0ZtGmcVbpV5rxaS'
where
    id = 'qwerty';
    
commit;


select
    *
from
    member
where
    id = 'honggd';

-- memo���̺� ����
create table memo(
    no number,
    memo varchar2(2000),
    reg_date date default sysdate,
    constraint pk_memo_no primary key(no)
);

create sequence seq_memo_no;

select * from memo;


-- board���̺�
create table board(
    no number,
    title varchar2(500),
    member_id varchar2(20),
    content varchar2(2000),
    reg_date date default sysdate,
    read_count number default 0,
    constraint pk_board_no primary key(no),
    constraint fk_board_member_id foreign key(member_id) 
            references member(id) on delete set null
);


-- attachment���̺� 
create table attachment(
    no number,
    board_no number not null,
    original_filename varchar2(256) not null,
    renamed_filename varchar2(256) not null,
    upload_date date default sysdate,
    download_count number default 0,
    status char(1) default 'Y',
    constraint pk_attachment_no primary key(no),
    constraint fk_attachment_board_no foreign key(board_no)
        references board(no) on delete cascade,
    constraint ck_attachment_status check(status in ('Y', 'N'))
);

create sequence seq_board_no;
create sequence seq_attachment_no;


select * from board order by no desc;
select * from attachment;

insert into 
    attachment 
values(
    seq_attachment_no.nextval, 60, 'test.jpg', 
    '20200525_090909_123.jpg', default, default, default
);

insert into 
    attachment 
values(
    seq_attachment_no.nextval, 60, 'moon.jpg', 
    '20200525_090909_345.jpg', default, default, default
);

insert into 
    attachment 
values(
    seq_attachment_no.nextval, 59, 'sun.jpg', 
    '20200525_020425_345.jpg', default, default, default
);

Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 1','abcde','�ݰ����ϴ�',to_date('18/02/10','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 2','qwerty','�ȳ��ϼ���',to_date('18/02/12','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 3','admin','�ݰ����ϴ�',to_date('18/02/13','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 4','abcde','�ȳ��ϼ���',to_date('18/02/14','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 5','qwerty','�ݰ����ϴ�',to_date('18/02/15','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 6','admin','�ȳ��ϼ���',to_date('18/02/16','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 7','abcde','�ݰ����ϴ�',to_date('18/02/17','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 8','qwerty','�ȳ��ϼ���',to_date('18/02/18','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 9','admin','�ݰ����ϴ�',to_date('18/02/19','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 10','abcde','�ȳ��ϼ�',to_date('18/02/20','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 11','qwerty','�ݰ����ϴ�',to_date('18/03/11','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 12','admin','�ȳ��ϼ�',to_date('18/03/12','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 13','abcde','�ݰ����ϴ�',to_date('18/03/13','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 14','qwerty','�ȳ��ϼ�',to_date('18/03/14','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 15','admin','�ݰ����ϴ�',to_date('18/03/15','RR/MM/DD'),0);


Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 16','abcde','�ȳ��ϼ�',to_date('18/03/16','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 17','qwerty','�ݰ����ϴ�',to_date('18/03/17','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 18','admin','�ȳ��ϼ�',to_date('18/03/18','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 19','abcde','�ݰ����ϴ�',to_date('18/03/19','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 20','qwerty','�ȳ��ϼ�',to_date('18/03/20','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 21','admin','�ݰ����ϴ�',to_date('18/04/01','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 22','abcde','�ȳ��ϼ�',to_date('18/04/02','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 23','qwerty','�ݰ����ϴ�',to_date('18/04/03','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 24','admin','�ȳ��ϼ�',to_date('18/04/04','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 25','abcde','�ݰ����ϴ�',to_date('18/04/05','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 26','qwerty','�ȳ��ϼ�',to_date('18/04/06','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 27','admin','�ݰ����ϴ�',to_date('18/04/07','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 28','abcde','�ȳ��ϼ�',to_date('18/04/08','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 29','qwerty','�ݰ����ϴ�',to_date('18/04/09','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 30','admin','�ȳ��ϼ�',to_date('18/04/10','RR/MM/DD'),0);

Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 31','abcde','�ݰ����ϴ�',to_date('18/04/16','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 32','qwerty','�ȳ��ϼ�',to_date('18/04/17','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 33','admin','�ݰ����ϴ�',to_date('18/04/18','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 34','abcde','�ȳ��ϼ�',to_date('18/04/19','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 35','qwerty','�ݰ����ϴ�',to_date('18/04/20','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 36','admin','�ȳ��ϼ�',to_date('18/05/01','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 37','abcde','�ݰ����ϴ�',to_date('18/05/02','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 38','qwerty','�ȳ��ϼ�',to_date('18/05/03','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 39','admin','�ݰ����ϴ�',to_date('18/05/04','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 40','abcde','�ȳ��ϼ�',to_date('18/05/05','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 41','qwerty','�ݰ����ϴ�',to_date('18/05/06','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 42','admin','�ȳ��ϼ�',to_date('18/05/07','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 43','abcde','�ݰ����ϴ�',to_date('18/05/08','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 44','qwerty','�ȳ��ϼ�',to_date('18/05/09','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 45','admin','�ݰ����ϴ�',to_date('18/05/10','RR/MM/DD'),0);

Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 46','abcde','�ȳ��ϼ�',to_date('18/05/16','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 47','qwerty','�ݰ����ϴ�',to_date('18/05/17','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 48','admin','�ȳ��ϼ�',to_date('18/05/18','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 49','abcde','�ݰ����ϴ�',to_date('18/05/19','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 50','qwerty','�ȳ��ϼ�',to_date('18/05/20','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 51','admin','�ݰ����ϴ�',to_date('18/05/01','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 52','abcde','�ȳ��ϼ�',to_date('18/06/02','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 53','qwerty','�ݰ����ϴ�',to_date('18/06/03','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 54','admin','�ȳ��ϼ�',to_date('18/06/04','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 55','abcde','�ݰ����ϴ�',to_date('18/06/05','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 56','qwerty','�ȳ��ϼ�',to_date('18/06/06','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 57','admin','�ݰ����ϴ�',to_date('18/06/07','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 58','abcde','�ȳ��ϼ�',to_date('18/06/08','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 59','qwerty','�ݰ����ϴ�',to_date('18/06/09','RR/MM/DD'),0);
Insert into SPRING.BOARD (NO,TITLE,MEMBER_ID,CONTENT,REG_DATE,READ_COUNT) values (SEQ_BOARD_NO.nextval,'�ȳ��ϼ���, �Խ����Դϴ� - 60','admin','�ȳ��ϼ�',to_date('18/06/10','RR/MM/DD'),0);


commit;


select
    b.*,
    (select count(*) from attachment where board_no = b.no) attach_count			
from 
    board b
order by
    no desc;


select * from board order by no desc;
select * from attachment;

select 
    b.*,
    a.no "attach_no",
    a.board_no,
    a.original_filename,
    a.renamed_filename,
    a.upload_date,
    a.download_count,
    a.status
from  
    board b
  left join 
    attachment a
      on b.no = a.board_no
where b.no = 62;




