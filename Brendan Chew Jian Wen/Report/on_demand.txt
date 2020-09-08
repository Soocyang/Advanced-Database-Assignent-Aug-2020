CREATE OR REPLACE PROCEDURE ORDERS_PAYMENT_METHOD_ONDEMAND_REPORT(
    IN_FROM_DATE IN VARCHAR,
    IN_TO_DATE IN VARCHAR)
IS
    V_FROM_DATE         DATE;
    V_TO_DATE           DATE;
    V_TOTALORDERS       NUMBER := 0; 

    V_PAGE              NUMBER := 1;
    V_ROWS              NUMBER := 0;

    E_INVALIDINPUT      EXCEPTION;
    E_INVALIDDATE       EXCEPTION;
    E_INVALID_TODATE    EXCEPTION;

    CURSOR REPORT_CURSOR (FROM_DATE DATE, TO_DATE DATE) IS

        SELECT PAYMENTMETHOD AS PAYMENT_METHOD, COUNT(PAYMENTMETHOD) AS PAYMENT_COUNT
        FROM ORDERS O 
        WHERE ORDERDATE BETWEEN FROM_DATE AND TO_DATE
        GROUP BY PAYMENTMETHOD
        ORDER BY PAYMENT_COUNT DESC;

    REPORT_REC REPORT_CURSOR%ROWTYPE;

BEGIN
    -- CHECK IF DATE IS DATE
    IF( ISDATE(IN_FROM_DATE) = 0 OR ISDATE(IN_TO_DATE) = 0 ) THEN
        RAISE E_INVALIDINPUT;
    END IF;

    -- ASSIGN VARIABLE
    V_FROM_DATE := TO_DATE(IN_FROM_DATE, 'DD/MM/YYYY');
    V_TO_DATE   := TO_DATE(IN_TO_DATE, 'DD/MM/YYYY');

    -- CHECK IF DATE IS FUTURE
    IF (V_FROM_DATE > SYSDATE) OR (V_TO_DATE > SYSDATE) THEN
        RAISE E_INVALIDDATE;
    END IF;

    -- CHECK IF DATE RANGE IS VALID
    IF( V_FROM_DATE > V_TO_DATE ) THEN
        RAISE E_INVALID_TODATE;
    END IF;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(CHR(10));
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',45,' ') ||'On Demand Report');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',42,' ') ||'Payment Method Report');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',25,' ') || LPAD('=',53,'='));

    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',37,' ') || ' FROM '|| IN_FROM_DATE || ' TO ' ||  IN_TO_DATE );
 
    -- OPEN QUERY 
    OPEN REPORT_CURSOR(V_FROM_DATE, V_TO_DATE);
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
            DBMS_OUTPUT.PUT_LINE(RPAD('Payment Method', 30, ' ')||
                                    RPAD('Payment Count', 30, ' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 29 ,'=')||' '||
                                 RPAD('=', 29 ,'=')||' ');
            V_ROWS := 0;
            V_PAGE := V_PAGE + 1;
        END IF;

        DBMS_OUTPUT.PUT_LINE( RPAD(REPORT_REC.PAYMENT_METHOD, 30, ' ')|| 
                              LPAD(REPORT_REC.PAYMENT_COUNT, 29, ' '));
        
        V_ROWS := V_ROWS + 1;

        V_TOTALORDERS := V_TOTALORDERS + REPORT_REC.PAYMENT_COUNT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(RPAD('=', 29 ,'=')||' '||
                         RPAD('=', 29 ,'=')||' ');
    DBMS_OUTPUT.PUT_LINE(LPAD('Total Orders :',29,' ') || LPAD(TO_CHAR(V_TOTALORDERS, 999), 30, ' '));
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(CHR(13)|| LPAD(' ',48,' ') ||'-End Of Report-');

EXCEPTION
    WHEN E_INVALIDINPUT THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Input: Input Date Must Be DD/MM/YYYY.');
    WHEN E_INVALIDDATE THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Input: Input Date Cannot Be Future Date.');
    WHEN E_INVALID_TODATE THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Input: Input From Date Cannot Be Greater Than To Date.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Found. Please Contact Your Database Administrator');
END;
/

EXEC ORDERS_PAYMENT_METHOD_ONDEMAND_REPORT('01/07/2017', '07/07/2017');



