DROP TABLE CLASS_CATEGORY;

CREATE TABLE CLASS_CATEGORY(
	CLASS_NUM NUMBER PRIMARY KEY REFERENCES CLASS_INFO(CLASS_NUM) ON DELETE CASCADE,
	MAIN_NUM NUMBER REFERENCES MAIN_STREAM(MAIN_NUM),
	SUB_NUM NUMBER REFERENCES SUB_STREAM(SUB_NUM)
);

SELECT * FROM CLASS_CATEGORY;

INSERT INTO CLASS_CATEGORY VALUES(1,1,1);
INSERT INTO CLASS_CATEGORY VALUES (2,1,2);

INSERT INTO CLASS_CATEGORY VALUES (7,1,2);
INSERT INTO CLASS_CATEGORY VALUES (8,1,2);
INSERT INTO CLASS_CATEGORY VALUES (9,1,2);

SELECT CLASS_NUM FROM CLASS_CATEGORY WHERE SUB_NUM=1;

		INSERT INTO CLASS_CATEGORY VALUES(CLASS_INFO_SQ.CURRVAL , #{, SUB_SQ.CURRVAL)
		
SELECT SUB_NUM FROM CLASS_CATEGORY WHERE CLASS_NUM=1		
