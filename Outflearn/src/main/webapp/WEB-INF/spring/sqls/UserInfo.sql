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

SELECT * FROM USER_INFO;
DELETE FROM USER_INFO WHERE USER_NICKNAME = '윤회';
	SELECT
		USER_ID as username,
		USER_PW as password,
		USER_ENABLED as enabled,
		USER_AUTHORITY as authority,
		USER_NUM, USER_NICKNAME, USER_EMAIL 
	FROM USER_INFO
	WHERE USER_ID='qwqw';
	
	--tutuor
	UPDATE USER_INFO SET USER_AUTHORITY='ROLE_TUTOR' WHERE USER_ID='qwqw';
	--admin
	UPDATE USER_INFO SET USER_AUTHORITY='ROLE_TUTOR' WHERE USER_ID='qwqw';

	
	
--INSERT INTO USER_INFO VALUES(USER_INFO_SQ.NEXTVAL, 'user','1234','testName','testNick','USER','sunwoong1995@naver.com');

--enabled 휴면계정 여부 1이면 사용가능 0이면 사용 불가능

DELETE FROM USER_INFO;
