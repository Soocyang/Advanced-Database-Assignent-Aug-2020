-- NEED CREATE THIS VIEW FIRST
-- TO GET ALL TOTAL ORDERS DELIVERED FROM ALL RECORDS BY YEARS
-- ===========================================================

CREATE OR REPLACE VIEW views_total_orders_delivered_by_year AS
      SELECT r.riderId, r.riderName, EXTRACT(YEAR FROM o.orderDate) year, count(o.orderId) Total_Orders_Delivered_By_Year
      FROM orders o, riders r
      WHERE o.riderId = r.riderId
      GROUP BY r.riderId, r.riderName, EXTRACT(YEAR FROM o.orderDate)
      ORDER BY r.riderId, year;

-- select * from views_total_orders_delivered_by_year;

-- ===========================================================

-- =========================================================================
--   RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY COMPARING YEARS
-- =========================================================================

-- SPOOL 'D:\RIDERS_PERFORMANCE_REPORT_2.txt'

ACCEPT v_Year1   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 1st Year format(YYYY): '
ACCEPT v_Year2   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 2nd Year format(YYYY): '

TTITLE CENTER 'RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY YEARS' -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 1 -
CENTER ===========================================================  SKIP 2 -
LEFT '                     RIDERS INFORMATION                               TOTAL NUMBER OF ORDERS' SKIP 1

COLUMN riderId FORMAT a5 Heading "R_ID"
COLUMN riderName FORMAT a45 Heading "Rider Name"
COLUMN riderPhone FORMAT a15 Heading "Contact No."
COLUMN Year_1 FORMAT 9999 Heading "Year &v_Year1"
COLUMN Year_2 FORMAT 9999 Heading "Year &v_Year2"
COLUMN PercentChange FORMAT 99.99 Heading "Performance in %"

SELECT CONCAT('R',r.riderId) as riderId, 
       r.riderName, 
       r.riderPhone, 
       v1.Total_Orders_Delivered_By_Year as Year_1,
       v2.Total_Orders_Delivered_By_Year as Year_2,
       (100 * (v2.Total_Orders_Delivered_By_Year - v1.Total_Orders_Delivered_By_Year) / v1.Total_Orders_Delivered_By_Year) AS PercentChange
FROM   riders r,
       views_total_orders_delivered_by_year v1,
       views_total_orders_delivered_by_year v2
WHERE  (r.riderId = v1.riderId) AND
       (v1.year = &v_Year1) AND
       (r.riderId = v2.riderId) AND
       (v2.year = &v_Year2)
ORDER BY PercentChange DESC
FETCH NEXT 18 ROW ONLY;

CLEAR COLUMNS
TTITLE OFF

-- SPOOL OFF

-- TEST DATA
-- year 1: 2017
-- year 1: 2018
-- year 1: 2019

