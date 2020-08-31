CREATE OR REPLACE TRIGGER verify_create_orderList
AFTER INSERT orderDetails
FOR EACH ROW

DECLARE 
v_subtotal  orders.subtotal%TYPE;

BEGIN
 SELECT orderID, (quantityOrdered * priceEach) INTO v_subtotal
 FROM orderDetails
 WHERE menuID = :new.IN_MENUID;

 DBMS_OUTPUT.PUT_LINE('Total: ' || v_subtotal);


END;