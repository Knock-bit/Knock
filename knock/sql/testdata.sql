-- USERS DATA


INSERT INTO KNOCKTEST.USERS (USER_IDX, USER_ID, NAME, PWD, NICKNAME, EMAIL, PHONE, BIRTH, TOTAL_POINT, USED_POINT, KNOCK_ADMIN, KNOCK_ACTIVE, GENDER, ADDRESS, USER_IMG, JOINDATE, LAST_LOGIN_DATE)
                    VALUES (1, 'admin', '관리자1', '1234', '관리자1번', 'admin1@googlecom', '01012341234', sysdate, 1000, 0, '0', '1', '1', '인천시 계양구 작전동', '경로경로', sysdate, null);

INSERT INTO KNOCKTEST.USERS (USER_IDX, USER_ID, NAME, PWD, NICKNAME, EMAIL, PHONE, BIRTH, TOTAL_POINT, USED_POINT, KNOCK_ADMIN, KNOCK_ACTIVE, GENDER, ADDRESS, USER_IMG, JOINDATE, LAST_LOGIN_DATE)
                    VALUES (2, 'test1', '테스트1', '1234', '테스트1번', 'test1@googlecom', '01011111111', sysdate, 1000, 0, '1', '1', '1', '인천시 계양구 서운동', '경로경로', sysdate, null);


INSERT INTO KNOCKTEST.USERS (USER_IDX, USER_ID, NAME, PWD, NICKNAME, EMAIL, PHONE, BIRTH, TOTAL_POINT, USED_POINT, KNOCK_ADMIN, KNOCK_ACTIVE, GENDER, ADDRESS, USER_IMG, JOINDATE, LAST_LOGIN_DATE)
                    VALUES (3, 'test2', '테스트2', '1234', '테스트2번', 'test2@googlecom', '01022222222', sysdate, 1000, 0, '1', '1', '1', '서울시 강남구 대치동', '경로경로', sysdate, null);

