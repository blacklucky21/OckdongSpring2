delete from MBLRECIPE;

Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (9,'4찬 만듬1','admin','266/293/271/286','d016e47f-ed99-4ebf-a99b-6a07b40dd6f4.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (10,'4찬 완성','admin','267/293/271/286','67b7c915-2cad-4a81-b05f-a9952be3e6ed.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (11,'5찬 완성','admin','315/355/317/334/347','3fe58fec-a1bd-46c8-83f7-1bac20d5e271.png',to_date('19/09/18','RR/MM/DD'),'5찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (12,'5찬','admin','315/354/319/333/346','db1b6efe-ea55-404a-8466-5033a2a0f160.png',to_date('19/09/18','RR/MM/DD'),'5찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (13,'최경천 님이 만든 나만의 도시락 입니다.','ckc5749','266/293/271/286','bab043ee-a2ed-458c-bf8d-f8f8abb20e84.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (14,'경천''s 5찬','ckc5749','310/355/316/336/347','ffbb30da-ddca-4deb-b66b-e2fc67e1750d.png',to_date('19/09/18','RR/MM/DD'),'5찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (15,'123123','admin','265/294/272/285','e5302cc5-e708-4a43-b5e2-de5d7639773f.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (8,'나만의 도시락 4찬 수정본','admin','266/294/271/286','d180d89d-d103-426f-8d32-43e2cbbd32c7.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (16,'555555','admin','313/357/317/340/347','9b6adb48-12b4-475a-8b17-dc8077b951d2.png',to_date('19/09/18','RR/MM/DD'),'5찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (17,'242354235324525','admin','266/294/272/288','49c2297a-6bfa-4500-af7b-de8167dc40e6.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (18,'ㅎㅎㅎㅎㅇㅀㄴㅇㅎ','admin','310/355/316/334/346','b5c82f1d-ab94-49cb-881c-a6622c06aca5.png',to_date('19/09/18','RR/MM/DD'),'5찬','Y');
Insert into MBLRECIPE (MBL_ID,MBL_TITLE,USERID,NUMBERS,MBL_FILENAME,MBL_CREATEDATE,MBL_TYPE,STATUS) values (19,'ㅎㅇㅎㅇ','admin','266/293/271/286','7fe2686c-88c5-4320-9a26-854db33ecefc.png',to_date('19/09/18','RR/MM/DD'),'4찬','Y');


commit;

select count(*) from MBLRECIPE;