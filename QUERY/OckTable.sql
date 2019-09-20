***********************************************기본테이블생성***********************************************************

DROP TABLE MEMBER;
DROP TABLE LBOTM;
DROP TABLE PAYMENT;
DROP TABLE CATEGORY;
DROP TABLE PRODUCTQNA;
DROP TABLE PRODUCTREVIEW;
DROP TABLE PRODUCT;
DROP TABLE NOTICE;
DROP TABLE CART;
DROP TABLE COMMENTLIST;
DROP TABLE GOOD;
DROP TABLE DELIVARY;
DROP TABLE FREE_BOARD;
DROP TABLE INGREDIENTS;
DROP TABLE MBLRECIPE;
DROP TABLE PRODUCTANSWER;

DROP SEQUENCE SEQ_P_ID;
DROP SEQUENCE SEQ_PT_ID;

CREATE SEQUENCE SEQ_P_ID INCREMENT BY 1 MAXVALUE 9999999999999999999999999999 MINVALUE 1 CACHE 20;
create SEQUENCE seq_pt_Id;

CREATE TABLE MEMBER (
   USERID VARCHAR2(30) PRIMARY KEY,
   PASSWORD VARCHAR2(100) NOT NULL,
   NICKNAME VARCHAR2(30) NOT NULL,
   EMAIL   VARCHAR2(30) NOT NULL,
   ADDRESS VARCHAR2(200) NOT NULL,
   PHONE   VARCHAR2(30),
   ENROLL_DATE DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   USERNAME VARCHAR2(20) NOT NULL
);



CREATE TABLE LBOTM (
   BNO NUMBER PRIMARY KEY,
   pt_id   NUMBER NOT NULL,
   USERID VARCHAR2(30) NOT NULL,
   b_title VARCHAR2(100) NOT NULL,
   b_content CLOB,
   b_nickname VARCHAR2(30) NOT NULL,
   b_createdate DATE DEFAULT SYSDATE,
   BMODIFYDATE DATE DEFAULT SYSDATE,
   b_count   NUMBER   DEFAULT 0,
   ct_id   NUMBER NOT NULL
);


CREATE TABLE PAYMENT (
   PAYNO NUMBER PRIMARY KEY,
   USERID VARCHAR2(30) NOT NULL,
   p_id VARCHAR2(200) NOT NULL,
   PAYNAME VARCHAR2(100) NOT NULL,
   PAYPHONE VARCHAR2(50),
   PAYCELLPHONE VARCHAR2(50),
   PAYEMAIL VARCHAR2(50),
   RECEIVERNAME VARCHAR2(50),
   RECEIVERPHONE VARCHAR2(50),
   RECEIVERCELLPHONE VARCHAR2(50),
   PAYPRICE NUMBER,
   ORDERMEMO VARCHAR2(400),
   PAYDATE VARCHAR2(250),
   DELIVARYDATE VARCHAR(150),
   PAYRECIPE CLOB ,
   PAYADDRESS VARCHAR2(150),
   PSTATUS VARCHAR2(1) DEFAULT 'Y',
   PAYTEXT VARCHAR2(200),
   CHECKDATE DATE DEFAULT SYSDATE,
   P_NUM VARCHAR2(150),
   P_IMG VARCHAR2(300)

);



CREATE TABLE CATEGORY(
   ct_id NUMBER PRIMARY KEY,
   ct_name varchar2(30) NOT NULL
);



CREATE TABLE PRODUCTQNA (
   qna_no NUMBER PRIMARY KEY,
   qna_title VARCHAR2(30) NOT NULL,
   qna_cootent VARCHAR2(1000) NOT NULL,
   createdate DATE DEFAULT SYSDATE,
   userid VARCHAR2(30) NOT NULL
);



CREATE TABLE PRODUCTREVIEW(
   PV_ID NUMBER PRIMARY KEY,
   PV_NAME VARCHAR2(100) NOT NULL,
   PV_BUYSTATUS VARCHAR2(30) NOT NULL,
   PV_REVIEWTITLE   VARCHAR2(100) NOT NULL,
   PV_REVIEWCONTENT VARCHAR2(1000) NOT NULL,
   PV_CREATEDATE DATE DEFAULT SYSDATE,
   PV_UPDATEDATE DATE DEFAULT SYSDATE,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   p_id NUMBER NOT NULL
);


