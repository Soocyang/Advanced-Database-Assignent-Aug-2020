CREATE OR REPLACE PROCEDURE insert_order_Details(IN_ORDERID IN NUMBER, IN_MENUID IN NUMBER, IN_QUANTITYORDERED IN NUMBER, IN_PRICEEACH IN NUMBER) IS
-- check food menu must all from the same restaurant / cannot from different restaurant with same order id
v_restaurantId  restaurant.restaurantID%TYPE;
vm_restaurantId restaurant.restaurantID%TYPE;
v_rest_flag numeric;

RESTAURANT_NOT_EXIST EXCEPTION;
RESTAURANT_NOT_ALLOWED EXCEPTION;

CURSOR REST_CURSOR IS
SELECT restaurantId 
    FROM menu
    WHERE menuId = IN_MENUID;

-- verify existong order detail to get the restaurant 
-- if yes --get and verify restaurant
-- if no -->direct insert
BEGIN
    v_rest_flag := 0;
    -- SELECT m.restaurantId
    --      FROM menu m, orderDetails od WHERE m.menuId = od.menuId AND od.orderId = '100003'
    --      GROUP BY  m.restaurantId;
    BEGIN
         SELECT m.restaurantId INTO v_restaurantId
         FROM menu m, orderDetails od WHERE m.menuId = od.menuId AND od.orderId = IN_ORDERID
         GROUP BY  m.restaurantId;
    EXCEPTION
         WHEN NO_DATA_FOUND THEN
             RAISE RESTAURANT_NOT_EXIST;
    END;

    DBMS_OUTPUT.PUT_LINE ('Order ID : ' || IN_ORDERID);    
          DBMS_OUTPUT.PUT_LINE ('MENU ID : ' || IN_MENUID);
          DBMS_OUTPUT.PUT_LINE ('QUANTITY ORDERED : ' || IN_QUANTITYORDERED);
          DBMS_OUTPUT.PUT_LINE ('PRICE EACH : ' || IN_PRICEEACH); 

    OPEN REST_CURSOR;
    LOOP 
    -- all restaurant in menu
        FETCH REST_CURSOR INTO vm_restaurantId;
        EXIT WHEN REST_CURSOR%NOTFOUND;
        --if the insert restuarant is inside the menu
        IF vm_restaurantId = v_restaurantId THEN 
           v_rest_flag := 1;
        ELSE 
           RAISE RESTAURANT_NOT_ALLOWED;
        END IF;
    END LOOP;
    CLOSE REST_CURSOR;

    IF v_rest_flag = 1 THEN
          DBMS_OUTPUT.PUT_LINE ('Order ID : ' || IN_ORDERID);    
          DBMS_OUTPUT.PUT_LINE ('MENU ID : ' || IN_MENUID);
          DBMS_OUTPUT.PUT_LINE ('QUANTITY ORDERED : ' || IN_QUANTITYORDERED);
          DBMS_OUTPUT.PUT_LINE ('PRICE EACH : ' || IN_PRICEEACH);   
          insert into orderDetails values(IN_ORDERID,IN_MENUID,IN_QUANTITYORDERED,IN_PRICEEACH);
          
    END IF;  

    DBMS_OUTPUT.PUT_LINE (chr(10));
    DBMS_OUTPUT.PUT_LINE ('Order has been successfuly added: ');

    EXCEPTION
        WHEN RESTAURANT_NOT_ALLOWED THEN
          DBMS_OUTPUT.PUT_LINE('ONLY ALLOW TO ADD MENU THAT SAME WITH PREVIOUS RESTAURANT.');
         WHEN RESTAURANT_NOT_EXIST THEN
             DBMS_OUTPUT.PUT_LINE('RESTAURANT doesnt exist.');

END;
/

-- exec insert_order_Details(100001, 5000, 2, 70.0);

SELECT *
FROM orderDetails
WHERE orderId='100002';
