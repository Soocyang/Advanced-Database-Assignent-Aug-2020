ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

TTITLE CENTER 'Sales from which location highest' SKIP 1 -
CENTER 'FROM &v_fromDate TO &v_toDate' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

COLUMN POSTALCODE format a12 heading 'Postal Code'
COLUMN NO_POSTAL format 99999 heading 'Number of Orders'

SELECT c.POSTALCODE , COUNT(c.POSTALCODE) AS NO_POSTAL
FROM CUSTOMERS c 
INNER JOIN ORDERS o2 ON c.CUSTOMERID = o2.CUSTOMERID 
WHERE ORDERDATE BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY')
GROUP BY POSTALCODE
ORDER BY COUNT(c.POSTALCODE) DESC;

COLUMN POSTALCODE CLEAR
COLUMN NO_POSTAL CLEAR
CLEAR BREAKS;
TTITLE OFF

-- TEST DATA
-- v_fromDate: 01/01/2017
-- v_toDate: 31/12/2017
