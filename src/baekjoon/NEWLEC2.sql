-- SQL이란 ?
-- DBMS에게 질의하는 명령어, 중복을 없애는 방법으로 결함을 줄임

--DDL(create/alter/drop)
--DML(select/insert/update/delete)
--DCL(grant/revoke)

INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('newlec','111');
INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('dragon','111');
INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('test','111');
INSERT INTO MEMBER_NEWLEC (PWD,ID) VALUES('111','newlec');

SELECT * FROM MEMBER_NEWLEC;

UPDATE MEMBER_NEWLEC SET PWD='333', NAME='손오공' WHERE ID='dragon' ;
DELETE MEMBER_NEWLEC WHERE ID='test';

