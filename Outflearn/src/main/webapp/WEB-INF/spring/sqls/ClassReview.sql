------------------------------------------ 강좌후기
DROP TABLE CLASS_REVIEW
--글 번호 시퀀스(일반적인 번호)
DROP SEQUENCE REVIEW_NUM_SQ;
--그룹번호 시퀀스(답글이 달렸을 때 )
DROP SEQUENCE REVIEW_GROUPNO_SQ;

--글 번호 시퀀스(일반적인 번호)
CREATE SEQUENCE REVIEW_NUM_SQ;

--그룹번호 시퀀스(답글이 달렸을 때 )
CREATE SEQUENCE REVIEW_GROUPNO_SQ;


CREATE TABLE CLASS_REVIEW(
REVIEW_NUM NUMBER PRIMARY KEY,
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
REVIEW_CONTENT VARCHAR2(4000) NOT NULL,
USER_STAR NUMBER DEFAULT 1 NOT NULL ,
REVIEW_GROUPNO NUMBER NOT NULL,
REVIEW_GROUPSQ NUMBER NOT NULL,
REVIEW_TITLETAB NUMBER NOT NULL
)

INSERT INTO CLASS_REVIEW VALUES(REVIEW_NUM_SQ.NEXTVAL ,1, 1, '내용' ,5 , 1 ,1, 0)

SELECT * FROM CLASS_REVIEW

-------------------------- 대댓글
INSERT INTO CLASS_REVIEW VALUES(1,BOARD_NO_SQ.NEXTVAL,
										(SELECT QA_GROUPNO FROM CLASS_REVIEW WHERE BOARD_NO= 13),
									    (SELECT QA_GROUPSQ FROM CLASS_REVIEW WHERE BOARD_NO= 13)+1, 
									    (SELECT QA_TITLETAB FROM CLASS_REVIEW WHERE BOARD_NO= 13)+1,  
									    1, '이제제발좀', 5, '성공하자') 
									    
									
									   SELECT QA_GROUPNO FROM CLASS_REVIEW WHERE BOARD_NO= 1