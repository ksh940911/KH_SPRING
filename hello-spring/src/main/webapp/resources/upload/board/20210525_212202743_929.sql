--------------------------------------------------------
--  파일이 생성됨 - 금요일-4월-16-2021   
--------------------------------------------------------
DROP SEQUENCE "WEB"."SEQ_ATTACHMENT_NO";
DROP SEQUENCE "WEB"."SEQ_BOARD_COMMENT_NO";
DROP SEQUENCE "WEB"."SEQ_BOARD_NO";
DROP TABLE "WEB"."ATTACHMENT" cascade constraints;
DROP TABLE "WEB"."BOARD" cascade constraints;
DROP TABLE "WEB"."BOARD_COMMENT" cascade constraints;
DROP TABLE "WEB"."MEMBER" cascade constraints;
--------------------------------------------------------
--  DDL for Sequence SEQ_ATTACHMENT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "WEB"."SEQ_ATTACHMENT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BOARD_COMMENT_NO
--------------------------------------------------------

   CREATE SEQUENCE  "WEB"."SEQ_BOARD_COMMENT_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BOARD_NO
--------------------------------------------------------

   CREATE SEQUENCE  "WEB"."SEQ_BOARD_NO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 241 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table ATTACHMENT
--------------------------------------------------------

  CREATE TABLE "WEB"."ATTACHMENT" 
   (	"NO" NUMBER, 
	"BOARD_NO" NUMBER, 
	"ORIGINAL_FILENAME" VARCHAR2(255 BYTE), 
	"RENAMED_FILENAME" VARCHAR2(255 BYTE), 
	"STATUS" CHAR(1 BYTE) DEFAULT 'Y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "WEB"."ATTACHMENT"."NO" IS '첨부파일번호(PK)';
   COMMENT ON COLUMN "WEB"."ATTACHMENT"."BOARD_NO" IS '게시판글번호(FK)';
   COMMENT ON COLUMN "WEB"."ATTACHMENT"."ORIGINAL_FILENAME" IS '업로드한 첨부파일명';
   COMMENT ON COLUMN "WEB"."ATTACHMENT"."RENAMED_FILENAME" IS '서버에 저장된 첨부파일명';
   COMMENT ON COLUMN "WEB"."ATTACHMENT"."STATUS" IS '사용여부';
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "WEB"."BOARD" 
   (	"NO" NUMBER, 
	"TITLE" VARCHAR2(50 BYTE), 
	"WRITER" VARCHAR2(15 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"REG_DATE" DATE DEFAULT sysdate, 
	"READ_COUNT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "WEB"."BOARD"."NO" IS '게시글번호';
   COMMENT ON COLUMN "WEB"."BOARD"."TITLE" IS '게시글제목';
   COMMENT ON COLUMN "WEB"."BOARD"."WRITER" IS '게시글작성자 아이디';
   COMMENT ON COLUMN "WEB"."BOARD"."CONTENT" IS '게시글내용';
   COMMENT ON COLUMN "WEB"."BOARD"."REG_DATE" IS '게시글올린날짜';
   COMMENT ON COLUMN "WEB"."BOARD"."READ_COUNT" IS '조회수';
--------------------------------------------------------
--  DDL for Table BOARD_COMMENT
--------------------------------------------------------

  CREATE TABLE "WEB"."BOARD_COMMENT" 
   (	"NO" NUMBER, 
	"COMMENT_LEVEL" NUMBER DEFAULT 1, 
	"WRITER" VARCHAR2(15 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"BOARD_NO" NUMBER, 
	"COMMENT_REF" NUMBER, 
	"REG_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."NO" IS '게시판댓글번호';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."COMMENT_LEVEL" IS '게시판댓글 레벨';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."WRITER" IS '게시판댓글 작성자';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."CONTENT" IS '게시판댓글';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."BOARD_NO" IS '참조원글번호';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."COMMENT_REF" IS '게시판댓글 참조번호';
   COMMENT ON COLUMN "WEB"."BOARD_COMMENT"."REG_DATE" IS '게시판댓글 작성일';
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "WEB"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(15 BYTE), 
	"PASSWORD" VARCHAR2(300 BYTE), 
	"MEMBER_NAME" VARCHAR2(50 BYTE), 
	"MEMBER_ROLE" CHAR(1 BYTE) DEFAULT 'U', 
	"GENDER" CHAR(1 BYTE), 
	"BIRTHDAY" DATE, 
	"EMAIL" VARCHAR2(100 BYTE), 
	"PHONE" CHAR(11 BYTE), 
	"ADDRESS" VARCHAR2(200 BYTE), 
	"HOBBY" VARCHAR2(200 BYTE), 
	"ENROLL_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into WEB.ATTACHMENT
SET DEFINE OFF;
Insert into WEB.ATTACHMENT (NO,BOARD_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,STATUS) values (1,201,'hyunta.jpg','hyunta.jpg','Y');
Insert into WEB.ATTACHMENT (NO,BOARD_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,STATUS) values (2,203,'tower1.PNG','20210406_194305597_716.PNG','Y');
Insert into WEB.ATTACHMENT (NO,BOARD_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,STATUS) values (22,227,'한글파일.jpg','20210407_213516678_550.jpg','N');
Insert into WEB.ATTACHMENT (NO,BOARD_NO,ORIGINAL_FILENAME,RENAMED_FILENAME,STATUS) values (41,227,'줌테스트.txt','20210408_160205466_003.txt','N');
REM INSERTING into WEB.BOARD
SET DEFINE OFF;
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (181,'안녕','honggd','반갑습니다 :)',to_date('21/04/05','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (201,'하하하','honggd','가자아',to_date('21/04/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (227,'어택!','honggd','<script>window.onload = function(){document.write("<h1>ㅋㅋㅋ 미안!</h1>");}</script>

ㅇㅇㅇㅇㅇㅇㅇ',to_date('21/04/07','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (61,'안녕하세요, 게시판입니다 - 1','honggd','반갑습니다',to_date('18/02/10','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (62,'안녕하세요, 게시판입니다 - 2','qwerty','안녕하세요',to_date('18/02/12','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (63,'안녕하세요, 게시판입니다 - 3','admin','반갑습니다',to_date('18/02/13','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (64,'안녕하세요, 게시판입니다 - 4','honggd','안녕하세요',to_date('18/02/14','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (65,'안녕하세요, 게시판입니다 - 5','qwerty','반갑습니다',to_date('18/02/15','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (66,'안녕하세요, 게시판입니다 - 6','admin','안녕하세요',to_date('18/02/16','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (67,'안녕하세요, 게시판입니다 - 7','honggd','반갑습니다',to_date('18/02/17','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (68,'안녕하세요, 게시판입니다 - 8','qwerty','안녕하세요',to_date('18/02/18','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (69,'안녕하세요, 게시판입니다 - 9','admin','반갑습니다',to_date('18/02/19','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (70,'안녕하세요, 게시판입니다 - 10','honggd','안녕하세',to_date('18/02/20','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (71,'안녕하세요, 게시판입니다 - 11','qwerty','반갑습니다',to_date('18/03/11','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (72,'안녕하세요, 게시판입니다 - 12','admin','안녕하세',to_date('18/03/12','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (73,'안녕하세요, 게시판입니다 - 13','honggd','반갑습니다',to_date('18/03/13','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (74,'안녕하세요, 게시판입니다 - 14','qwerty','안녕하세',to_date('18/03/14','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (75,'안녕하세요, 게시판입니다 - 15','admin','반갑습니다',to_date('18/03/15','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (76,'안녕하세요, 게시판입니다 - 16','honggd','안녕하세',to_date('18/03/16','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (77,'안녕하세요, 게시판입니다 - 17','qwerty','반갑습니다',to_date('18/03/17','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (78,'안녕하세요, 게시판입니다 - 18','admin','안녕하세',to_date('18/03/18','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (79,'안녕하세요, 게시판입니다 - 19','honggd','반갑습니다',to_date('18/03/19','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (80,'안녕하세요, 게시판입니다 - 20','qwerty','안녕하세',to_date('18/03/20','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (81,'안녕하세요, 게시판입니다 - 21','admin','반갑습니다',to_date('18/04/01','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (82,'안녕하세요, 게시판입니다 - 22','honggd','안녕하세',to_date('18/04/02','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (83,'안녕하세요, 게시판입니다 - 23','qwerty','반갑습니다',to_date('18/04/03','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (84,'안녕하세요, 게시판입니다 - 24','admin','안녕하세',to_date('18/04/04','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (85,'안녕하세요, 게시판입니다 - 25','honggd','반갑습니다',to_date('18/04/05','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (86,'안녕하세요, 게시판입니다 - 26','qwerty','안녕하세',to_date('18/04/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (87,'안녕하세요, 게시판입니다 - 27','admin','반갑습니다',to_date('18/04/07','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (88,'안녕하세요, 게시판입니다 - 28','honggd','안녕하세',to_date('18/04/08','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (89,'안녕하세요, 게시판입니다 - 29','qwerty','반갑습니다',to_date('18/04/09','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (90,'안녕하세요, 게시판입니다 - 30','admin','안녕하세',to_date('18/04/10','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (91,'안녕하세요, 게시판입니다 - 31','honggd','반갑습니다',to_date('18/04/16','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (92,'안녕하세요, 게시판입니다 - 32','qwerty','안녕하세',to_date('18/04/17','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (93,'안녕하세요, 게시판입니다 - 33','admin','반갑습니다',to_date('18/04/18','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (94,'안녕하세요, 게시판입니다 - 34','honggd','안녕하세',to_date('18/04/19','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (95,'안녕하세요, 게시판입니다 - 35','qwerty','반갑습니다',to_date('18/04/20','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (96,'안녕하세요, 게시판입니다 - 36','admin','안녕하세',to_date('18/05/01','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (97,'안녕하세요, 게시판입니다 - 37','honggd','반갑습니다',to_date('18/05/02','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (98,'안녕하세요, 게시판입니다 - 38','qwerty','안녕하세',to_date('18/05/03','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (99,'안녕하세요, 게시판입니다 - 39','admin','반갑습니다',to_date('18/05/04','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (100,'안녕하세요, 게시판입니다 - 40','honggd','안녕하세',to_date('18/05/05','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (101,'안녕하세요, 게시판입니다 - 41','qwerty','반갑습니다',to_date('18/05/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (102,'안녕하세요, 게시판입니다 - 42','admin','안녕하세',to_date('18/05/07','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (103,'안녕하세요, 게시판입니다 - 43','honggd','반갑습니다',to_date('18/05/08','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (104,'안녕하세요, 게시판입니다 - 44','qwerty','안녕하세',to_date('18/05/09','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (105,'안녕하세요, 게시판입니다 - 45','admin','반갑습니다',to_date('18/05/10','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (106,'안녕하세요, 게시판입니다 - 46','honggd','안녕하세',to_date('18/05/16','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (107,'안녕하세요, 게시판입니다 - 47','qwerty','반갑습니다',to_date('18/05/17','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (108,'안녕하세요, 게시판입니다 - 48','admin','안녕하세',to_date('18/05/18','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (109,'안녕하세요, 게시판입니다 - 49','honggd','반갑습니다',to_date('18/05/19','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (110,'안녕하세요, 게시판입니다 - 50','qwerty','안녕하세',to_date('18/05/20','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (111,'안녕하세요, 게시판입니다 - 51','admin','반갑습니다',to_date('18/05/01','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (112,'안녕하세요, 게시판입니다 - 52','honggd','안녕하세',to_date('18/06/02','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (113,'안녕하세요, 게시판입니다 - 53','qwerty','반갑습니다',to_date('18/06/03','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (114,'안녕하세요, 게시판입니다 - 54','admin','안녕하세',to_date('18/06/04','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (115,'안녕하세요, 게시판입니다 - 55','honggd','반갑습니다',to_date('18/06/05','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (116,'안녕하세요, 게시판입니다 - 56','qwerty','안녕하세',to_date('18/06/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (117,'안녕하세요, 게시판입니다 - 57','admin','반갑습니다',to_date('18/06/07','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (118,'안녕하세요, 게시판입니다 - 58','honggd','안녕하세',to_date('18/06/08','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (119,'안녕하세요, 게시판입니다 - 59','qwerty','반갑습니다',to_date('18/06/09','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (120,'안녕하세요, 게시판입니다 - 60','admin','안녕하세',to_date('18/06/10','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (203,'zzzz','honggd','ddddd',to_date('21/04/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (204,'redirect','admin','hello',to_date('21/04/06','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (221,'123123','honggd','안
녕
하
세
요',to_date('21/04/07','RR/MM/DD'),0);
Insert into WEB.BOARD (NO,TITLE,WRITER,CONTENT,REG_DATE,READ_COUNT) values (222,'어택!!','honggd','<script>document.write("ㅋㅋㅋ");</script>',to_date('21/04/07','RR/MM/DD'),0);
REM INSERTING into WEB.BOARD_COMMENT
SET DEFINE OFF;
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (1,1,'sejong','잘 읽었습니다.',227,null,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (2,1,'shqkel','멋지네요~',227,null,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (3,1,'sinsa','WOW ㅇㅅㅇ',227,null,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (5,2,'honggd','읽어주셔서 감사합니다.',227,1,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (6,2,'abcd','거짓말~',227,1,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (7,2,'abcd','뻥이야~',227,2,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (10,2,'honggd','정말?????',227,1,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (13,2,'honggd','ㅁㄹㅇㄹ',227,1,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (14,1,'honggd','ddd',222,null,to_date('21/04/08','RR/MM/DD'));
Insert into WEB.BOARD_COMMENT (NO,COMMENT_LEVEL,WRITER,CONTENT,BOARD_NO,COMMENT_REF,REG_DATE) values (9,1,'honggd','gggg',227,null,to_date('21/04/08','RR/MM/DD'));
REM INSERTING into WEB.MEMBER
SET DEFINE OFF;
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('sejong','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세종','U','M',to_date('15/06/29','RR/MM/DD'),null,'01012341234',null,'운동,등산',to_date('21/03/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('pandemonium','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김판돌','U','M',to_date('83/03/03','RR/MM/DD'),'pandemonium@naver.com','01012341234','경상북도','등산,여행',to_date('17/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shqkel','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노바디','U','M',to_date('90/09/02','RR/MM/DD'),'shqkel@naver.com','01012341234','서울시 중구','등산',to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('neoneo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네오','U','M',to_date('76/10/02','RR/MM/DD'),'neoneo@naver.com','01040021863','서울시 강남구',null,to_date('18/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('kamsayoyo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','U','M',to_date('83/06/20','RR/MM/DD'),'ksy@naver.com','01012341234','부산시 동래구','운동,등산',to_date('18/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('sinsa','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','신사임당','U','M',null,null,'01022223333',null,null,to_date('21/03/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('honggd','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','홍길동길동','U','M',to_date('00/09/09','RR/MM/DD'),'honggd@naver.com','01012341234','서울시 강남구','운동,등산,독서,게임,여행',to_date('21/03/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('qwerty','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','쿠어티','U','F',to_date('90/02/15','RR/MM/DD'),'qwerty@naver.com','01012341234','서울시 송파구','운동,등산',to_date('21/03/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('admin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','관리자','A','M',to_date('80/10/10','RR/MM/DD'),'admin@naver.com','01056785678','서울시 관악구','게임,독서',to_date('21/03/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('hihiroo','NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==','김안녕','U','F',to_date('01/10/18','RR/MM/DD'),'hihiroo@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('18/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('encrypten_man','mZNR9KFjogJnD9J0+gGMKxAAstZidIXEKPLv+Ns42TvZY/o9QcBbDR0s1Vjm4a5HqKZDVPH+sAuM1BD/YwKyVw==','암호화','U','M',to_date('91/02/03','RR/MM/DD'),null,'01012341243',null,null,to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('abcd','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김준호','U','M',to_date('92/02/02','RR/MM/DD'),'abcd@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/02/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('bcde','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지와','U','F',to_date('93/01/20','RR/MM/DD'),'bcde@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/03/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('cdef','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김윤정','U','M',to_date('94/04/20','RR/MM/DD'),'cdef@naver.com','01056745678','서울시 강북구','운동,독서',to_date('18/11/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('defg','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박봉철','U','F',to_date('95/01/20','RR/MM/DD'),'defg@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('18/04/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('efgh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하정운','U','M',to_date('96/06/03','RR/MM/DD'),'efgh@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/11/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('fghi','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병송','U','F',to_date('97/01/01','RR/MM/DD'),'fghi@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('18/03/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ghij','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민우','U','M',to_date('98/07/02','RR/MM/DD'),'ghij@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('18/11/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('hijk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김지호','U','M',to_date('99/04/18','RR/MM/DD'),'hijk@naver.com','01012345678','서울시 관악구','등산,독서',to_date('18/06/08','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ijkl','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장동준','U','M',to_date('00/04/01','RR/MM/DD'),'ijkl@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('18/06/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('jklm','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연','U','M',to_date('89/07/20','RR/MM/DD'),'jklm@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('18/06/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('klmn','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연호','U','M',to_date('88/04/15','RR/MM/DD'),'klmn@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('lmno','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연우','U','M',to_date('87/03/01','RR/MM/DD'),'lmno@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('18/04/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mnop','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지운','U','M',to_date('86/06/03','RR/MM/DD'),'mnop@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('18/06/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('nopq','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정구운','U','M',to_date('85/03/20','RR/MM/DD'),'nopq@naver.com','01012345678','서울시 관악구','운동,독서',to_date('18/04/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('opqr','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성우','U','M',to_date('84/07/01','RR/MM/DD'),'opqr@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('pqrs','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주은','U','M',to_date('83/01/18','RR/MM/DD'),'pqrs@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('qrst','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리','U','M',to_date('82/03/02','RR/MM/DD'),'qrst@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('18/11/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('rstu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','U','M',to_date('81/06/01','RR/MM/DD'),'rstu@naver.com','01056745678','서울시 서초구','운동,등산,독서',to_date('18/06/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('stuv','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경자','U','M',to_date('80/07/15','RR/MM/DD'),'stuv@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('tuvw','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정성택','U','M',to_date('83/06/20','RR/MM/DD'),'tuvw@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/03/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('uvwx','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정은','U','M',to_date('02/07/18','RR/MM/DD'),'uvwx@naver.com','01012345678','서울시 서초구','운동,등산,독서',to_date('18/11/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('wxyz','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박보람','U','M',to_date('75/01/01','RR/MM/DD'),'wxyz@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('18/07/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('catmom','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본우','U','M',to_date('79/06/15','RR/MM/DD'),'catmom@naver.com','01098765678','서울시 관악구','운동,등산,독서',to_date('18/04/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('bear','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제트','U','M',to_date('79/11/01','RR/MM/DD'),'bear@naver.com','01012345678','서울시 관악구','운동,독서',to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('dogpapa','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한석규','U','M',to_date('75/07/03','RR/MM/DD'),'dogpapa@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('18/06/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('fishman','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두석규','U','M',to_date('83/01/02','RR/MM/DD'),'fishman@naver.com','01012345678','서울시 강남구','등산,독서',to_date('18/07/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('buckey','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세석규','U','M',to_date('75/01/01','RR/MM/DD'),'buckey@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/11/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mmary','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네석규','U','M',to_date('01/03/20','RR/MM/DD'),'mmary@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/07/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('usbteacher','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동석','U','M',to_date('79/06/01','RR/MM/DD'),'usbteacher@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('18/01/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mslove','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무개','U','M',to_date('75/11/03','RR/MM/DD'),'mslove@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/07/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('spongebob','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김밥','U','F',to_date('75/04/20','RR/MM/DD'),'spongebob@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('16/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ordovician','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','암호화','U','M',to_date('01/01/01','RR/MM/DD'),null,'01012341243',null,null,to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('patli','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김준호','U','M',to_date('75/07/18','RR/MM/DD'),'patli@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/04/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('skitz','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지와','U','F',to_date('79/07/02','RR/MM/DD'),'skitz@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/11/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('hlal','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정윤정','U','M',to_date('75/06/03','RR/MM/DD'),'hlal@naver.com','01056745678','서울시 강북구','운동,독서',to_date('16/02/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('skytear','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박봉철','U','F',to_date('83/11/15','RR/MM/DD'),'skyTear@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('16/07/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('leander','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하정운','U','M',to_date('75/01/01','RR/MM/DD'),'leander@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/04/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ripsnarl','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병송','U','F',to_date('90/07/03','RR/MM/DD'),'ripSnarl@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('16/06/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('eleuia','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민우','U','M',to_date('75/07/20','RR/MM/DD'),'eleuia@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('16/01/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mrcuddles','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김지호','U','M',to_date('79/06/01','RR/MM/DD'),'mrCuddles@naver.com','01012345678','서울시 관악구','등산,독서',to_date('16/02/08','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('lior','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장동준','U','M',to_date('79/11/02','RR/MM/DD'),'lior@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('16/01/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('eseit','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연','U','M',to_date('75/01/18','RR/MM/DD'),'eseit@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('16/07/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shimmer','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연호','U','M',to_date('83/06/01','RR/MM/DD'),'shimmer@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/04/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('nibbles','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연우','U','M',to_date('75/11/03','RR/MM/DD'),'nibbles@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('16/01/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('pastel','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지운','U','F',to_date('79/11/15','RR/MM/DD'),'pastel@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('16/04/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('pewner','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정구운','U','M',to_date('75/07/20','RR/MM/DD'),'pewner@naver.com','01012345678','서울시 관악구','운동,독서',to_date('16/06/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mrglows','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성우','U','M',to_date('83/02/01','RR/MM/DD'),'mrGlows@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('raich','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주은','U','M',to_date('01/01/02','RR/MM/DD'),'raich@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/11/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('jasmine','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리','U','M',to_date('75/07/03','RR/MM/DD'),'jasmine@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('16/01/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('zothath','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','U','M',to_date('75/02/20','RR/MM/DD'),'zothath@naver.com','01056745678','서울시 서초구','운동,등산,독서',to_date('16/07/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('imamu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경자','U','M',to_date('79/06/01','RR/MM/DD'),'imamu@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('floater','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정성택','U','M',to_date('75/02/03','RR/MM/DD'),'floater@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('nana','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정은','U','M',to_date('79/09/20','RR/MM/DD'),'nana@naver.com','01012345678','서울시 서초구','운동,등산,독서',to_date('16/02/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shotsathothu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박보람','U','M',to_date('75/07/02','RR/MM/DD'),'shotSathothu@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('16/01/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('kisaki','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본우','U','M',to_date('83/06/01','RR/MM/DD'),'kisaki@naver.com','01098765678','서울시 관악구','운동,등산,독서',to_date('16/07/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('notyours','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제트','U','M',to_date('79/07/03','RR/MM/DD'),'notYours@naver.com','01012345678','서울시 관악구','운동,독서',to_date('16/09/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('cipanr','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한석규','U','M',to_date('75/02/01','RR/MM/DD'),'cipanr@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('16/01/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('iarsere','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두석규','U','M',to_date('90/02/18','RR/MM/DD'),'iarsere@naver.com','01012345678','서울시 강남구','등산,독서',to_date('16/04/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('kubcthothoth','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세석규','U','M',to_date('75/02/03','RR/MM/DD'),'kubCthothoth@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('claw','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네석규','U','M',to_date('79/02/01','RR/MM/DD'),'claw@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/09/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('hibiscus','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동석','U','M',to_date('75/10/18','RR/MM/DD'),'hibiscus@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('16/04/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('elania','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무개','U','M',to_date('83/10/03','RR/MM/DD'),'elania@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/06/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mothball','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노바디','U','M',to_date('75/10/01','RR/MM/DD'),'mothball@naver.com','01012341234','서울시 중구','등산',to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ssynec','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네오','U','M',to_date('79/02/02','RR/MM/DD'),'ssynec@naver.com','01040021863','서울시 강남구',null,to_date('16/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('amethyst','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','U','M',to_date('90/04/01','RR/MM/DD'),'amethyst@naver.com','01012341234','부산시 동래구','운동,등산',to_date('16/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('xapreiye','NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==','허안녕','U','F',to_date('75/10/03','RR/MM/DD'),'xapreiye@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('17/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('fliostium','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','부호화','U','M',to_date('83/10/02','RR/MM/DD'),null,'01012341243',null,null,to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ocrait','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박준호','U','M',to_date('75/01/01','RR/MM/DD'),'ocrait@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/09/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('asasas','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아자아자','A','F',null,null,'01012121212',null,'운동,독서',to_date('21/03/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('choijun','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','최준','U','M',null,null,'01012341234',null,'운동,게임',to_date('21/03/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('kekeke','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','케케케','U','M',null,null,'01012341234',null,null,to_date('21/03/30','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('oshary','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','치와와','U','F',to_date('79/04/20','RR/MM/DD'),'oshary@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('17/10/02','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('bleze','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박윤정','U','M',to_date('75/06/03','RR/MM/DD'),'bleze@naver.com','01056745678','서울시 강북구','운동,독서',to_date('17/10/03','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('megriuvania','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박성철','U','M',to_date('90/09/02','RR/MM/DD'),'megriuvania@naver.com','01012345678','전라도 여수시','운동,등산,독서',to_date('17/01/04','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('glosau','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','고정운','U','M',to_date('75/10/15','RR/MM/DD'),'glosau@naver.com','01012345678','서울시 송파구','독서',to_date('17/03/05','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('lasken','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병우','U','F',to_date('79/07/02','RR/MM/DD'),'lasken@naver.com','01056745678','수원시 팔달구','운동,등산,독서',to_date('17/04/06','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('nesnesh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민호','U','M',to_date('90/09/03','RR/MM/DD'),'nesnesh@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('17/10/07','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('granite','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김진호','U','M',to_date('75/01/20','RR/MM/DD'),'granite@naver.com','01012345678','서울시 관악구','등산,독서',to_date('17/09/08','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('arachnid','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장옹이','U','M',to_date('75/10/01','RR/MM/DD'),'arachnid@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('17/04/09','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('blight','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지연','U','F',to_date('79/06/02','RR/MM/DD'),'blight@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('17/10/10','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mist','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연요','U','M',to_date('75/09/20','RR/MM/DD'),'mist@naver.com','01012345678','서울시 강북구','운동,등산',to_date('17/02/11','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('mouse','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연유','U','M',to_date('02/10/03','RR/MM/DD'),'mouse@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('17/07/12','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('scramble','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지훈','U','M',to_date('75/10/20','RR/MM/DD'),'scramble@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('17/01/13','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('rime','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정수윤','U','F',to_date('90/04/02','RR/MM/DD'),'rime@naver.com','01012345678','서울시 관악구','운동,독서',to_date('17/10/14','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('wireless','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성호','U','M',to_date('79/07/01','RR/MM/DD'),'wireless@naver.com','01012345678','서울시 강북구','운동',to_date('17/02/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('fiend','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주흔','U','M',to_date('79/04/03','RR/MM/DD'),'fiend@naver.com','01012345678','서울시 강북구','운동,독서',to_date('17/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('pebble','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리차','U','M',to_date('01/04/02','RR/MM/DD'),'pebble@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('17/02/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('disperse','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','U','M',to_date('79/06/15','RR/MM/DD'),'disperse@naver.com','01056745678','서울시 서초구','등산,독서',to_date('17/02/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('inferno','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경택','U','M',to_date('01/09/02','RR/MM/DD'),'inferno@naver.com','01012345678','서울시 관악구','운동',to_date('17/10/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('virtue','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정은택','U','M',to_date('90/02/01','RR/MM/DD'),'virtue@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('plague','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정인','U','F',to_date('79/01/03','RR/MM/DD'),'plague@naver.com','01012345678','서울시 서초구','등산,독서',to_date('17/03/21','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('light','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보람','U','M',to_date('01/09/02','RR/MM/DD'),'light@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('17/02/22','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('plasma','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본승','U','M',to_date('02/04/02','RR/MM/DD'),'plasma@naver.com','01098765678','인천','등산',to_date('17/02/23','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('nightshade','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제현','U','M',to_date('90/10/20','RR/MM/DD'),'nightshade@naver.com','01012345678','서울시 관악구','운동,독서',to_date('17/01/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('ooze','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한고은','U','F',to_date('01/06/02','RR/MM/DD'),'ooze@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('17/09/25','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shift','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두고은','U','F',to_date('76/02/20','RR/MM/DD'),'shift@naver.com','01012345678','서울시 강남구','등산,독서',to_date('17/03/26','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('luna','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세고은','U','F',to_date('02/02/03','RR/MM/DD'),'luna@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('17/09/27','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('cecirh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네고은','U','F',to_date('01/04/15','RR/MM/DD'),'cecirh@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/04/28','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('illuminos','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동탁','U','M',to_date('76/02/02','RR/MM/DD'),'illuminos@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('17/10/29','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shockwave','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무나','U','M',to_date('83/01/01','RR/MM/DD'),'shockwave@naver.com','01012345678','서울시 강북구','여행',to_date('17/02/15','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('thunder','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','애니바디','U','M',to_date('76/09/20','RR/MM/DD'),'thunder@naver.com','01012341234','서울시 중구','등산',to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('steelskin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김쇠살','U','M',to_date('90/10/01','RR/MM/DD'),'steelskin@naver.com','01040021863','서울시 강남구',null,to_date('17/04/01','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('glutton','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','U','M',to_date('83/02/02','RR/MM/DD'),'glutton@naver.com','01012341234','부산시 동래구','운동,등산',to_date('17/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('puma','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하퓨마','U','M',to_date('76/04/03','RR/MM/DD'),'puma@naver.com','01012341234','부산광역시','운동',to_date('17/04/18','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('shadow','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','그리무','U','M',to_date('01/10/20','RR/MM/DD'),'shadow@naver.com','01012341234','대구','독서',to_date('17/04/17','RR/MM/DD'));
Insert into WEB.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,MEMBER_ROLE,GENDER,BIRTHDAY,EMAIL,PHONE,ADDRESS,HOBBY,ENROLL_DATE) values ('bandit','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','반디','U','M',to_date('76/02/02','RR/MM/DD'),'bandit@naver.com','01012341234','충청남도','등산',to_date('17/04/16','RR/MM/DD'));
--------------------------------------------------------
--  DDL for Index PK_BOARD_COMMENT_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_BOARD_COMMENT_NO" ON "WEB"."BOARD_COMMENT" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_BOARD_NO" ON "WEB"."BOARD" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_MEMBER_ID" ON "WEB"."MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007146
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."SYS_C007146" ON "WEB"."ATTACHMENT" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007146
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."SYS_C007146" ON "WEB"."ATTACHMENT" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_BOARD_NO" ON "WEB"."BOARD" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_BOARD_COMMENT_NO
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_BOARD_COMMENT_NO" ON "WEB"."BOARD_COMMENT" ("NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PK_MEMBER_ID
--------------------------------------------------------

  CREATE UNIQUE INDEX "WEB"."PK_MEMBER_ID" ON "WEB"."MEMBER" ("MEMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "WEB"."ATTACHMENT" ADD PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "WEB"."ATTACHMENT" ADD CONSTRAINT "CK_STATUS" CHECK (status in ('Y','N')) ENABLE;
  ALTER TABLE "WEB"."ATTACHMENT" MODIFY ("RENAMED_FILENAME" NOT NULL ENABLE);
  ALTER TABLE "WEB"."ATTACHMENT" MODIFY ("ORIGINAL_FILENAME" NOT NULL ENABLE);
  ALTER TABLE "WEB"."ATTACHMENT" MODIFY ("BOARD_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "WEB"."BOARD" ADD CONSTRAINT "PK_BOARD_NO" PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "WEB"."BOARD_COMMENT" ADD CONSTRAINT "PK_BOARD_COMMENT_NO" PRIMARY KEY ("NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "WEB"."MEMBER" ADD CONSTRAINT "PK_MEMBER_ID" PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "WEB"."MEMBER" ADD CONSTRAINT "CK_MEMBER_ROLE" CHECK (member_role in ('U', 'A')) ENABLE;
  ALTER TABLE "WEB"."MEMBER" ADD CONSTRAINT "CK_GENDER" CHECK (gender in ('M', 'F')) ENABLE;
  ALTER TABLE "WEB"."MEMBER" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "WEB"."MEMBER" MODIFY ("MEMBER_ROLE" NOT NULL ENABLE);
  ALTER TABLE "WEB"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "WEB"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table ATTACHMENT
--------------------------------------------------------

  ALTER TABLE "WEB"."ATTACHMENT" ADD CONSTRAINT "FK_BOARD_NO" FOREIGN KEY ("BOARD_NO")
	  REFERENCES "WEB"."BOARD" ("NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "WEB"."BOARD" ADD CONSTRAINT "FK_WRITER" FOREIGN KEY ("WRITER")
	  REFERENCES "WEB"."MEMBER" ("MEMBER_ID") ON DELETE SET NULL ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_COMMENT
--------------------------------------------------------

  ALTER TABLE "WEB"."BOARD_COMMENT" ADD CONSTRAINT "FK_BOARD_COMMENT_BOARD_NO" FOREIGN KEY ("BOARD_NO")
	  REFERENCES "WEB"."BOARD" ("NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "WEB"."BOARD_COMMENT" ADD CONSTRAINT "FK_BOARD_COMMENT_REF" FOREIGN KEY ("COMMENT_REF")
	  REFERENCES "WEB"."BOARD_COMMENT" ("NO") ON DELETE CASCADE ENABLE;
  ALTER TABLE "WEB"."BOARD_COMMENT" ADD CONSTRAINT "FK_BOARD_COMMENT_WRITER" FOREIGN KEY ("WRITER")
	  REFERENCES "WEB"."MEMBER" ("MEMBER_ID") ON DELETE SET NULL ENABLE;
