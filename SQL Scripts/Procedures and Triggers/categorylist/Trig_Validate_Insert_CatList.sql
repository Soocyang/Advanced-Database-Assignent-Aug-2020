CREATE OR REPLACE TRIGGER validate_insert_delete_catlist_trg
    BEFORE 
    INSERT
    ON categoryList
    FOR EACH ROW    
DECLARE
    v_restaurantId       restaurant.restaurantId%TYPE;
    v_no_of_category     integer;
    e_toomany_category   exception;
       
BEGIN
    SELECT r.restaurantId, COUNT(cat.categoryId) No_of_Catg
    INTO v_restaurantId, v_no_of_category
    FROM restaurant r, categoryList cl, category cat
    WHERE r.restaurantId = cl.restaurantId AND
            cl.categoryId = cat.categoryId AND
            cl.restaurantId = :new.restaurantId
    GROUP BY r.restaurantId;

    IF v_no_of_category >= 6 THEN
        RAISE e_toomany_category;
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        raise_application_error(-20001, 'Category cannot be insert: Either restaurant or category not found.');
    WHEN e_toomany_category THEN
        raise_application_error(-20002, 'There are too many category for this restaurant already. You cannot add more than 6 category for the restaurant.');
END;
/

--=====COUNT NUMBER OF CATEGORY OF ALL RESTAURANT

COLUMN RESTAURANTID FORMAT 9999
COLUMN RESTAURANTNAME FORMAT A40
BREAK ON restaurantId ON restaurantName

SELECT r.restaurantId, r.restaurantName, COUNT(cat.categoryId) No_of_Catg
FROM restaurant r, categoryList cl, category cat
WHERE r.restaurantId = cl.restaurantId AND
        cl.categoryId = cat.categoryId
GROUP BY r.restaurantId, r.restaurantName
ORDER BY r.restaurantId;

CLEAR COLUMNS

-- LOGIC
-- 1. Restaurant cannot have more that 8 category or above
-- 2. Find the Restaurant and count its total category
-- 3. If total category > 6 raise error


SELECT r.restaurantId, COUNT(cat.categoryId) No_of_Catg
FROM restaurant r, categoryList cl, category cat
WHERE r.restaurantId = cl.restaurantId AND
        cl.categoryId = cat.categoryId AND
        cl.restaurantId = 1004
GROUP BY r.restaurantId;

-- ============TEST TRIGGER====================
exec insert_restaurant_category(1004, 1002);


