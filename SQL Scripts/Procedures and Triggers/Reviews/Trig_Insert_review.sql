
-- =======AUDIT TABLE FOR Review=============

CREATE TABLE audits_Reviews (
      audit_review_id  NUMBER GENERATED BY DEFAULT AS IDENTITY,
      table_name        VARCHAR2(255),
      task_type         VARCHAR2(10),
      by_user           VARCHAR2(30),
      task_date         DATE,
      PRIMARY KEY(audit_review_id)
);

---===========================================================
CREATE OR REPLACE TRIGGER reviews_audit_trg
    AFTER 
    INSERT OR UPDATE
    ON reviews
    FOR EACH ROW    
DECLARE
   l_task_type VARCHAR2(10);
BEGIN
   -- determine the task type
   l_task_type := CASE  
         WHEN INSERTING THEN 'INSERT'
         WHEN UPDATING THEN 'UPDATE'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits_Reviews (table_name, task_type, by_user, task_date)
   VALUES('REVIEWS', l_task_type, USER, SYSDATE);
   
END;
/

desc audits_Reviews;

SELECT * 
FROM audits_Reviews;