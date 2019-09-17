
grant create view to FinalPro; 

**************뷰권한 **************************



CREATE SEQUENCE SEQ_MEM 
START WITH 100000;



CREATE SEQUENCE SEQ_CART 
START WITH 100000;
 
  CREATE OR REPLACE VIEW MEMBERLIST AS SELECT ROWNUM RNUM,USERID,NICKNAME,USERNAME,EMAIL,ADDRESS,PHONE,ENROLL_DATE,MODIFY_DATE,STATUS
  FROM MEMBER;
    
    
select *
from memberlist
where status ='Y' and userid like '%ad%'
and enroll_date between '2019-09-05' and to_date('2019-09-05')+1;


insert into cart values(seq_cart.nextval,'노맛도시락',2,4500,sysdate,111,'admin');

select *
from cart



************************************
DROP SEQUENCE SEQ_PRODUCT;
CREATE SEQUENCE SEQ_PRODUCT
    START WITH 1000000;

drop table payment_product;
CREATE TABLE PAYMENT_PRODUCT(
   PNO NUMBER PRIMARY KEY,
   ppno varchar2(50),
   PNAME VARCHAR2(150),
   PAMOUNT NUMBER DEFAULT 0,
   PPRICE NUMBER   NOT NULL,
   PCREATEDATE DATE DEFAULT SYSDATE,
   ID VARCHAR2(30) NOT NULL,
   TOTALPRICE NUMBER
    );
    
    
    
    
DROP TABLE PAYMENT;

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





CREATE SEQUENCE SEQ_PAYMENT;

