DROP TABLE SUB_STREAM;

DROP SEQUENCE SUB_SQ;

CREATE SEQUENCE SUB_SQ;

CREATE TABLE SUB_STREAM(
SUB_NUM NUMBER PRIMARY KEY,
MAIN_NUM NUMBER REFERENCES MAIN_STREAM(MAIN_NUM),
SUB_NAME VARCHAR2(100));

SELECT * FROM SUB_STREAM;

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