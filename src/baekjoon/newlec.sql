SELECT * FROM MEMBER_NEWLEC;

--TYPE
-- Character, Numeric, Date, TIMESTAMP

-- CHAR : 고정길이가 아닌 가변길이 데이터는 가급적 사용하지 말아야한다 (데이터 공간을 차지함)
-- VARCHAR2는 가변길이에 용이하다.
-- NCHAR 영어 숫자 뿐만이 아닌 셰계 각국의 언어들이 데이터에 들어올 경우

-- , VARCHAR2, NCHAR, NVARCHAR2
------------------------------------------------------------------------------------------1w
DROP TABLE MEMBER_NEWLEC ;

CREATE TABLE MEMBER_NEWLEC 
(
	ID 			VARCHAR2(50),
	PWD 		VARCHAR2(50),
	NAME 		VARCHAR2(50),
	GENDER		NCHAR(2),		--남성, 여성
	AGE			NUMBER(3),
	BIRTHDAY	CHAR(10),		--2000-01-02
	PHONE		CHAR(13),		-- 010-1234-2345
	REGDATE		DATE
);

--테이블 수정 삭제 추가
ALTER TABLE MEMBER_NEWLEC MODIFY ID NVARCHAR2(50);	-- 수정
ALTER TABLE MEMBER_NEWLEC DROP COLUMN AGE;			-- 삭제
ALTER TABLE MEMBER_NEWLEC ADD EMAIL VARCHAR2(200);	-- 추가
--

SELECT *FROM MEMBER_NEWLEC mn ;

INSERT INTO MEMBER_NEWLEC(GENDER) VALUES('남성');

SELECT LENGTHB(GENDER) FROM MEMBER_NEWLEC mn ;

SELECT * FROM MEMBER_NEWLEC ;

SELECT LENGTHB('AB') FROM DUAL;
SELECT LENGTHB('한글') FROM DUAL;		-- 글자 하나당 3BYTE를 사용했다는 뜻
SELECT * FROM NLS_DATABASE_PARAMETERS;		-- 각국의 언어가 얼만큼의 바이트를 사용하는지 알수 있다.

-- LONG		2Gb (char형식)
-- CLOB		대용량 텍스트 데이터 타입(최대 4Gbyte)
-- NCLOB	대용량 텍스트 유니코드 데이터 타입(최대 4Gbyte)
-- 숫자형
-- NUMBER	정수와 실수를 모두 다룸		(6,6)<- 소수점 6자리까지
--			아무것도 쓰지 않을 경우 38이 들어간다.
-- DATE			년,월,일
-- TIMESTAMP	년,월,일,시,분,초
------------------------------------------------------------------------------------------
SELECT * FROM MEMBER_NEWLEC;

CREATE TABLE notice_newlec
(
	ID			NUMBER,
	TITLE		NVARCHAR2(100),
	WRITER_ID	NVARCHAR2(50),
	CONTENT		CLOB,
	REGDATE		TIMESTAMP,
	HIT			NUMBER,
	FILES		NVARCHAR2(1000)
);

CREATE TABLE ROLE_NEWLEC
(
	ID			NVARCHAR2(50),
	DISCRIPTION	NVARCHAR2(500)
);

CREATE TABLE COMMENT_NEWLEC
(
	ID			NUMBER,
	CONTENT		NVARCHAR2(2000),
	REGDATE		TIMESTAMP,
	WRITER_ID	NVARCHAR2(50),
	NOTICE_ID	NUMBER
);
CREATE TABLE MEMBER_ROLE_NEWLEC
(
	MEMBER_ID	NVARCHAR2(50),
	ROLE_ID		VARCHAR2(50)
);
















