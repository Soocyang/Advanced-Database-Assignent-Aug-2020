ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

TTITLE CENTER 'Total Orders Group by Payment Method' SKIP 1 -
CENTER 'FROM &v_fromDate TO &v_toDate' SKIP 1 -
CENTER ===========================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

COLUMN payment_method FORMAT a20 HEADING 'Payment Method'
COLUMN payment_count FORMAT 99999 HEADING 'Payment Count'

SELECT PAYMENTMETHOD as payment_method, COUNT(PAYMENTMETHOD) as payment_count
FROM ORDERS o 
WHERE ORDERDATE BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY')
GROUP BY PAYMENTMETHOD
ORDER BY payment_count DESC;

COLUMN payment_method CLEAR
COLUMN payment_count CLEAR
CLEAR BREAKS
TTITLE OFF

-- TEST DATA
-- v_fromDate: 01/01/2017
-- v_toDate: 31/12/2017