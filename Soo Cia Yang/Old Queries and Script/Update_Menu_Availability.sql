CREATE OR REPLACE PROCEDURE proc_update_menu_availability(IN_MENUID IN NUMBER, IN_AVAILABILITY IN VARCHAR) IS

    v_restaurantName    restaurant.restaurantName%TYPE;
    v_menuId            VARCHAR(10);
    v_menuName          menu.menuName%TYPE;
    v_old_avilability   menu.availableTime%TYPE;

BEGIN
    SELECT r.restaurantName, CONCAT('M',m.menuId), m.menuName, m.availableTime
    INTO v_restaurantName, v_menuId, v_menuName, v_old_avilability
    FROM menu m, restaurant r 
    WHERE m.menuId = IN_MENUID AND
            m.restaurantId = r.restaurantId;

    UPDATE menu 
    SET availableTime = IN_AVAILABILITY
    WHERE menuId = IN_MENUID;

    DBMS_OUTPUT.PUT_LINE ('Menu Found');
    DBMS_OUTPUT.PUT_LINE ('==========');
    DBMS_OUTPUT.PUT_LINE ('Restaurant Name      : ' || v_restaurantName);
    DBMS_OUTPUT.PUT_LINE ('Menu ID              : ' || v_menuId);
    DBMS_OUTPUT.PUT_LINE ('Menu Name            : ' || v_menuName);
    DBMS_OUTPUT.PUT_LINE ('Current Availability : ' || v_old_avilability);
    DBMS_OUTPUT.PUT_LINE ('Updated Availability : ' || IN_AVAILABILITY);

EXCEPTION
    WHEN NO_DATA_FOUND THEN 
        raise_application_error(-20034,'No records found for the restaurant.');
    WHEN VALUE_ERROR THEN
        raise_application_error(-20035,'Invalid  Input: Input menu id must be a numeric');
    WHEN OTHERS THEN
        raise_application_error(-20040,'An error has occur during the insert statement, please contact the database administrator.');

END;
/



exec proc_update_menu_availability(1000001, 'All Time');

-- insert into menu values(1001,1001,'Signature Quattro Beef (Classic)','main','Beef pizza 4 favorite',23.5,'all time');


