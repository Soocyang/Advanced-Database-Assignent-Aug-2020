ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

TTITLE CENTER 'Sales from which restaurant' SKIP 1 -
CENTER 'FROM &v_fromDate TO &v_toDate' SKIP 1 -
CENTER ===========================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

COLUMN restaurant_id FORMAT 99999 HEADING 'Res ID'
COLUMN restaurant_name FORMAT a50 HEADING 'Restaurant Name'
COLUMN sum_of_orders FORMAT 99999 HEADING 'Total Orders'
COLUMN sum_quantityorder FORMAT 99999 HEADING 'Total Amount Sold'

SELECT r.RESTAURANTID as restaurant_id, r.RESTAURANTNAME as restaurant_name, o.sum_of_orders, o.sum_quantityorder 
FROM RESTAURANT r 
INNER JOIN (
       SELECT SUM(od.num_of_orders) AS sum_of_orders, SUM(sum_quantityorder) AS sum_quantityorder , m.RESTAURANTID
       FROM MENU m
       INNER JOIN (
              SELECT COUNT(MENUID) AS num_of_orders, SUM(QUANTITYORDERED) AS sum_quantityorder ,MENUID 
              FROM ORDERDETAILS od 
              WHERE ORDERID IN (
                     SELECT o.ORDERID 
                     FROM ORDERS o 
                     WHERE ORDERDATE BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY')
              )
              GROUP BY MENUID 
              ORDER BY sum_quantityorder DESC
       ) od
       ON od.MENUID = m.MENUID 
       GROUP BY RESTAURANTID
       ORDER BY sum_of_orders DESC  
) o
ON r.RESTAURANTID = o.RESTAURANTID;

COLUMN restaurant_id CLEAR
COLUMN restaurant_name CLEAR
COLUMN sum_of_orders CLEAR
COLUMN sum_quantityorder CLEAR
CLEAR BREAKS
TTITLE OFF

-- TEST DATA
-- v_fromDate: 01/01/2017
-- v_toDate: 31/12/2017
