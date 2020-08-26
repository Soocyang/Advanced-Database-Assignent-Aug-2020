-- NEED CREATE THIS VIEW FIRST
-- TO GET ALL TOTAL ORDERS DELIVERED FROM ALL RECORDS BY YEARS
-- ===========================================================

-- CREATE OR REPLACE VIEW views_total_orders_delivered_by_year AS
--       SELECT r.riderId, r.riderName, EXTRACT(YEAR FROM o.orderDate) year, count(o.orderId) Total_Orders_Delivered_By_Year
--       FROM orders o, riders r
--       WHERE o.riderId = r.riderId
--       GROUP BY r.riderId, r.riderName, EXTRACT(YEAR FROM o.orderDate)
--       ORDER BY r.riderId, year;

-- select * from views_total_orders_delivered_by_year;

-- ===========================================================


-- =========================================================================
--   RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY COMPARING YEARS
-- =========================================================================


-- SPOOL 'D:\RIDERS_PERFORMANCE_REPORT_2.txt'

ACCEPT v_Year1   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 1st Year format(YYYY): '
ACCEPT v_Year2   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 2nd Year format(YYYY): '
ACCEPT v_Year3   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 3rd Year format(YYYY): '

TTITLE CENTER 'RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY YEARS' -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 1 -
CENTER ===========================================================  SKIP 2 -
LEFT '                     RIDERS INFORMATION                               TOTAL NUMBER OF ORDERS' SKIP 1

COLUMN riderId FORMAT a5 Heading "R_ID"
COLUMN riderName FORMAT a45 Heading "Rider Name"
COLUMN riderPhone FORMAT a15 Heading "Contact No."
COLUMN Year_1 FORMAT 9999 Heading "Year &v_Year1"
COLUMN Year_2 FORMAT 9999 Heading "Year &v_Year2"
COLUMN Year_3 FORMAT 9999 Heading "Year &v_Year3"


SELECT CONCAT('R',r.riderId) as riderId, 
       r.riderName, 
       r.riderPhone, 
       v1.Total_Orders_Delivered_By_Year as Year_1,
       v2.Total_Orders_Delivered_By_Year as Year_2,
       v3.Total_Orders_Delivered_By_Year as Year_3
FROM   riders r,
       views_total_orders_delivered_by_year v1,
       views_total_orders_delivered_by_year v2,
       views_total_orders_delivered_by_year v3
WHERE  (r.riderId = v1.riderId) AND
       (v1.year = &v_Year1) AND
       (r.riderId = v2.riderId) AND
       (v2.year = &v_Year2) AND
       (r.riderId = v3.riderId) AND
       (v3.year = &v_Year3);

COLUMN riderId CLEAR
COLUMN riderName CLEAR
COLUMN riderPhone CLEAR
COLUMN Year_1 CLEAR
COLUMN Year_2 CLEAR
COLUMN Year_3 CLEAR
TTITLE OFF

-- SPOOL OFF


