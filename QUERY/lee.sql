CREATE TABLE NOTICE(
   NNO NUMBER PRIMARY KEY,
   ID VARCHAR2(30) NOT NULL,
   NTITLE VARCHAR2(100) NOT NULL,
   NCONTENT CLOB NULL,
   NCOUNT NUMBER DEFAULT 0,
   STATUS VARCHAR2(1) DEFAULT 'Y',
   NDATE   DATE DEFAULT SYSDATE,
   MODIFY_DATE DATE DEFAULT SYSDATE
   NICKNAME VARCHAR2(30) NOT NULL -- 추가 -- 
);

CREATE TABLE COMMENTS(
    COMMENTS_NO NUMBER PRIMARY KEY,
    COMMENTS_CONTENT CLOB NOT NULL,
    NNO NUMBER NOT NULL,
    USERID NUMBER NOT NULL,
    COMMENTS_DATE DATE NOT NULL,
    COMMENTS_STATUS NUMBER DEFAULT 'Y' NOT NULL,
    FOREIGN KEY (USERID) REFERENCES MEMBER(USERID),
    FOREIGN KEY (NNO) REFERENCES BOARD(NNO)
);

CREATE SEQUENCE SEQ_COMMENTS_NO;

DROP TABLE NOTICE;
DROP TABLE COMMENTS;