-- SQL이란 ?
-- DBMS에게 질의하는 명령어, 중복을 없애는 방법으로 결함을 줄임

--DDL(create/alter/drop)
--DML(select/insert/update/delete)
--DCL(grant/revoke)

INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('newlec','111');
INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('dragon','111');
INSERT INTO MEMBER_NEWLEC(ID, PWD) VALUES('test','111');
INSERT INTO MEMBER_NEWLEC (PWD,ID) VALUES('111','newlec');
COMMIT;
ROLLBACK;

SELECT * FROM MEMBER_NEWLEC;
SELECT ID "USER ID", NAME, PWD FROM MEMBER_NEWLEC mn ;

UPDATE MEMBER_NEWLEC SET PWD='222', NAME='손오공' WHERE ID='dragon' ;
DELETE MEMBER_NEWLEC WHERE ID='test';

-- 트랜잭션이란? 업무 실행단위 / 논리 명령단위 / 개념상의	--> commit , rollback 	복습