CREATE TABLE PRODUCT 
(
  P_ID NUMBER NOT NULL 
, P_NAME VARCHAR2(100 BYTE) NOT NULL 
, P_CONTENT VARCHAR2(1000 BYTE) 
, P_CREATEDATE DATE DEFAULT SYSDATE 
, P_UPDATEDATE DATE DEFAULT SYSDATE 
, P_LIKE NUMBER DEFAULT 0 NOT NULL 
, P_QUANTITY NUMBER DEFAULT 0 NOT NULL 
, P_LUNCHTYPE VARCHAR2(20 BYTE) 
, P_PRICE NUMBER NOT NULL 
, P_SELL VARCHAR2(20 BYTE) DEFAULT 'Y' 
, P_STATUS VARCHAR2(2 BYTE) DEFAULT 'Y' 
, P_COUNT NUMBER DEFAULT 0 
, CONSTRAINT SYS_C007194 PRIMARY KEY 
  (
    P_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C007194 ON PRODUCT (P_ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

COMMENT ON COLUMN PRODUCT.P_ID IS '상품아이디
';

COMMENT ON COLUMN PRODUCT.P_NAME IS '상품명';

COMMENT ON COLUMN PRODUCT.P_CONTENT IS '상품내용';

COMMENT ON COLUMN PRODUCT.P_CREATEDATE IS '등록일';

COMMENT ON COLUMN PRODUCT.P_UPDATEDATE IS '수정일';

COMMENT ON COLUMN PRODUCT.P_LIKE IS '추천';

COMMENT ON COLUMN PRODUCT.P_QUANTITY IS '수량';

COMMENT ON COLUMN PRODUCT.P_LUNCHTYPE IS '도시락타입';

COMMENT ON COLUMN PRODUCT.P_PRICE IS '가격';

COMMENT ON COLUMN PRODUCT.P_SELL IS '판매상태';

COMMENT ON COLUMN PRODUCT.P_STATUS IS '삭제여부
';

COMMENT ON COLUMN PRODUCT.P_COUNT IS '판매수량';




CREATE TABLE NOTICE(
   NNO NUMBER PRIMARY KEY,
   ID VARCHAR2(30) NOT NULL,
   NTITLE VARCHAR2(100) NOT NULL,
   NCONTENT CLOB NULL,
   NCOUNT NUMBER DEFAULT 0,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   NDATE   DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE
);



CREATE TABLE CART (
   CNO NUMBER PRIMARY KEY,
   CNAME VARCHAR2(50),
   CAMOUNT NUMBER DEFAULT 0,
   CPRICE NUMBER   NOT NULL,
   CCREATEDATE DATE DEFAULT SYSDATE,
   p_id NUMBER NOT NULL,
   ID VARCHAR2(30) NOT NULL,
   C_IMG varchar2(50)
);




CREATE TABLE PICTURELIST 
(
  PT_ID NUMBER NOT NULL 
, PT_NAME VARCHAR2(200 BYTE) NOT NULL 
, PT_REALNAME VARCHAR2(100 BYTE) NOT NULL 
, PT_CREATEDATE DATE DEFAULT SYSDATE 
, PT_UPDATEDATE DATE DEFAULT SYSDATE 
, P_ID NUMBER NOT NULL 
, PT_STATUS VARCHAR2(20 BYTE) DEFAULT 'Y' 
, PT_TYPE NUMBER NOT NULL 
, CONSTRAINT SYS_C007207 PRIMARY KEY 
  (
    PT_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C007207 ON PICTURELIST (PT_ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

ALTER TABLE PICTURELIST
ADD CONSTRAINT PICTURELIST_FK1 FOREIGN KEY
(
  P_ID 
)
REFERENCES PRODUCT
(
  P_ID 
)
ENABLE;

COMMENT ON COLUMN PICTURELIST.PT_ID IS '사진번호';

COMMENT ON COLUMN PICTURELIST.PT_NAME IS '사진명';

COMMENT ON COLUMN PICTURELIST.PT_REALNAME IS '실제이름';

COMMENT ON COLUMN PICTURELIST.PT_CREATEDATE IS '등록일';

COMMENT ON COLUMN PICTURELIST.PT_UPDATEDATE IS '수정일';

COMMENT ON COLUMN PICTURELIST.P_ID IS '상품번호';

COMMENT ON COLUMN PICTURELIST.PT_STATUS IS '삭제여부
';




CREATE TABLE COMMENTLIST(
   cm_id NUMBER PRIMARY KEY,
   nickname varchar2(30),
   cm_content varchar2(150),
   cm_createDate DATE DEFAULT SYSDATE,
   cm_updateDate DATE DEFAULT SYSDATE,
   cm_status varchar2(1) DEFAULT 'Y',
    p_id NUMBER NOT NULL,
   ct_id NUMBER NOT NULL,
   FNO NUMBER
);



CREATE TABLE GOOD (
   GOODUSER VARCHAR2(30),
   ct_id NUMBER,
   BNO NUMBER,
   FNO NUMBER,
    GOODCHECK VARCHAR2(1) DEFAULT 'N',
    CONSTRAINT GOODPRIMARY PRIMARY KEY (GOODUSER, ct_id)
);



CREATE TABLE DELIVARY(
   PAYNO NUMBER PRIMARY KEY,
   d_status varchar2(30) DEFAULT '����غ���'
);



CREATE TABLE FREE_BOARD (
   FNO NUMBER PRIMARY KEY,
   ID VARCHAR2(30) NOT NULL,
   FTITLE VARCHAR2(30),
   FCONTENT CLOB,
   FCOUNT NUMBER   DEFAULT 0,
   ENROLL_DATE DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE,
   STATUS VARCHAR2(1) DEFAULT 'Y'
);



CREATE TABLE INGREDIENTS(
   in_no NUMBER PRIMARY KEY,
   in_name varchar2(20) NOT NULL,
   in_type varchar2(20) NOT NULL,
   in_gram NUMBER NOT NULL,
   in_price NUMBER NOT NULL,
   in_createDate   DATE DEFAULT SYSDATE,
   status varchar2(1) DEFAULT 'Y'
);



CREATE TABLE MBLRECIPE (
   mbl_id NUMBER PRIMARY KEY,
   NICKNAME varchar2(30) NOT NULL,
   mbl_createDate DATE DEFAULT SYSDATE,
   mbl_updateDate DATE DEFAULT SYSDATE,
   USERID VARCHAR2(30) NOT NULL
);





CREATE TABLE PRODUCTANSWER 
(
  ANSWER_ID NUMBER NOT NULL 
, ANSWER_NAME VARCHAR2(20 BYTE) DEFAULT '운영자' 
, ANSWER_CONTENT CLOB 
, ANSWER_CREATEDATE VARCHAR2(30 BYTE) 
, P_ID NUMBER 
, QNA_ID NUMBER 
, CONSTRAINT PRODUCTANSWER_PK PRIMARY KEY 
  (
    ANSWER_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX PRODUCTANSWER_PK ON PRODUCTANSWER (ANSWER_ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL 
LOB (ANSWER_CONTENT) STORE AS SYS_LOB0000022263C00003$$ 
( 
  ENABLE STORAGE IN ROW 
  CHUNK 8192 
  RETENTION 
  NOCACHE 
  LOGGING 
  TABLESPACE SYSTEM 
  STORAGE 
  ( 
    INITIAL 65536 
    NEXT 1048576 
    MINEXTENTS 1 
    MAXEXTENTS UNLIMITED 
    FREELISTS 1 
    FREELIST GROUPS 1 
    BUFFER_POOL DEFAULT 
  )  
);

ALTER TABLE PRODUCTANSWER
ADD CONSTRAINT PRODUCTANSWER_FK1 FOREIGN KEY
(
  P_ID 
)
REFERENCES PRODUCT
(
  P_ID 
)
ENABLE;

ALTER TABLE PRODUCTANSWER
ADD CONSTRAINT PRODUCTANSWER_FK2 FOREIGN KEY
(
  QNA_ID 
, P_ID 
)
REFERENCES PRODUCTQNA
(
  QNA_ID 
, P_ID 
)
ENABLE;

COMMENT ON COLUMN PRODUCTANSWER.ANSWER_ID IS '답변 번호
';

COMMENT ON COLUMN PRODUCTANSWER.ANSWER_NAME IS '답변자';

COMMENT ON COLUMN PRODUCTANSWER.ANSWER_CONTENT IS '답변 내용';

COMMENT ON COLUMN PRODUCTANSWER.ANSWER_CREATEDATE IS '답변 날짜';

COMMENT ON COLUMN PRODUCTANSWER.P_ID IS '게시판 번호';

COMMENT ON COLUMN PRODUCTANSWER.QNA_ID IS '문의 번호';

