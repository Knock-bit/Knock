-- 펀딩실패 시 포인트 돌려주는 트리거
create or replace TRIGGER RETURNPOINT 
AFTER UPDATE OF STATUS ON CAMPAIGN_NOMINEE 
FOR EACH ROW
BEGIN
    IF :NEW.status = '0' 
        AND (:OLD.goal_point - :OLD.COLLECTED_POINT > 0)    
    THEN
        UPDATE CAMPAIGN_NOM_USER SET SPENT_POINT = 0 
        WHERE :OLD.NOMINEE_IDX = CAMPAIGN_NOM_USER.NOMINEE_IDX;
          UPDATE USERS SET USED_POINT = USED_POINT - 250
         WHERE USERS.USER_IDX IN (
               SELECT N.USER_IDX
                 FROM USERS U, CAMPAIGN_NOM_USER N
                WHERE U.USER_IDX = N.USER_IDX
                AND NOMINEE_IDX = :NEW.NOMINEE_IDX);
    END IF;
END;
