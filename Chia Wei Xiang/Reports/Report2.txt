CREATE OR REPLACE PROCEDURE Prt2(IN_Year IN VARCHAR)
IS
    v_pageCount     number := 1;
    V_loop          number := 0;
    v_break         number := 1;
    e_invalidInput exception;
    e_invalidYear  exception;

    CURSOR Report_Cursor IS
        SELECT SUM(v1.TOTAL_SALES) AS Promo_sales, SUM(v2.TOTAL_SALES) AS WITHOUT_PROMO, 
(SUM(v2.TOTAL_SALES) -  SUM(v1.TOTAL_SALES)) / SUM(v1.TOTAL_SALES) AS percentage
FROM v_promo_sales v1, v_promo_sales v2
WHERE v2.promoid IS NULL AND
      v1.promoid IS NOT NULL AND
      v1.year = IN_Year AND
      v2.year = IN_Year;    

    Report_rec Report_Cursor%ROWTYPE;

BEGIN
-- INPUT VALIDATION

     IF ((IN_Year > TO_CHAR(sysdate,'yyyy'))) THEN
            raise e_invalidYear;
        END IF;

    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'Order sales with and without promotion REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',25,' ') || LPAD('=',59,'='));

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


            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 9 ,'=')||' '||
                                RPAD('=', 29 ,'=')||' '||
                                RPAD('=', 30 ,'=')||' ');
            v_loop := 0;
            v_pageCount := v_pageCount + 1;
        END IF;

        -- PRINT RECORD
        IF (v_break = 1) THEN
            DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.Promo_sales, 10, ' ')|| 
                                RPAD(Report_rec.WITHOUT_PROMO, 30, ' ')|| 
                                RPAD(Report_rec.percentage, 11, ' '));
            v_break := 0;
            v_loop := v_loop + 1;
        END IF;
    END LOOP;
    

EXCEPTION
    
    WHEN e_invalidInput THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input rider id and year must be a numberic.');
    WHEN e_invalidYear THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input year cannot be future year.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error Found. Please contact your Database Administrator');

END;
/
-- exec proc_rider_performance_DetailRpt(1001,2017);

