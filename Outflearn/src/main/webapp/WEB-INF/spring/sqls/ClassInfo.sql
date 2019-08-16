------------------------------------------ 강좌 정보
------------------------------------------ DROP 할때는 ClassIntroduce랑 ClassData 먼저 DROP시켜야된다.
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

SELECT * FROM CLASS_INFO;

INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL,2 , '제목', '강사명','강좌소개','이미지','Y',0,0,0,'상급자','대분류','중분류','소분류');
INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL,2 , '제목2', '강사명2','강좌소개2','이미지2','Y',0,0,0,'상급자','대분류','중분류','소분류');
INSERT INTO CLASS_INFO VALUES(CLASS_INFO_SQ.NEXTVAL,1 , '제목1', '강사명3','강좌소개','이미지','Y',0,0,0,'상급자')
