-- input orders details, orders, Check Promo Code/ Expiry date, 
-- check customer with payment method of credits need verify,
-- Sum automatically the subtotal with the delivery fees,

CREATE OR REPLACE PROCEDURE insert_orders(IN_CUSTOMERID IN NUMBER, IN_PROMOID IN NUMBER, IN_RIDERID IN NUMBER, IN_PAYMENTMETHOD IN VARCHAR, IN_DELIVERYFEES IN NUMBER,  IN_ORDERDATE IN DATE,
                    IN_STATUS IN VARCHAR, IN_ESTIMATEDTIME IN DATE, IN_RECEIVEDTIME IN DATE) IS
   
    temp_count number(6); 
    subtotal number(6);
    estimated_time DATE;
    received_time DATE;

    CURSOR orders IS
   	 SELECT MAX(orderID)
   	 FROM orders;

BEGIN
   OPEN orders;
   LOOP
        FETCH orders INTO temp_count;
        EXIT WHEN orders%NOTFOUND;

    END LOOP;       
    CLOSE orders;

    temp_count := temp_count +1;

    SELECT SUM(quantityOrdered*priceEach) INTO subtotal
    FROM orderDetails
    WHERE orderID = temp_count;

    DBMS_OUTPUT.PUT_LINE ('Order ID : ' || temp_count);    
    DBMS_OUTPUT.PUT_LINE ('Customer ID : ' || IN_CUSTOMERID);
    DBMS_OUTPUT.PUT_LINE ('Promo ID : ' || IN_PROMOID);
    DBMS_OUTPUT.PUT_LINE ('Rider ID : ' || IN_RIDERID);   
    DBMS_OUTPUT.PUT_LINE ('Subtotal : ' || subtotal); 
    DBMS_OUTPUT.PUT_LINE ('Payment Method : ' || IN_PAYMENTMETHOD);   
    DBMS_OUTPUT.PUT_LINE ('Delivery Fee : ' || IN_DELIVERYFEES); 
    DBMS_OUTPUT.PUT_LINE ('Order Date : ' || IN_ORDERDATE); 
    DBMS_OUTPUT.PUT_LINE ('Status : ' || IN_STATUS); 
    DBMS_OUTPUT.PUT_LINE ('Estimated Time : ' || IN_ESTIMATEDTIME); 
    DBMS_OUTPUT.PUT_LINE ('Recieved Time : ' || IN_RECEIVEDTIME); 


    estimated_time := TO_DATE(IN_ESTIMATEDTIME, 'DD/MM/YYYY HH24:MI:SS');
    received_time := TO_DATE(IN_RECEIVEDTIME, 'DD/MM/YYYY HH24:MI:SS');

    insert into orders values(temp_count,IN_CUSTOMERID,IN_PROMOID,IN_RIDERID,subtotal,
    IN_PAYMENTMETHOD,IN_DELIVERYFEES,IN_STATUS,IN_ORDERDATE, IN_ESTIMATEDTIME,IN_RECEIVEDTIME);

    DBMS_OUTPUT.PUT_LINE (chr(10));
    DBMS_OUTPUT.PUT_LINE ('Order has been successfuly added: ');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'You have tried to insert a same category.');

    WHEN NO_DATA_FOUND THEN
      raise_application_error (-20002,'No records found for the category or the restaurant.');

    WHEN OTHERS THEN
      raise_application_error (-20003,'An error has occurred when inserting the restaurant category. Please contact administrator');
    
END;
/

-- exec insert_orders(1200,1024,1011,'E-wallet',3.9,'06/11/2019','Cancelled','06/11/2019 20:59:23','06/11/2019 21:18:23');
















-- CREATE OR REPLACE PROCEDURE Insert_orders(IN_ORDERSID IN NUMBER, IN_CUSTOMERID IN NUMBER, IN_PROMOID IN NUMBER, IN_RIDERID IN NUMBER) IS

-- v_restaurantName restaurant.restaurantName%TYPE;
--     v_restaurantDesc restaurant.restaurantDesc%TYPE;
--     v_email          restaurant.email%TYPE;
--     v_categoryName   category.categoryName%TYPE;
--     v_count          integer := 1;

--     CURSOR order_cursor IS
--         SELECT cat.categoryName
--         FROM orders o, customer c, riders r, promotion p
--         WHERE o.customerId = o.customerId AND
--         o.promoID = p.promoID AND
--         o.riderID = r.riderID AND
--         o.customerId = IN_CUSTOMERID AND
--         o.promoID = IN_PROMOID AND
--         o.riderID = IN_RIDERID


-- BEGIN
--  -- DISPLAY REST_INFO and CATE_LIST BEFORE INSERT
--     SELECT restaurantName, restaurantDesc, email INTO v_restaurantName, v_restaurantDesc, v_email
--     FROM restaurant
--     WHERE restaurantId = IN_RESTAURANTID;

--     DBMS_OUTPUT.PUT_LINE ('Restaurant Name : ' || v_restaurantName);
--     DBMS_OUTPUT.PUT_LINE ('Restaurant Description : ' || v_restaurantDesc);   
--     DBMS_OUTPUT.PUT_LINE ('Restaurant Email : ' || v_email);   
--     DBMS_OUTPUT.PUT_LINE (chr(10));

--     DBMS_OUTPUT.PUT_LINE ('Current Restaurant Catogeries : ');

--     OPEN RESTURANT_CATEGORY_CURSOR;
--     LOOP
--         FETCH RESTURANT_CATEGORY_CURSOR INTO v_categoryName;
--         EXIT WHEN RESTURANT_CATEGORY_CURSOR%NOTFOUND;

--         DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_categoryName);

--         v_count := v_count + 1;

--     END LOOP;
--     CLOSE RESTURANT_CATEGORY_CURSOR;

--     -- RUN INSERT ;
--     INSERT INTO categoryList VALUES(IN_RESTAURANTID, IN_CATEGORYID);

--     DBMS_OUTPUT.PUT_LINE (chr(10));
--     DBMS_OUTPUT.PUT_LINE ('Category has been successfuly added to the restaurant: ');
--     DBMS_OUTPUT.PUT_LINE (chr(10));

--     DBMS_OUTPUT.PUT_LINE ('Updated Restaurant Catogeries : ');

--     -- RESET v_count
--     v_count := 1;

--     OPEN RESTURANT_CATEGORY_CURSOR;
--     LOOP
--         FETCH RESTURANT_CATEGORY_CURSOR INTO v_categoryName;
--         EXIT WHEN RESTURANT_CATEGORY_CURSOR%NOTFOUND;

--         DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_categoryName);

--         v_count := v_count + 1;

--     END LOOP;
--     CLOSE RESTURANT_CATEGORY_CURSOR;
   
--     DBMS_OUTPUT.PUT_LINE (chr(10));


-- EXCEPTION
--     WHEN DUP_VAL_ON_INDEX THEN
--       raise_application_error (-20001,'You have tried to insert a same category.');

--     WHEN NO_DATA_FOUND THEN
--       raise_application_error (-20002,'No records found for the category or the restaurant.');

--     WHEN OTHERS THEN
--       raise_application_error (-20003,'An error has occurred when inserting the restaurant category. Please contact administrator');
    
-- END;
-- /