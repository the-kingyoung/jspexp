-- 집계함수
SELECT WRITER_ID, COUNT(ID) FROM NOTICE_NEWLEC 
GROUP BY WRITER_ID 
HAVING COUNT(ID)<2;
SELECT * FROM NOTICE_NEWLEC nn ;


-- ROU_NUMBER(), RANK(), DENSE_RANK()

SELECT ROW_NUMBER() OVER (ORDER BY HIT), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE_NEWLEC;
SELECT DENSE_RANK() OVER (PARTITION BY WRITER_ID ORDER BY HIT DESC), ID, TITLE, WRITER_ID, REGDATE, HIT
FROM NOTICE_NEWLEC;
--PARTITION BY WRITER_ID  그룹 함수 중에서 순위를 매긴다.

-- 부조회(서브쿼리)
SELECT * FROM NOTICE_NEWLEC WHERE ROWNUM BETWEEN 1 AND 5;
SELECT * FROM NOTICE_NEWLEC ORDER BY REGDATE WHERE ROWNUM BETWEEN 1 AND 5; --ERROR

SELECT * FROM (SELECT * FROM NOTICE_NEWLEC ORDER BY REGDATE DESC)
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT * FROM MEMBER_NEWLEC
WHERE AGE >= (SELECT AVG(AGE) FROM MEMBER_NEWLEC);

--조인 join
--데이터의 무결성

SELECT * FROM MEMBER_NEWLEC mn ;
SELECT * FROM NOTICE_NEWLEC nn ;

SELECT 
	* 
FROM MEMBER_NEWLEC MN 
INNER JOIN NOTICE_NEWLEC NN
ON MN.ID = NN.WRITER_ID ;






















