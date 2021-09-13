SELECT * FROM MEMBER_NEWLEC;

--TYPE
-- Character, Numeric, Date, TIMESTAMP

-- CHAR : 고정길이가 아닌 가변길이 데이터는 가급적 사용하지 말아야한다 (데이터 공간을 차지함)
-- VARCHAR2는 가변길이에 용이하다.
-- NCHAR 영어 숫자 뿐만이 아닌 셰계 각국의 언어들이 데이터에 들어올 경우

-- , VARCHAR2, NCHAR, NVARCHAR2
------------------------------------------------------------------------------------------
DROP TABLE MEMBER_NEWLEC ;

CREATE TABLE MEMBER_NEWLEC 
(
	ID 			VARCHAR2(50),
	PWD 		VARCHAR2(50),
	GENDER		NCHAR(2),		--남성, 여성
	AGE			NUMBER,
	BIRTHDAY	CHAR(10),		--2000-01-02
	PHONE		CHAR(13),		-- 010-1234-2345
	REGDATE		DATE
);


INSERT INTO MEMBER_NEWLEC(GENDER) VALUES('남성');

SELECT LENGTHB(GENDER) FROM MEMBER_NEWLEC mn ;

SELECT * FROM MEMBER_NEWLEC ;

SELECT LENGTHB('AB') FROM DUAL;
SELECT LENGTHB('한글') FROM DUAL;		-- 글자 하나당 3BYTE를 사용했다는 뜻
SELECT * FROM NLS_DATABASE_PARAMETERS;		-- 각국의 언어가 얼만큼의 바이트를 사용하는지 알수 있다. 복습