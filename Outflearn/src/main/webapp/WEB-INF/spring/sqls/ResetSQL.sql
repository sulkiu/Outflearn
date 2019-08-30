----------------------------------------------
--------------------------------------UserInfo
----------------------------------------------

DROP TABLE USER_INFO;

DROP SEQUENCE USER_INFO_SQ;

CREATE SEQUENCE USER_INFO_SQ;

CREATE TABLE USER_INFO(
USER_NUM NUMBER PRIMARY KEY, 
USER_ID VARCHAR2(1000) NOT NULL UNIQUE, -- idp 크기변경
USER_PW VARCHAR2(1000) NOT NULL, -- pw 크기변경
--USER_NAME VARCHAR2(1000) NOT NULL, -- 이름 v 크기변경 / 0802 삭제 
USER_NICKNAME VARCHAR2(1000) NOT NULL, -- 닉네임 v 크기변경 
USER_AUTHORITY VARCHAR2(10) DEFAULT 'ROLE_USER' NOT NULL, -- 등급 컬럼명 변경, 컬럼 값 이름 변경 
USER_EMAIL VARCHAR2(100) NOT NULL UNIQUE, --이메일 v
USER_ENABLED NUMBER(1) DEFAULT 1 NOT NULL, -- 계정 활성/비활성 컬럼 추가  활성화: 1 비활성화 : 0
CONSTRAINT authority_chk CHECK (USER_AUTHORITY IN ('ROLE_USER','ROLE_ADMIN','ROLE_TUTOR')));

----------------------------------------------
--------------------------------------ClassInfo
----------------------------------------------

DROP TABLE CLASS_INFO;

DROP SEQUENCE CLASS_INFO_SQ;

CREATE SEQUENCE CLASS_INFO_SQ;

CREATE TABLE CLASS_INFO(
CLASS_NUM NUMBER PRIMARY KEY NOT NULL,
USER_NUM REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
CLASS_TITLE VARCHAR2(250) NOT NULL,
CLASS_AUTHOR VARCHAR2(50) NOT NULL,
CLASS_INTRO VARCHAR2(4000),
CLASS_IMG CLOB,
CLASS_LIVE VARCHAR2(1) DEFAULT 'N' NOT NULL CHECK(CLASS_LIVE IN('Y', 'N','y','n')),
CLASS_RATING NUMBER  DEFAULT 0,
CLASS_PRICE NUMBER  DEFAULT 0,
CLASS_SUBCOUNT NUMBER DEFAULT 0,
CLASS_STUDENTLEVEL VARCHAR2(200) NOT NULL
);

----------------------------------------------
--------------------------------------Subscribe
----------------------------------------------

DROP
	TABLE
		SUBSCRIBE;

CREATE
	TABLE
		SUBSCRIBE(USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE,
		CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE
		);

----------------------------------------------
--------------------------------------Basket
----------------------------------------------

DROP TABLE BASKET;

CREATE TABLE BASKET(
USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL ,
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL 
);

----------------------------------------------
--------------------------------------ClassReview
----------------------------------------------

DROP TABLE CLASS_REVIEW;
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

----------------------------------------------
--------------------------------------ClassDate
----------------------------------------------

DROP TABLE CLASS_DATA;

DROP SEQUENCE DATA_CHAPTER_SQ;

CREATE SEQUENCE DATA_CHAPTER_SQ;

CREATE TABLE CLASS_DATA(
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
DATA_CHAPTER NUMBER NOT NULL,
DATA_SUBHEAD VARCHAR2(250) DEFAULT '소제목',
DATA_SQ NUMBER NOT NULL,
DATA_TITLE VARCHAR2(250) DEFAULT '타이틀',
DATA_DATA CLOB DEFAULT '영상' 
);

----------------------------------------------
--------------------------------------ClassIntroduce
----------------------------------------------

DROP TABLE CLASS_INTRODUCE;

CREATE TABLE CLASS_INTRODUCE(
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
CLASS_CONTENT CLOB NOT NULL
)

----------------------------------------------
--------------------------------------QA
----------------------------------------------

DROP TABLE QA;
-- 글 번호 시퀀스 ( 삭제 )
DROP SEQUENCE QA_NUM_SQ;
-- 그룹 번호 시퀀스 ( 삭제 )
DROP SEQUENCE QA_GROUP_NO_SQ;


-- 글 번호 시퀀스
CREATE SEQUENCE QA_NUM_SQ;
-- 그룹 번호 시퀀스
CREATE SEQUENCE QA_GROUP_NO_SQ;

CREATE TABLE QA(
   QA_NUM NUMBER PRIMARY KEY,
   CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE NOT NULL,
   USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE NOT NULL,
   USER_NICKNAME VARCHAR2(50) NOT NULL,
   QA_TITLE VARCHAR2(500) NOT NULL,
   QA_CONTENT VARCHAR2(4000) NOT NULL,
   QA_GROUP_NO NUMBER NOT NULL,
   QA_GROUP_SQ NUMBER NOT NULL
);

