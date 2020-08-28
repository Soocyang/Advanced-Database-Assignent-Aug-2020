CREATE OR REPLACE PROCEDURE USER1.insert_fooditemlist(IN_MENUID IN NUMBER, IN_FOODITEMID IN NUMBER, IN_QUANTITY IN NUMBER) IS

    v_menuName       menu.menuName%TYPE;
    v_menuDesc       menu.menuDesc%TYPE;
    v_quantity       fooditemlist.quantity%TYPE;
    v_foodItemName   fooditem.foodItemName%TYPE;
    v_count          integer := 1;

    CURSOR MENU_FOODITEM_CURSOR IS
        SELECT fi.FOODITEMNAME, fil.QUANTITY
        FROM MENU m, FOODITEMLIST fil , FOODITEM fi
        WHERE m.menuId = fil.menuId AND
            fi.FOODITEMID = fil.FOODITEMID AND
            m.menuId = IN_MENUID;
BEGIN

    SELECT menuName, menuDesc INTO v_menuName, v_menuDesc
    FROM menu m
    WHERE m.menuId = IN_MENUID;

    DBMS_OUTPUT.PUT_LINE ('Menu Name : ' || v_menuName);
    DBMS_OUTPUT.PUT_LINE ('Menu Description : ' || v_menuDesc);
    DBMS_OUTPUT.PUT_LINE (chr(10));

    DBMS_OUTPUT.PUT_LINE ('Current Menu Food List : ');

    OPEN MENU_FOODITEM_CURSOR;
    LOOP
        FETCH MENU_FOODITEM_CURSOR INTO v_foodItemName, v_quantity;
        EXIT WHEN MENU_FOODITEM_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_foodItemName || '* ' || v_quantity);

        v_count := v_count + 1;

    END LOOP;
    CLOSE MENU_FOODITEM_CURSOR;

    -- RUN INSERT ;
    INSERT INTO fooditemlist VALUES(IN_MENUID, IN_FOODITEMID, IN_QUANTITY);

    DBMS_OUTPUT.PUT_LINE (chr(10));
    DBMS_OUTPUT.PUT_LINE ('Food list has been successfuly added to the menu: ');
    DBMS_OUTPUT.PUT_LINE (chr(10));

    DBMS_OUTPUT.PUT_LINE ('Updated Menu Food List : ');

    -- RESET v_count
    v_count := 1;

    OPEN MENU_FOODITEM_CURSOR;
    LOOP
        FETCH MENU_FOODITEM_CURSOR INTO v_foodItemName, v_quantity;
        EXIT WHEN MENU_FOODITEM_CURSOR%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE (v_count || '. ' || v_foodItemName || ' * ' || v_quantity);

        v_count := v_count + 1;

    END LOOP;
    CLOSE MENU_FOODITEM_CURSOR;

    DBMS_OUTPUT.PUT_LINE (chr(10));

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
      raise_application_error (-20001,'You have tried to insert a same food item.');

    WHEN NO_DATA_FOUND THEN
      raise_application_error (-20002,'No records found for the food item or the menu.');

    WHEN OTHERS THEN
      raise_application_error (-20003,'An error has occurred when inserting the menu category. Please contact administrator');

END;
/

--==============TEST DATA===================
-- insert_fooditemlist([menuid], [fooditemid], [quantity]);
exec insert_fooditemlist(1001, 1002, 5);

-- TO REMOVE IT AND TEST AGAIN
DELETE FROM fooditemlist
WHERE   menuId = 1001 AND
        fooditemId = 1002;

--==========================================

-- DISPLAY MENU FOODLIST

SELECT fi.FOODITEMNAME, fil.QUANTITY
FROM MENU m, FOODITEMLIST fil , FOODITEM fi 
WHERE m.menuId = fil.menuId AND
    fi.FOODITEMID = fil.FOODITEMID AND
    m.menuId = 1001;