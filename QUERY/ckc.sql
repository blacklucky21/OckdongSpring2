DROP TABLE MBLRECIPE;
DROP TABLE INGREDIENTS;

CREATE TABLE MBLRECIPE (
  MBL_ID NUMBER PRIMARY KEY,
  MBL_TITLE VARCHAR2(100 BYTE) NOT NULL,
  USERID VARCHAR2(30 BYTE) NOT NULL,
  NUMBERS VARCHAR2(50 BYTE) NOT NULL,
  MBL_FILENAME VARCHAR2(200 BYTE) NOT NULL,
  MBL_CREATEDATE DATE DEFAULT SYSDATE,
  MBL_TYPE VARCHAR2(20 BYTE) NOT NULL,
  STATUS VARCHAR2(1 BYTE) DEFAULT 'Y'
);

CREATE TABLE INGREDIENTS (
  IN_NO NUMBER PRIMARY KEY,
  IN_NAME VARCHAR2(40 BYTE) NOT NULL,
  IN_TYPE VARCHAR2(20 BYTE) NOT NULL,
  IN_GRAM NUMBER NOT NULL,
  IN_CREATEDATE DATE DEFAULT SYSDATE,
  STATUS VARCHAR2(1 BYTE) DEFAULT 'Y',
  IN_ORIGINALFILE VARCHAR2(100 BYTE) NOT NULL,
  IN_RENAMEFILE VARCHAR2(100 BYTE) NOT NULL
);

CREATE SEQUENCE SEQ_MBLRECIPE;
  
COMMIT;