----------------------------------------------
--------------------------------------MainStream
----------------------------------------------

DROP TABLE MAIN_STREAM;

DROP SEQUENCE MAIN_SQ;

CREATE SEQUENCE MAIN_SQ;

CREATE TABLE MAIN_STREAM(
MAIN_NUM NUMBER NOT NULL PRIMARY KEY,
MAIN_NAME VARCHAR2(100) NOT NULL
);

INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '서버');
INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '웹 개발');
INSERT INTO MAIN_STREAM VALUES(MAIN_SQ.NEXTVAL, '데이터베이스');

----------------------------------------------
--------------------------------------SubStream
----------------------------------------------

DROP TABLE SUB_STREAM;

DROP SEQUENCE SUB_SQ;

CREATE SEQUENCE SUB_SQ;

CREATE TABLE SUB_STREAM(

SUB_NUM NUMBER PRIMARY KEY,
MAIN_NUM NUMBER REFERENCES MAIN_STREAM(MAIN_NUM) ON DELETE CASCADE,
SUB_NAME VARCHAR2(100));


INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 1, 'Back End');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 1, 'Linux');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 1, 'Node.js');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 1, 'Express.js');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 1, 'C#');

INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'Front End');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'html/css');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'javascript');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'Angular');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'React.js');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 2, 'Vue.js');

INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 3, 'Oracle');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 3, 'PL/SQL');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 3, 'MySQL');
INSERT INTO SUB_STREAM VALUES(SUB_SQ.NEXTVAL, 3, 'MongoDB');

----------------------------------------------
--------------------------------------ClassCategory
----------------------------------------------

DROP TABLE CLASS_CATEGORY;


CREATE TABLE CLASS_CATEGORY(
	CLASS_NUM NUMBER PRIMARY KEY REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE,
	MAIN_NUM NUMBER REFERENCES MAIN_STREAM(MAIN_NUM),
	SUB_NUM NUMBER REFERENCES SUB_STREAM(SUB_NUM)
);


----------------------------------------------
--------------------------------------RoadMapInfo
----------------------------------------------

DROP TABLE ROADMAP_INFO;
DROP SEQUENCE ROADMAP_SQ;

CREATE SEQUENCE ROADMAP_SQ;

CREATE TABLE ROADMAP_INFO(

ROADMAP_NUM NUMBER PRIMARY KEY, --NEW
USER_NUM NUMBER NOT NULL REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE, --USER_INFO : USER_NUM
ROADMAP_TITLE VARCHAR2(1000) NOT NULL, --NEW
ROADMAP_CONTENT CLOB, --NEW
ROADMAP_SUBSCRIBE NUMBER DEFAULT 0 NOT NULL, --NEW 
ROADMAP_LIKE NUMBER DEFAULT 0 NOT NULL, --NEW
ROADMAP_SHARE NUMBER DEFAULT 0 NOT NULL, --NEW
MAIN_NUM NUMBER NOT NULL REFERENCES MAIN_STREAM(MAIN_NUM) ON DELETE CASCADE --MAIN STREAM :MAIN_NUM
);

----------------------------------------------
--------------------------------------RoadMapCon
----------------------------------------------

DROP TABLE ROADMAP_CON;

CREATE TABLE ROADMAP_CON(
CLASS_NUM NUMBER NOT NULL REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE, 
ROADMAP_NUM NUMBER NOT NULL REFERENCES ROADMAP_INFO(ROADMAP_NUM) ON DELETE CASCADE,
ROADMAP_CUE NUMBER NOT NULL 
);

----------------------------------------------
--------------------------------------RoadMapSubscibe
----------------------------------------------

DROP TABLE ROADMAP_SUBSCRIBE ;

CREATE TABLE ROADMAP_SUBSCRIBE (
USER_NUM NUMBER NOT NULL REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE,
ROADMAP_NUM NUMBER NOT NULL REFERENCES ROADMAP_INFO(ROADMAP_NUM) ON DELETE CASCADE
);

----------------------------------------------
--------------------------------------Live
----------------------------------------------

DROP TABLE LIVE;

DROP SEQUENCE LIVE_SQ;

CREATE SEQUENCE LIVE_SQ;

CREATE TABLE LIVE(LIVE_NUM NUMBER PRIMARY KEY,
CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE,
LIVE_TITLE VARCHAR2(100),
LIVE_AUTHOR VARCHAR2(100) NOT NULL,
LIVE_TIME VARCHAR2(50)
);

----------------------------------------------
--------------------------------------ReqLecturer
----------------------------------------------


DROP TABLE REQ_LECTURER

DROP SEQUENCE REQ_SQ;

CREATE SEQUENCE REQ_SQ;

CREATE TABLE REQ_LECTURER(REQ_NUM NUMBER PRIMARY KEY,
USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM) ON DELETE CASCADE,
REQ_PHONE VARCHAR2(500),
REQ_PR VARCHAR2(4000),
REQ_CLASS VARCHAR2(4000));
