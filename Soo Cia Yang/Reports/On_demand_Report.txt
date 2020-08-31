CREATE OR REPLACE PROCEDURE proc_rider_performance_OnDemandRpt(IN_riderId IN VARCHAR,
                                                                IN_From_Date IN DATE,
                                                                IN_To_Date IN DATE)
IS
    -- v_From_Date         DATE := TO_DATE('IN_From_Date', 'DD/MM/YYYY');
    -- v_To_Date            DATE := TO_DATE('IN_To_Date', 'DD/MM/YYYY');
    v_avg_timeTaken     NUMBER := 0;
    v_totalOrders       NUMBER := 0; 

    v_pageCount         NUMBER := 1;
    V_loop              NUMBER := 0;
    v_break             NUMBER := 1;
    e_invalidInput      EXCEPTION;
    e_invalidDate       EXCEPTION;
    e_invalid_ToDate    EXCEPTION;

    CURSOR Report_Cursor IS
        SELECT CONCAT('R', r.riderId) AS riderId, r.riderName, 
                to_char(o.orderDate, 'DD/MM/YYYY') orderDate, 
                to_char(o.estimatedTime, 'HH12:MI AM') estimatedTime, 
                to_char(o.receivedTime, 'HH12:MI AM') receivedTime,
            (o.receivedTime - o.estimatedTime)*24*60 AS timeDifferences
        FROM orders o, riders r
        WHERE r.riderId = o.riderId AND 
                o.orderDate BETWEEN IN_From_Date AND IN_To_Date AND
                r.riderId = IN_riderId
        ORDER BY orderDate, estimatedTime;

    Report_rec Report_Cursor%ROWTYPE;

BEGIN
    -- INPUT VALIDATION
    IF (IS_NUMBER(IN_riderId) = 0) THEN

        raise e_invalidInput;
    ELSE
        -- Check Date Format 
        IF ( TO_DATE(IN_From_Date,'DD/MM/YYYY') > TO_DATE(sysdate,'DD/MM/YYYY')) OR
             ( TO_DATE(IN_To_Date,'DD/MM/YYYY') > TO_DATE(sysdate,'DD/MM/YYYY')) THEN

            raise e_invalidDate;
        ELSE
            -- Check To Date is Valid
            IF(IN_From_Date > IN_To_Date) THEN

                raise e_invalid_ToDate;
            END IF;
        END IF;
    END IF;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',45,' ') ||'ON DEMAND REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') ||'RIDERS PERFORMANCE REPORT - ORDERS DELIVERED BY RIDER');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') || LPAD('=',53,'='));

    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',30,' ') || 'RIDER ID: '|| IN_riderId || ' -' ||' FROM '|| IN_From_Date || ' TO ' ||  IN_To_Date );
 
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
            DBMS_OUTPUT.PUT_LINE(RPAD('Rider ID', 10, ' ')||
                                    RPAD('Rider Name', 35, ' ')||
                                    RPAD('Order Date', 11, ' ') ||
                                    RPAD('Estimated Time', 15,' ')||
                                    RPAD('Received Time', 14,' ')||
                                    RPAD('Delivery Time(Minutes)', 25,' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')||' '||
                                RPAD('=', 34 ,'=')||' '||
                                RPAD('=', 10 ,'=')||' '||
                                RPAD('=', 14 ,'=')||' '||
                                RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 23 ,'=')||' ');
            v_loop := 0;
            v_pageCount := v_pageCount + 1;
        END IF;

        -- PRINT RECORD
        IF (v_break = 1) THEN
            DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.riderId, 10, ' ')|| 
                                RPAD(Report_rec.riderName, 35, ' ')|| 
                                RPAD(Report_rec.orderDate, 10, ' ')|| 
                                LPAD(Report_rec.estimatedTime, 12,' ')|| 
                                LPAD(Report_rec.receivedTime, 15,' ')|| 
                                LPAD(Report_rec.timeDifferences, 15,' '));
            v_break := 0;
            v_loop := v_loop + 1;
        ELSE
            DBMS_OUTPUT.PUT_LINE(RPAD(chr(13), 46, ' ')||
                                RPAD(Report_rec.orderDate, 11, ' ')|| 
                                LPAD(Report_rec.estimatedTime, 11,' ')|| 
                                LPAD(Report_rec.receivedTime, 15,' ')|| 
                                LPAD(Report_rec.timeDifferences, 15,' '));
            v_loop := v_loop + 1;
        END IF;

        v_avg_timeTaken := v_avg_timeTaken + Report_rec.timeDifferences;
        v_totalOrders := v_totalOrders + 1;
    END LOOP;

    v_avg_timeTaken := v_avg_timeTaken/v_totalOrders;

    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 45,' ') || RPAD('*', 39 ,'*')|| RPAD(' *',24,'*'));
    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 45,' ') || LPAD('Average Time Taken to Deliver Orders: ',40,' ') || LPAD(TO_CHAR(v_avg_timeTaken, 999.99), 10, ' ')||' minutes');
    DBMS_OUTPUT.PUT_LINE(RPAD(' ', 45,' ') || LPAD('Total Orders: ',40,' ') || LPAD(TO_CHAR(v_totalOrders, 999), 10, ' ')||' orders');
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

exec proc_rider_performance_OnDemandRpt(1001, TO_DATE('01/07/2017', 'DD/MM/YYYY'), TO_DATE('07/07/2017', 'DD/MM/YYYY'));



