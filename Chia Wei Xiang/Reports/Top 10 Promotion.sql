CREATE OR REPLACE PROCEDURE report_tactical(IN_Month IN VARCHAR, IN_Year IN VARCHAR)
IS

    v_high_id       number := 0;
    v_high_value       number := 0;

    v_pageCount     number := 1;
    V_loop          number := 0;
    v_break         number := 1;
    e_invalidInput       EXCEPTION;
    e_invalidYear    EXCEPTION;

    CURSOR Report_Cursor IS
        SELECT p.PromoId, p.promoDesc, p.discountRate, COUNT(o.orderId) as USEDTIME, SUM(o.subtotal) AS VALUEEARN,
        SUM(o.subtotal*(1-p.discountRate)) AS AFTERDIS
        FROM orders o, promotion p
        WHERE o.promoId = p.promoId AND
            EXTRACT(MONTH FROM o.orderDate) = IN_Month AND
            EXTRACT(YEAR FROM o.orderDate) = IN_Year 
        GROUP BY p.PromoId, p.promoDesc, p.discountRate
        ORDER By USEDTIME DESC
        FETCH next 10 row only;
    Report_rec Report_Cursor%ROWTYPE;


BEGIN
    -- INPUT VALIDATION
    IF ((IS_NUMBER(IN_Month) = 0) OR (IS_NUMBER(IN_Year) = 0)) THEN
        raise e_invalidInput;
    ELSE
        IF ((IN_Year > TO_CHAR(sysdate,'YYYY'))) THEN
            raise e_invalidYear;
        END IF;
    END IF;


    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'TACTICAL REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',28,' ') ||'CUSTOMERS REPORT - TOP 10 PROMOTION CODE');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',28,' ') || LPAD('=',50,'='));

    -- OPEN QUERY 
    OPEN Report_Cursor;
    LOOP
    FETCH Report_Cursor into Report_rec;            -- FETCH RECORDS
    EXIT WHEN Report_Cursor%NOTFOUND;

        -- PRINT PAGES BY PAGES
        IF(v_loop = 0 OR v_loop = 20) THEN
            DBMS_OUTPUT.PUT_LINE(' ');
            DBMS_OUTPUT.PUT_LINE(RPAD('Printed Date: ', 14, ' ')||
                                RPAD(TO_CHAR(sysdate,'dd/mm/yyyy'), 10, ' ')||
                                LPAD(' ', 70, ' ')||
                                'Page: '||LPAD(v_pageCount, 2, ' '));

                        
         -- COLUMNS HEADERS
            DBMS_OUTPUT.PUT_LINE(CHR(10));
            DBMS_OUTPUT.PUT_LINE(RPAD('Promotion ID', 14, ' ')||
                                    RPAD('Promotion Description', 50, ' ')||
                                    RPAD('Discount Rate', 15, ' ') ||
                                    RPAD('Total Used', 12, ' ') ||
                                    RPAD('Value Earn', 12,' ')||
                                    RPAD('After Discount', 16,' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 49 ,'=')||' '||
                                RPAD('=', 14 ,'=')||' '||
                                RPAD('=', 11 ,'=')||' '||
                                RPAD('=', 11 ,'=')||' '||
                                RPAD('=', 15 ,'=')||' ');
            v_loop := 0;
            v_pageCount := v_pageCount + 1;

        END IF;

--         SELECT p.PromoId, p.promoDesc, p.discountRate,
-- COUNT(o.orderId) as USEDTIME, SUM(o.subtotal) AS VALUEEARN, 
-- SUM(o.subtotal*(1-p.discountRate)) AS AFTERDIS 

        -- PRINT RECORD
            DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.PromoId, 14, ' ')|| 
                                RPAD(Report_rec.promoDesc, 50, ' ')|| 
                                RPAD(Report_rec.discountRate, 15, ' ')|| 
                                RPAD(Report_rec.USEDTIME, 12, ' ')|| 
                                RPAD('RM '||Report_rec.VALUEEARN, 12,' ')|| 
                                RPAD('RM '||Report_rec.AFTERDIS, 16,' '));
            v_loop := v_loop + 1;

    END LOOP;

    SELECT p.PromoId, SUM(o.subtotal*(1-p.discountRate)) AS AFTERDIS INTO v_high_id, v_high_value
        FROM orders o, promotion p
        WHERE o.promoId = p.promoId AND
            EXTRACT(MONTH FROM o.orderDate) = IN_Month AND
            EXTRACT(YEAR FROM o.orderDate) = IN_Year 
        GROUP BY p.PromoId
        ORDER By AFTERDIS DESC
        FETCH next 1 row only;

    DBMS_OUTPUT.PUT_LINE(RPAD(' *', 14 ,'*')||RPAD(' *', 50 ,'*')||RPAD(' *', 15 ,'*')|| RPAD(' *',12,'*')||RPAD(' *', 11 ,'*')|| RPAD(' *',16,'*'));
    DBMS_OUTPUT.PUT_LINE('The promotion id '||v_high_id|| ' has bring the highest value earn RM ' ||v_high_value);
    
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'-END of REPORT-');

EXCEPTION
        WHEN e_invalidInput THEN
            DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input year must be a numberic.');
        WHEN e_invalidYear THEN
            DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input year cannot be future year.');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Found. Please contact your Database Administrator');

END;
/

exec report_tactical(01,2017);


