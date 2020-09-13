CREATE OR REPLACE PROCEDURE report_operation(IN_From_Date IN DATE,IN_To_Date IN DATE)
IS
    v_freq_id        number := 0;
    v_freq_name      VARCHAR(50);
    v_freq_count     number := 0;

    v_high_id     number := 0;
    v_high_name     VARCHAR(50);
    v_high_count     number := 0;

    v_count     number := 0;

    v_pageCount     number := 1;
    V_loop          number := 0;
    v_break         number := 1;
    e_invalidDate       EXCEPTION;
    e_invalid_ToDate    EXCEPTION;

    CURSOR Report_Cursor IS
        SELECT c.customerID, c.customerName, c.phone, c.email, o.orderID, o.subtotal, o.orderDate, o.status
        FROM customers c, orders o
        WHERE c.customerId = o.customerId AND
            o.status = 'Cancelled' AND
            o.orderDate BETWEEN IN_From_Date AND IN_To_Date
        ORDER BY c.customerID;

    Report_rec Report_Cursor%ROWTYPE;


BEGIN
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



    -- REPORT HEADER
    DBMS_OUTPUT.PUT_LINE(chr(10));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',60,' ') ||'OPERATION REPORT');
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',28,' ') ||'CUSTOMERS REPORT - TRACK CUSTOMER CANCEL FREQUENCY FROM '||IN_From_Date||' To '||IN_To_Date);
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',28,' ') || LPAD('=',78,'='));

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
            DBMS_OUTPUT.PUT_LINE(RPAD('Customer ID', 14, ' ')||
                                    RPAD('Customer Name', 50, ' ')||
                                    RPAD('Phone', 14, ' ') ||
                                    RPAD('Email', 25,' ')||
                                    RPAD('Order Id', 10,' ')||
                                    RPAD('Subtotal', 10,' ')||
                                    RPAD('Order Date', 12, ' ') ||
                                    RPAD('Status', 12,' '));

            -- COLUMNS SEPERATOR 
            DBMS_OUTPUT.PUT_LINE(RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 49 ,'=')||' '||
                                RPAD('=', 13 ,'=')||' '||
                                RPAD('=', 24 ,'=')||' '||
                                RPAD('=', 9 ,'=')||' '||
                                RPAD('=', 9 ,'=')||' '||
                                RPAD('=', 11 ,'=')||' '||
                                RPAD('=', 11 ,'=')||' ');
            v_loop := 0;
            v_pageCount := v_pageCount + 1;

        END IF;

-- SELECT c.customerID, c.customerName, c.phone, c.email, o.orderID, o.subtotal, o.orderDate, o.status
        -- PRINT RECORD
            DBMS_OUTPUT.PUT_LINE( RPAD(Report_rec.customerID, 14, ' ')|| 
                                RPAD(Report_rec.customerName, 50, ' ')|| 
                                RPAD(Report_rec.phone, 14, ' ')|| 
                                RPAD(Report_rec.email, 25,' ')|| 
                                RPAD(Report_rec.orderID, 10,' ')|| 
                                RPAD(Report_rec.subtotal, 10,' ')||
                                RPAD(Report_rec.orderDate, 12,' ')||
                                RPAD(Report_rec.status, 12,' '));
            v_loop := v_loop + 1;
    
    v_count := v_count + 1;

    END LOOP;

    SELECT c.customerID, c.customerName, COUNT(c.customerID) INTO v_freq_id, v_freq_name, v_freq_count
        FROM customers c, orders o
        WHERE c.customerId = o.customerId AND
            o.status = 'Cancelled' AND
            o.orderDate BETWEEN IN_From_Date AND IN_To_Date
        GROUP BY c.customerID, c.customerName
        ORDER BY COUNT(c.customerID) DESC
        FETCH next 1 row only;

    SELECT c.customerID, c.customerName, MAX(o.subtotal) INTO v_high_id, v_high_name, v_high_count
        FROM customers c, orders o
        WHERE c.customerId = o.customerId AND
            o.status = 'Cancelled' AND
            o.orderDate BETWEEN IN_From_Date AND IN_To_Date
        GROUP BY c.customerID, c.customerName
        ORDER BY COUNT(c.customerID) DESC
        FETCH next 1 row only;
    
    DBMS_OUTPUT.PUT_LINE(RPAD(' =',14,'=')||RPAD(' =',50,'=')||RPAD(' =',14,'=')||RPAD(' =',25,'=')||RPAD(' =', 10 ,'=')||RPAD(' =', 10 ,'=')||RPAD(' =', 12 ,'=')|| RPAD(' =',12,'='));
    DBMS_OUTPUT.PUT_LINE(chr(13));
    DBMS_OUTPUT.PUT_LINE('The customer '|| v_freq_id|| ' - '||v_freq_name||' has cancel his/her order '|| v_freq_count ||' times from '|| IN_From_Date || ' To ' || IN_To_Date ||'. He/She cancel thier orders most frequency');
    DBMS_OUTPUT.PUT_LINE('The customer '|| v_high_id|| ' - '||v_high_name||' has cancel his/her order that has highest amount RM'|| v_high_count ||' from '|| IN_From_Date || ' To ' || IN_To_Date ||'.');
    DBMS_OUTPUT.PUT_LINE('The total cancel orders from '|| IN_From_Date || ' To ' || IN_To_Date ||' is ' || v_count || ' times.');
     DBMS_OUTPUT.PUT_LINE(chr(13));
    DBMS_OUTPUT.PUT_LINE(chr(13)|| LPAD(' ',48,' ') ||'-END of REPORT-');

EXCEPTION
    WHEN e_invalidDate THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input date cannot be future date.');
    WHEN e_invalid_ToDate THEN
        DBMS_OUTPUT.PUT_LINE('Invalid  Input: Input from date cannot be greater than to date.');

END;
/

exec report_operation(TO_DATE('01/07/2017', 'DD/MM/YYYY'), TO_DATE('07/07/2017', 'DD/MM/YYYY'));


