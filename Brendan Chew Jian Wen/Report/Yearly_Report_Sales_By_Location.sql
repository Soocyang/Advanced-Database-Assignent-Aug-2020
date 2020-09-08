CREATE OR REPLACE PROCEDURE YEARLY_REPORT_SALES_BY_LOCATION_DETAILRPT(
    IN_STATE IN VARCHAR,
    IN_YEAR IN VARCHAR)
IS
    V_TOTAL_ORDERS NUMBER := 0;
    V_TOTAL_SALES NUMBER  := 0;

    V_PAGE          NUMBER := 1;
    V_ROWS          NUMBER := 0;
    V_BREAK         NUMBER := 1;
    E_INVALIDINPUT EXCEPTION;
    E_INVALIDYEAR  EXCEPTION;

    CURSOR REPORT_CURSOR IS

        SELECT  R.STATE, 
                TO_CHAR(TO_DATE(EXTRACT(MONTH FROM O.ORDERDATE),'MM'), 'MONTH') AS MONTH,
                COUNT(O.ORDERID) TOTAL_ORDERS,
                SUM(O.SUBTOTAL) TOTAL_SALES
        FROM    RESTAURANT R, MENU M, ORDERDETAILS OD, ORDERS O 
        WHERE   R.RESTAURANTID = M.RESTAURANTID AND
                M.MENUID = OD.MENUID AND
                OD.ORDERID = O.ORDERID AND
                EXTRACT(YEAR FROM O.ORDERDATE) = IN_YEAR AND
                R.STATE = IN_STATE
        GROUP BY R.STATE, EXTRACT(MONTH FROM O.ORDERDATE)
        ORDER BY EXTRACT(MONTH FROM O.ORDERDATE);

    REPORT_REC REPORT_CURSOR%ROWTYPE;

BEGIN

    -- CHECK IF IT IS NUMBER
    IF (IS_NUMBER(IN_YEAR) = 0) THEN
        RAISE E_INVALIDINPUT;
    END IF;

    -- CHECK IF IT IS YEAR
    IF (IN_YEAR > TO_CHAR(SYSDATE,'YYYY')) THEN
        RAISE E_INVALIDYEAR;
    END IF;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',48,' ') ||'Detail Report');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',22,' ') ||'Total Orders And Sales Report On Year ' || IN_YEAR || 'in ' || IN_STATE);
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',22,' ') || LPAD('=',63,'='));

    -- OPEN QUERY 
    OPEN REPORT_CURSOR;
    LOOP
    FETCH REPORT_CURSOR INTO REPORT_REC;            -- FETCH RECORDS
    EXIT WHEN REPORT_CURSOR%NOTFOUND;

        -- PRINT PAGES BY PAGES - PRINT ONLY IF THE RECORD COUNT IS 0 OR REACHES 20 THEN PRINT NEXT PAGE HEADINGS
        IF(V_ROWS = 0 OR V_ROWS = 20) THEN
            DBMS_OUTPUT.PUT_LINE(CHR(10));
            DBMS_OUTPUT.PUT_LINE(RPAD('Printed Date: ', 14, ' ')||
                                RPAD(TO_CHAR(SYSDATE,'DD/MM/YYYY'), 10, ' ')||
                                LPAD(' ', 70, ' ')||
                                'Page: '||LPAD(V_PAGE, 2, ' '));

            -- COLUMNS HEADERS
            DBMS_OUTPUT.PUT_LINE(CHR(10));
            DBMS_OUTPUT.PUT_LINE(RPAD('State', 20, ' ')||
                                    RPAD('Month', 20, ' ') ||
                                    RPAD('Total Orders', 20,' ')||
                                    RPAD('Total Sales', 20,' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 19 ,'=')||' '||
                                RPAD('=', 19 ,'=')||' '||
                                RPAD('=', 19 ,'=')||' '||
                                RPAD('=', 19 ,'=')||' ');
            V_ROWS := 0;
            V_PAGE := V_PAGE + 1;
        END IF;

        -- PRINT RECORD
        IF (V_BREAK = 1) THEN
            DBMS_OUTPUT.PUT_LINE( RPAD(REPORT_REC.STATE, 20, ' ')|| 
                                RPAD(REPORT_REC.MONTH, 20, ' ')|| 
                                RPAD(REPORT_REC.TOTAL_ORDERS, 20, ' ')|| 
                                LPAD(CONCAT('RM', TO_CHAR(REPORT_REC.TOTAL_SALES, 999999.99)), 19,' '));
            V_BREAK := 0;
            V_ROWS := V_ROWS + 1;
        ELSE
            DBMS_OUTPUT.PUT_LINE(RPAD(' ', 20, ' ')|| 
                                RPAD(REPORT_REC.MONTH , 20, ' ')|| 
                                RPAD(REPORT_REC.TOTAL_ORDERS, 20, ' ')|| 
                                LPAD(CONCAT('RM', TO_CHAR(REPORT_REC.TOTAL_SALES, 999999.99)), 19,' '));

            V_ROWS := V_ROWS + 1;
        END IF;

        V_TOTAL_ORDERS :=  V_TOTAL_ORDERS + REPORT_REC.TOTAL_ORDERS;
        V_TOTAL_SALES :=  V_TOTAL_SALES + REPORT_REC.TOTAL_SALES;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 19 ,'=')||' '||
                         RPAD('=', 19 ,'=')||' '||
                         RPAD('=', 19 ,'=')||' '||
                         RPAD('=', 19 ,'=')||' ');

    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 20, ' ')|| 
                         RPAD('Total', 20, ' ')|| 
                         RPAD(V_TOTAL_ORDERS, 20, ' ')|| 
                         LPAD(CONCAT('RM', TO_CHAR(V_TOTAL_SALES, 9999999.99)), 19,' '));

    DBMS_OUTPUT.PUT_LINE(' ');

    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',48,' ') ||'-END OF REPORT-');

EXCEPTION
    
    WHEN E_INVALIDINPUT THEN
        DBMS_OUTPUT.PUT_LINE('INVALID  INPUT: INPUT YEAR MUST BE A NUMBERIC.');
    WHEN E_INVALIDYEAR THEN
        DBMS_OUTPUT.PUT_LINE('INVALID  INPUT: INPUT YEAR CANNOT BE FUTURE YEAR.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERROR FOUND. PLEASE CONTACT YOUR DATABASE ADMINISTRATOR');

END;
/

EXEC YEARLY_REPORT_SALES_BY_LOCATION_DETAILRPT('Kuala Lumpur',2017);




