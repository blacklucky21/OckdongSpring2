DROP TABLE MBLRECIPE;

CREATE TABLE MBLRECIPE(
    MBL_ID NUMBER PRIMARY KEY,
    MBL_TITLE VARCHAR2(30) NOT NULL,
    USERID VARCHAR2(30) NOT NULL,
    NUMBERS VARCHAR2(40) NOT NULL,
    MBL_FILENAME VARCHAR2(200) NOT NULL,
    MBL_CREATEDATE DATE DEFAULT SYSDATE,
    MBL_TYPE VARCHAR2(20) NOT NULL
);

COMMIT;