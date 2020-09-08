CREATE OR REPLACE PROCEDURE RESTAURANT_PERFORMANCE_SUMMARY_REPORT(IN_FIRSTYEAR IN VARCHAR, IN_SECONDYEAR IN VARCHAR)
IS
    V_COUNTPOSITIVE NUMBER := 0;
    V_COUNTNEGATIVE NUMBER := 0;
    V_PAGECOUNT     NUMBER := 1;
    V_LOOP          NUMBER := 0;
    E_INVALIDINPUT EXCEPTION;
    E_INVALIDYEAR  EXCEPTION;

    CURSOR REPORT_CURSOR IS

        SELECT  CONCAT('R', R.RESTAURANTID) AS RESTAURANT_ID, 
                R.RESTAURANTNAME,  
                TO_CHAR(V1.TOTAL_SALES,'FM999999.00') AS YEAR_1_TOTAL_SALES,
                TO_CHAR(V2.TOTAL_SALES,'FM999999.00') AS YEAR_2_TOTAL_SALES,
                (100 * (V2.TOTAL_SALES - V1.TOTAL_SALES) / V1.TOTAL_SALES) AS PERCENT_CHANGE
        FROM    RESTAURANT R, 
                VIEWS_TOTALORDERS_SALES_RESTAURANT_BY_YEAR V1,
                VIEWS_TOTALORDERS_SALES_RESTAURANT_BY_YEAR V2
        WHERE   (R.RESTAURANTID = V1.RESTAURANTID) AND
                (V1.YEAR = IN_FIRSTYEAR) AND
                (R.RESTAURANTID = V2.RESTAURANTID) AND
                (V2.YEAR = IN_SECONDYEAR) 
        ORDER BY RESTAURANT_ID;

    REPORT_REC REPORT_CURSOR%ROWTYPE;

BEGIN

    -- CHECK IF IT IS NUMBER
    IF ((IS_NUMBER(IN_FIRSTYEAR) = 0) OR (IS_NUMBER(IN_SECONDYEAR) = 0)) THEN
        RAISE E_INVALIDINPUT;
    END IF;
    
    -- CHECK IF IT IS YEAR
    IF ((IN_FIRSTYEAR > TO_CHAR(SYSDATE,'YYYY')) OR (IN_SECONDYEAR > TO_CHAR(SYSDATE,'YYYY'))) THEN
        RAISE E_INVALIDYEAR;
    END IF;

    DBMS_OUTPUT.PUT_LINE(CHR(10));
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',48,' ') ||'SUMMARY REPORT');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',25,' ') ||'RESTAURANT PERFORMANCE REPORT - TOTAL ORDERS SERVED BY YEARS');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',25,' ') || LPAD('=',59,'='));

    -- OPEN QUERY 
    OPEN REPORT_CURSOR;
    LOOP
    FETCH REPORT_CURSOR INTO REPORT_REC;        -- FETCH RECORDS
    EXIT WHEN REPORT_CURSOR%NOTFOUND;

        -- PRINT PAGES BY PAGES
        IF(V_LOOP = 0 OR V_LOOP = 20) THEN
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(RPAD('PRINTED DATE: ', 14, ' ')||
                                RPAD(TO_CHAR(SYSDATE,'DD/MM/YYYY'), 10, ' ')||
                                LPAD(' ', 70, ' ')||
                                'PAGE: '||LPAD(V_PAGECOUNT, 2, ' '));

            -- COLUMNS HEADERS
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(LPAD(' ', 10,' ')||'RESTAURANT INFORMATION'||LPAD(' ', 31,' ')||'TOTAL NUMBER OF ORDERS');
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(RPAD('ID', 10, ' ')||
                                    RPAD('RESTAUTANT', 60, ' ')||
                                    'YEAR '||RPAD(IN_FIRSTYEAR, 5,' ')||
                                    'YEAR '||RPAD(IN_SECONDYEAR, 5,' ')||
                                    RPAD('PERFORMANCE IN %', 20,' '));
            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')||' '||
                                    RPAD('=', 59 ,'=')||' '||
                                    LPAD('=', 9 ,'=')||' '||
                                    LPAD('=', 9 ,'=')||' '||
                                    LPAD('=', 19 ,'='));
            V_LOOP := 0;
            V_PAGECOUNT := V_PAGECOUNT + 1;
        END IF;

        -- PRINT RECORD
        DBMS_OUTPUT.PUT_LINE( RPAD(REPORT_REC.RESTAURANT_ID, 10, ' ')|| 
                                RPAD(REPORT_REC.RESTAURANTNAME, 60, ' ')|| 
                                LPAD(REPORT_REC.YEAR_1_TOTAL_SALES, 9,' ') || ' ' ||
                                LPAD(REPORT_REC.YEAR_2_TOTAL_SALES, 9,' ') || ' ' ||
                                LPAD(TO_CHAR(REPORT_REC.PERCENT_CHANGE, 990.99), 17,' ') || ' %');

        
        -- COUNT POSITIVE OR NEGATIVE PERFORMANCE
        IF REPORT_REC.PERCENT_CHANGE >= 0 THEN
            V_COUNTPOSITIVE := V_COUNTPOSITIVE + 1;
        ELSE        
            V_COUNTNEGATIVE := V_COUNTNEGATIVE + 1;
        END IF;
        
        V_LOOP := V_LOOP + 1;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')  ||' '||
                         RPAD('=', 59 ,'=') ||' '||
                         LPAD('=', 9 ,'=')  ||' '||
                         LPAD('=', 9 ,'=')  ||' '||
                         LPAD('=', 19 ,'='));

    DBMS_OUTPUT.PUT_LINE(' ');

    DBMS_OUTPUT.PUT_LINE('There are ' || V_COUNTPOSITIVE || ' restaurants with positive performance.');
    DBMS_OUTPUT.PUT_LINE('There are ' || V_COUNTNEGATIVE || ' restaurants with negative performance.');

    DBMS_OUTPUT.PUT_LINE(' ');

    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',45,' ') ||'-END OF REPORT-');

    EXCEPTION
        WHEN E_INVALIDINPUT THEN
            DBMS_OUTPUT.PUT_LINE('INVALID  INPUT: INPUT YEAR MUST BE A NUMBERIC.');
        WHEN E_INVALIDYEAR THEN
            DBMS_OUTPUT.PUT_LINE('INVALID  INPUT: INPUT YEAR CANNOT BE FUTURE YEAR.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('ERROR FOUND. PLEASE CONTACT YOUR DATABASE ADMINISTRATOR');
END;
/

EXEC RESTAURANT_PERFORMANCE_SUMMARY_REPORT(2017,2018);

