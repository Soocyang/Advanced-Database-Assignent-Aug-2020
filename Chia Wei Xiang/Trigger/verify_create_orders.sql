-- =======AUDIT TABLE FOR RESTAURANT, MENU, CATEGORY=============

CREATE TABLE audits_create_orders (
      audit_order_id  NUMBER GENERATED BY DEFAULT AS IDENTITY,
      table_name        VARCHAR2(255),
      task_type         VARCHAR2(10),
      by_user           VARCHAR2(30),
      task_date         DATE,
      PRIMARY KEY(audit_order_id)
);

CREATE OR REPLACE TRIGGER verify_create_orders
    AFTER 
    INSERT 
    ON orders
    FOR EACH ROW    
DECLARE
   task_type VARCHAR2(10);
BEGIN
   task_type := CASE  
         WHEN INSERTING THEN 'INSERT'
   END;

   -- insert a row into the audit table   
   INSERT INTO audits_create_orders (table_name, task_type, by_user, task_date)
   VALUES('ORDER', task_type, USER, SYSDATE);

END;
/

COLUMN TABLE_NAME FORMAT a25
COLUMN BY_USER FORMAT a7
SELECT * FROM audits_create_orders;

-- insert into orders values(128820,1013,1012,1022,59.3,'Credit or Debit Card',10.9,'17/06/2019','Delivered',TO_DATE('17/06/2019 11:33:41', 'DD/MM/YYYY HH24:MI:SS'),TO_DATE('17/06/2019 11:40:41', 'DD/MM/YYYY HH24:MI:SS'));