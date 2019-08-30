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
COMMENT_CONTENT VARCHAR2(4000) NOT NULL,
COMMENT_GROUPNO NUMBER NOT NULL,
COMMENT_GROUPSQ NUMBER NOT NULL,
COMMENT_TITLETAB NUMBER NOT NULL
)

SELECT * FROM ROADMAP_COMMENT;

INSERT INTO ROADMAP_COMMENT
VALUES(COMMENT_NUM_SQ.NEXTVAL,5, 1, 'TEST01', COMMENT_GROUPNO_SQ.NEXTVAL,1,0);

SELECT * FROM ROADMAP_COMMENT WHERE ROADMAP_NUM = 4;

SELECT R.COMMENT_NUM, R.ROADMAP_NUM, R.USER_NUM, R.COMMENT_CONTENT, R.COMMENT_GROUPNO, R.COMMENT_GROUPSQ, R.COMMENT_TITLETAB, U.USER_NICKNAME
		FROM ROADMAP_COMMENT R, USER_INFO U
		WHERE R.USER_NUM = U.USER_NUM
		AND R.ROADMAP_NUM=5;

UPDATE ROADMAP_COMMENT SET COMMENT_CONTENT = '이렇게수정해조' WHERE COMMENT_NUM=1;