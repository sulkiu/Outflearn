------------------------------------------ 로드맵
DROP TABLE ROADMAP_COMMENT;
--글 번호 시퀀스(일반적인 번호)
DROP SEQUENCE COMMENT_NUM_SQ;
--그룹번호 시퀀스(답글이 달렸을 때 )
DROP SEQUENCE COMMENT_GROUPNO_SQ;

--글 번호 시퀀스(일반적인 번호)
CREATE SEQUENCE COMMENT_NUM_SQ;

--그룹번호 시퀀스(답글이 달렸을 때 )
CREATE SEQUENCE COMMENT_GROUPNO_SQ;


CREATE TABLE ROADMAP_COMMENT(
COMMENT_NUM NUMBER PRIMARY KEY,
ROADMAP_NUM NUMBER REFERENCES ROADMAP_INFO(ROADMAP_NUM) ON DELETE CASCADE NOT NULL,
USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
COMMENT_CONTENT VARCHAR2(4000),
COMMENT_GROUPNO NUMBER NOT NULL,
COMMENT_GROUPSQ NUMBER NOT NULL,
COMMENT_TITLETAB NUMBER NOT NULL
)

SELECT COMMENT_GROUPNO FROM ROADMAP_COMMENT WHERE ROADMAP_NUM = 40 AND COMMENT_NUM = 1;

SELECT COUNT(*) FROM ROADMAP_COMMENT WHERE ROADMAP_NUM = 40 AND COMMENT_GROUPNO = 1;

INSERT INTO ROADMAP_COMMENT
VALUES(COMMENT_NUM_SQ.NEXTVAL,5, 1, 'TEST01', COMMENT_GROUPNO_SQ.NEXTVAL,1,0);
-- 업데이트 후 인서트해줘야함 

--그룹SQ업데이트
UPDATE ROADMAP_COMMENT SET COMMENT_GROUPSQ = COMMENT_GROUPSQ + 1
WHERE COMMENT_GROUPNO = (SELECT COMMENT_GROUPNO FROM ROADMAP_COMMENT WHERE COMMENT_NUM = 58)
AND COMMENT_GROUPSQ > (SELECT COMMENT_GROUPSQ FROM ROADMAP_COMMENT WHERE COMMENT_NUM=58)

-- 대댓 인서트
INSERT INTO ROADMAP_COMMENT
VALUES (COMMENT_NUM_SQ.NEXTVAL, 40 , 1, 'TEST01',(SELECT COMMENT_GROUPNO FROM ROADMAP_COMMENT WHERE COMMENT_NUM=9),
		(SELECT COMMENT_GROUPSQ FROM ROADMAP_COMMENT WHERE COMMENT_NUM=9)+1,
		(SELECT COMMENT_TITLETAB FROM ROADMAP_COMMENT WHERE COMMENT_NUM=9)+1 )




SELECT * FROM ROADMAP_COMMENT ORDER BY COMMENT_GROUPNO DESC, COMMENT_GROUPSQ ASC;

INSERT INTO ROADMAP_COMMENT
VALUES(COMMENT_NUM_SQ.NEXTVAL,5, 1, 'TEST01', COMMENT_GROUPNO_SQ.NEXTVAL,1,0);

SELECT * FROM ROADMAP_COMMENT WHERE ROADMAP_NUM = 4;

SELECT R.COMMENT_NUM, R.ROADMAP_NUM, R.USER_NUM, R.COMMENT_CONTENT, R.COMMENT_GROUPNO, R.COMMENT_GROUPSQ, R.COMMENT_TITLETAB, U.USER_NICKNAME
		FROM ROADMAP_COMMENT R, USER_INFO U
		WHERE R.USER_NUM = U.USER_NUM
		AND R.ROADMAP_NUM=5
		ORDER BY R.COMMENT_GROUPNO DESC, R.COMMENT_GROUPSQ ASC ;

UPDATE ROADMAP_COMMENT SET COMMENT_CONTENT = '이렇게수정해조' WHERE COMMENT_NUM=1;

DELETE FROM ROADMAP_COMMENT WHERE COMMENT_NUM = 1;



