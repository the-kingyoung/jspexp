-- ###정규식###

SELECT * FROM NOTICE_NEWLEC nn ;
SELECT * FROM NOTICE_NEWLEC WHERE REGEXP_LIKE(TITLE,'01[016-9]-\d{3,4}-\d{4}');
--010-2222-3333
--011-333-4444
--016-234-4353
--017-444-5555
--018-123-2345
--019-232-2345
^01[016-9]-\d{3,4}-\d{4}$

--[0-9a-zA-Z] = \w
--* => 0개 이상
--+ => 1개 이상
--\D\w*@\Dw*.[org|net|com]
SELECT * FROM NOTICE_NEWLEC;
SELECT * FROM MEMBER_NEWLEC mn ;





INSERT INTO NOTICE_NEWLEC(ID, TITLE, WRITER_ID, CONTENT, REGDATE, HIT, FILES)
VALUES('7','선반-접시-그릇 이 세가지요~~', 'okay', '연락처를 남깁니다.', sysdate, 23,'');

