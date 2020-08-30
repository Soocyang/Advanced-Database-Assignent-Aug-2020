CREATE OR REPLACE PROCEDURE proc_rider_performance_summaryRpt(IN_FirstYear IN VARCHAR,
                                                                IN_SecondYear IN VARCHAR,
                                                                IN_ThirdYear IN VARCHAR)
IS
    v_countPositive number := 0;
    v_countNegative  number := 0;
    v_pageCount     number := 1;
    V_loop          number := 0;
    e_invalidInput exception;
    e_invalidYear  exception;

    CURSOR Report_Cursor IS
        SELECT CONCAT('R',r.riderId) as riderId, 
            r.riderName, 
            r.riderPhone, 
            v1.Total_Orders_Delivered_By_Year as Year_1,
            v2.Total_Orders_Delivered_By_Year as Year_2,
            v3.Total_Orders_Delivered_By_Year as Year_3,
            (100 * (v3.Total_Orders_Delivered_By_Year - v1.Total_Orders_Delivered_By_Year) / v1.Total_Orders_Delivered_By_Year) AS PercentChange
        FROM riders r,
            views_total_orders_delivered_by_year v1,
            views_total_orders_delivered_by_year v2,
            views_total_orders_delivered_by_year v3
        WHERE  (r.riderId = v1.riderId) AND
            (v1.year = IN_FirstYear) AND
            (r.riderId = v2.riderId) AND
            (v2.year = IN_SecondYear) AND
            (r.riderId = v3.riderId) AND
            (v3.year = IN_ThirdYear)
        ORDER BY riderId
        FETCH NEXT 15 ROW ONLY;

    Report_rec Report_Cursor%ROWTYPE;

BEGIN

    IF ((IS_NUMBER(IN_FirstYear) = 0) OR (IS_NUMBER(IN_SecondYear) = 0) OR (IS_NUMBER(IN_ThirdYear) = 0)) THEN
        raise e_invalidInput;
    ELSE
        IF ((IN_FirstYear > TO_CHAR(sysdate,'yyyy')) OR (IN_SecondYear > TO_CHAR(sysdate,'yyyy')) OR (IN_ThirdYear > TO_CHAR(sysdate,'yyyy'))) THEN
            raise e_invalidYear;
        END IF;
    END IF;

    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'SUMMARY REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') ||'RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY YEARS');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') || LPAD('=',59,'='));

    -- OPEN QUERY 
    OPEN Report_Cursor;
    LOOP
    FETCH Report_Cursor into Report_rec;        -- FETCH RECORDS
    EXIT WHEN Report_Cursor%NOTFOUND;

        -- PRINT PAGES BY PAGES
        IF(v_loop = 0 OR v_loop = 20) THEN
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(RPAD('Printed Date: ', 14, ' ')||
                                RPAD(TO_CHAR(sysdate,'dd/mm/yyyy'), 10, ' ')||
                                LPAD(' ', 70, ' ')||
                                'Page: '||LPAD(v_pageCount, 2, ' '));

            -- COLUMNS HEADERS
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(LPAD(' ', 10,' ')||'RIDERS INFORMATION'||LPAD(' ', 31,' ')||'TOTAL NUMBER OF ORDERS');
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(RPAD('Rider ID', 10, ' ')||
                                    RPAD('Rider Name', 33, ' ')||
                                    RPAD('Contact No.', 13, ' ') ||
                                    'Year '||RPAD(IN_FirstYear, 4,' ')||' '||
                                    'Year '||RPAD(IN_SecondYear, 4,' ')||' '||
                                    'Year '||RPAD(IN_ThirdYear, 4,' ')||' '||
                                    RPAD('Performance in %', 20,' '));
            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')||' '||
                                    RPAD('=', 30 ,'=')||' '||
                                    LPAD('=', 14 ,'=')||' '||
                                    LPAD('=', 9 ,'=')||' '||
                                    LPAD('=', 9 ,'=')||' '||
                                    LPAD('=', 9 ,'=')||' '||
                                    LPAD('=', 16 ,'='));
            v_loop := 0;
            v_pageCount := v_pageCount + 1;
        END IF;

        -- PRINT RECORD
        DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.riderId, 10, ' ')|| 
                                RPAD(Report_rec.riderName, 30, ' ')|| 
                                LPAD(Report_rec.riderPhone, 15, ' ')|| 
                                LPAD(Report_rec.Year_1, 7,' ') || 
                                LPAD(Report_rec.Year_2, 11,' ') || 
                                LPAD(Report_rec.Year_3, 11,' ') ||
                                LPAD(TO_CHAR(Report_rec.PercentChange, 990.99), 15,' ') || ' %');

        
        -- COUNT POSITIVE OR NEGATIVE PERFORMANCE
        IF Report_rec.PercentChange >= 0 THEN
            v_countPositive := v_countPositive + 1;
        ELSE        
            v_countNegative := v_countNegative + 1;
        END IF;
        
        v_loop := v_loop + 1;

    END LOOP;

    DBMS_OUTPUT.PUT_LINE(LPAD(' ',50,' ')||'************************************** '||'*************');

    DBMS_OUTPUT.PUT_LINE(LPAD(' ',50,' ')||'Total Riders With Positive Peformance: ' ||LPAD(TO_CHAR(v_countPositive, 999), 5, ' ')||' Riders');
    DBMS_OUTPUT.PUT_LINE(LPAD(' ',50,' ')||'Total Riders With Negative Peformance: ' ||LPAD(TO_CHAR(v_countNegative, 999), 5, ' ')||' Riders');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',45,' ') ||'-END of REPORT-');

    EXCEPTION
        WHEN e_invalidInput THEN
            DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input year must be a numberic.');
        WHEN e_invalidYear THEN
            DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input year cannot be future year.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Found. Please contact your Database Administrator');
END;
/

exec proc_rider_performance_summaryRpt(2017,2018,2019);

