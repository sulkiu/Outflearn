DROP
	TABLE
		SUBSCRIBE;

CREATE
	TABLE
		SUBSCRIBE(
		USER_NUM NUMBER REFERENCES USER_INFO(USER_NUM),
		CLASS_NUM NUMBER REFERENCES CLASS_INFO(CLASS_NUM)
		);

SELECT * FROM SUBSCRIBE;

INSERT INTO SUBSCRIBE VALUES(1,1);
INSERT INTO SUBSCRIBE VALUES(1,2);
INSERT INTO SUBSCRIBE VALUES(1,3);

INSERT INTO SUBSCRIBE VALUES(2,1);

DELETE FROM SUBSCRIBE;

SELECT * FROM CLASS_INFO WHERE CLASS_NUM IN(SELECT CLASS_NUM FROM SUBSCRIBE WHERE USER_NUM = 2);
------==================
select *
from 
(select user_num from class_info where class_num = 2) a full outer join
(select user_num from basket where class_num = 2) b using(user_num);

select class_num from class_info where class_num=1000;
--SUBSCRIBE/BASKET TABLE을 사용해야한다
SELECT CLASS_NUM FROM SUBSCRIBE WHERE USER_NUM = 1;
SELECT CLASS_NUM FROM BASKET WHERE USER_NUM=1;

SELECT * FROM 
(SELECT CLASS_NUM FROM SUBSCRIBE WHERE USER_NUM = 1)a FULL OUTER JOIN
(SELECT CLASS_NUM FROM BASKET WHERE USER_NUM=1)b USING(CLASS_NUM);

