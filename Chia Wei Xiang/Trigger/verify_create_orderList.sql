--count subtotal after order details is updated
--update into order

CREATE OR REPLACE TRIGGER verify_create_orderList
AFTER
INSERT ON
orderDetails
FOR EACH ROW
DECLARE 
    v_subtotal  orders.subtotal%TYPE;
    v_newsub  orders.subtotal%TYPE;

BEGIN
 v_subtotal := :new.quantityOrdered * :new.priceEach;

    DBMS_OUTPUT.PUT_LINE (chr(10));
    DBMS_OUTPUT.PUT_LINE('Total of this order : ' || v_subtotal);

    SELECT subtotal INTO v_newsub
    FROM orders
    WHERE orderId = :new.orderId;

    v_newsub := v_newsub + v_subtotal;

    DBMS_OUTPUT.PUT_LINE('After add: ' || v_newsub);

    UPDATE orders
    SET subtotal = v_newsub
    WHERE orderId = :new.orderId;
    DBMS_OUTPUT.PUT_LINE('Subtotal of the order has been updated');

END;
/

    -- SELECT orderID, quantityOrdered, priceEach, (quantityOrdered * priceEach) 
    -- FROM orderDetails
    -- WHERE orderId = '100001';

    -- SELECT orderID, subtotal
    -- FROM orders
    -- WHERE orderId = '100001';