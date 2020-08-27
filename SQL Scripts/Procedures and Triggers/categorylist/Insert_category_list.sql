CREATE OR REPLACE PROCEDURE insert_restaurant_category(IN_RESTAURANTID IN NUMBER, IN_CATEGORYID IN NUMBER) IS
    
    v_restaurantName restaurant.restaurantName%TYPE;
    v_restaurantDesc restaurant.restaurantDesc%TYPE;
    v_email          restaurant.email%TYPE;
    v_categoryName   category.categoryName%TYPE;
    v_count          integer := 1;

    CURSOR RESTURANT_CATEGORY_CURSOR IS
        SELECT cat.categoryName
        FROM restaurant r, categoryList cl, category cat
        WHERE r.restaurantId = cl.restaurantId AND
            cl.categoryId = cat.categoryId AND
            cl.restaurantId = IN_RESTAURANTID;

BEGIN

    -- DISPLAY REST_INFO and CATE_LIST BEFORE INSERT
    SELECT restaurantName, restaurantDesc, email INTO v_restaurantName, v_restaurantDesc, v_email
    FROM restaurant
    WHERE restaurantId = IN_RESTAURANTID;

    DBMS_OUTPUT.PUT_LINE ('Restaurant Name : ' || v_restaurantName);
    DBMS_OUTPUT.PUT_LINE ('Restaurant Description : ' || v_restaurantDesc);   
    DBMS_OUTPUT.PUT_LINE ('Restaurant Email : ' || v_email);   
    DBMS_OUTPUT.PUT_LINE (chr(10));

    DBMS_OUTPUT.PUT_LINE ('Current Restaurant Catogeries : ');

    OPEN RESTURANT_CATEGORY_CURSOR;
    LOOP
        FETCH RESTURANT_CATEGORY_CURSOR INTO v_categoryName;
        EXIT WHEN RESTURANT_CATEGORY_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_categoryName);

        v_count := v_count + 1;

    END LOOP;
    CLOSE RESTURANT_CATEGORY_CURSOR;

    -- RUN INSERT ;
    INSERT INTO categoryList VALUES(IN_RESTAURANTID, IN_CATEGORYID);

    DBMS_OUTPUT.PUT_LINE (chr(10));
    DBMS_OUTPUT.PUT_LINE ('Category has been successfuly added to the restaurant: ');
    DBMS_OUTPUT.PUT_LINE (chr(10));

    DBMS_OUTPUT.PUT_LINE ('Updated Restaurant Catogeries : ');

    -- RESET v_count
    v_count := 1;

    OPEN RESTURANT_CATEGORY_CURSOR;
    LOOP
        FETCH RESTURANT_CATEGORY_CURSOR INTO v_categoryName;
        EXIT WHEN RESTURANT_CATEGORY_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_categoryName);

        v_count := v_count + 1;

    END LOOP;
    CLOSE RESTURANT_CATEGORY_CURSOR;
   
    DBMS_OUTPUT.PUT_LINE (chr(10));

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'You have tried to insert a same category.');

    WHEN NO_DATA_FOUND THEN
      raise_application_error (-20002,'No records found for the category or the restaurant.');

    WHEN OTHERS THEN
      raise_application_error (-20003,'An error has occurred when inserting the restaurant category. Please contact administrator');
    
END;
/

--==============TEST DATA===================
-- insert_restaurant_category([res_id], [cat_id]);
exec insert_restaurant_category(1001, 1002);

-- WE do this "INSERT INTO categoryList VALUES(IN_RESTAURANTID, IN_CATEGORYID);"

-- TO REMOVE IT AND TEST AGAIN
DELETE FROM categoryList
WHERE   restaurantId = 1001 AND
        categoryId = 1002;

--==========================================

-- DISPLAY RESTAURANT CATEGORY
COLUMN restaurantName FORMAT a30
COLUMN restaurantDesc FORMAT a30
COLUMN email FORMAT a30
COLUMN categoryName FORMAT a20

SELECT r.restaurantName, r.restaurantDesc, r.email, cat.categoryName
FROM restaurant r, categoryList cl, category cat
WHERE r.restaurantId = cl.restaurantId AND
      cl.categoryId = cat.categoryId AND
      cl.restaurantId = 1001;
CLEAR COLUMNS