CREATE OR REPLACE PROCEDURE Rpt1(IN_From_Date IN DATE, IN_To_Date IN DATE)
IS

    v_pageCount         NUMBER := 1;
    V_loop              NUMBER := 0;
    v_break             NUMBER := 1;
    e_invalidInput      EXCEPTION;
    e_invalidDate       EXCEPTION;
    e_invalid_ToDate    EXCEPTION;

    CURSOR Report_Cursor IS
        SELECT c.customerID, c.customerName, c.phone, c.email, o.orderID, o.subtotal, o.status
        FROM customers c, orders o
        WHERE c.customerId = o.customerId AND
            o.status = 'Cancelled' AND
            o.orderDate BETWEEN IN_From_Date AND IN_To_Date
        ORDER BY c.customerID;

    Report_rec Report_Cursor%ROWTYPE;

BEGIN
    -- INPUT VALIDATION
    IF ( TO_DATE(IN_From_Date,'DD/MM/YYYY') > TO_DATE(sysdate,'DD/MM/YYYY')) OR
             ( TO_DATE(IN_To_Date,'DD/MM/YYYY') > TO_DATE(sysdate,'DD/MM/YYYY')) THEN

            raise e_invalidDate;
        ELSE
            -- Check To Date is Valid
            IF(IN_From_Date > IN_To_Date) THEN
                raise e_invalid_ToDate;
            END IF;
        END IF;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',45,' ') ||'Cancel Order REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') || LPAD('=',53,'='));

    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',30,' ') ||' FROM '|| IN_From_Date || ' TO ' ||  IN_To_Date );
 
    -- OPEN QUERY 
    OPEN Report_Cursor;
    LOOP
    FETCH Report_Cursor into Report_rec;            -- FETCH RECORDS
    EXIT WHEN Report_Cursor%NOTFOUND;

        -- PRINT PAGES BY PAGES - PRINT ONLY IF THE RECORD COUNT IS 0 OR REACHES 20 THEN PRINT NEXT PAGE HEADINGS
        IF(v_loop = 0 OR v_loop = 20) THEN
            DBMS_OUTPUT.PUT_LINE(chr(10));
            DBMS_OUTPUT.PUT_LINE(RPAD('Printed Date: ', 14, ' ')||
                                RPAD(TO_CHAR(sysdate,'dd/mm/yyyy'), 10, ' ')||
                                LPAD(' ', 70, ' ')||
                                'Page: '||LPAD(v_pageCount, 2, ' '));

            -- COLUMNS HEADERS
            DBMS_OUTPUT.PUT_LINE(CHR(10));
            DBMS_OUTPUT.PUT_LINE(RPAD('Customer ID', 10, ' ')||
                                    RPAD('Customer Name', 35, ' ')||
                                    RPAD('Phone', 11, ' ') ||
                                    RPAD('Email', 15,' ')||
                                    RPAD('Order ID', 14,' ')||
                                    RPAD('Subtotal', 14,' ')||
                                    RPAD('Status', 25,' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')||' '||
                                RPAD('=', 34 ,'=')||' '||
                                RPAD('=', 10 ,'=')||' '||
                                RPAD('=', 14 ,'=')||' '||
                                RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 23 ,'=')||' ');
            v_loop := 0;
            v_pageCount := v_pageCount + 1;
        END IF;

        -- PRINT RECORD 
        IF (v_break = 1) THEN
            DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.customerID, 10, ' ')|| 
                                RPAD(Report_rec.customerName, 35, ' ')|| 
                                RPAD(Report_rec.phone, 10, ' ')|| 
                                RPAD(Report_rec.email, 10, ' ')|| 
                                LPAD(Report_rec.orderID, 12,' ')|| 
                                LPAD(Report_rec.subtotal, 15,' ')|| 
                                LPAD(Report_rec.status, 15,' '));
            v_break := 0;
            v_loop := v_loop + 1;
        END IF;

    END LOOP;


    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 45,' ') || RPAD('*', 39 ,'*')|| RPAD(' *',24,'*'));
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'-END of REPORT-');

EXCEPTION
    WHEN e_invalidInput THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input rider id must be numberic.');
    WHEN e_invalidDate THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input date cannot be future date.');
    WHEN e_invalid_ToDate THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input from date cannot be greater than to date.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Found. Please contact your Database Administrator');
END;
/

-- exec proc_rider_performance_OnDemandRpt(1001, TO_DATE('01/07/2017', 'DD/MM/YYYY'), TO_DATE('07/07/2017', 'DD/MM/YYYY'));



