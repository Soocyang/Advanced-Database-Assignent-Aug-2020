--         RIDERS PERFORMANCE - Total Orders Delivered BY MONTH per YEAR
-- ===========================================================
-- ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI';

-- ACCEPT v_Month   DATE   FORMAT 'MON'   PROMPT 'Enter value month format(MON): '
-- ACCEPT v_Year    DATE   FORMAT 'YYYY'  PROMPT 'Enter value year format(YYYY): '

-- COLUMN riderName FORMAT a45

-- SELECT r.riderId, r.riderName, count(o.orderId) as Total_Orders_Delivered
-- FROM orders o, riders r
-- WHERE o.riderId = r.riderId AND
--       to_char(o.orderDate, 'MM/YYYY') = '&v_Month'
-- GROUP BY r.riderId, r.riderName
-- ORDER BY Total_Orders_Delivered DESC
-- FETCH NEXT 15 ROW ONLY;
-- ===========================================================
-- input the year 
-- input rider id

-- show all orders 

ACCEPT v_RiderId NUMBER    FORMAT '9999'   PROMPT 'Enter value Rider ID format(9999): R'
ACCEPT v_Year    DATE      FORMAT 'YYYY'   PROMPT 'Enter value Year format(YYYY): '

TTITLE CENTER 'RIDERS PERFORMANCE REPORT' SKIP 1 -
CENTER 'TOTAL ORDERS DELIVERED BY RIDER ID: &v_RiderId ON YEAR: &v_Year' SKIP 1 -
CENTER ============================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

COLUMN month FORMAT a10 HEADING 'Month'
COLUMN riderId FORMAT a5 HEADING 'R_ID'
COLUMN riderName FORMAT a45 HEADING 'Rider Name'
COLUMN Total_Orders_Delivered FORMAT 999 HEADING 'Total Orders Delivered'
COLUMN AvgTimeTaken FORMAT 99.99 HEADING 'Average Delivery Time Taken'
BREAK ON riderId ON riderName

SELECT CONCAT('R', r.riderId) AS riderId, r.riderName,
       TO_CHAR(TO_DATE(EXTRACT(MONTH FROM o.orderDate),'mm'), 'MONTH') AS month, 
       COUNT(o.orderId) AS Total_Orders_Delivered,
       AVG((o.receivedTime - o.estimatedTime)*24*60) as AvgTimeTaken
FROM   orders o,
       riders r
WHERE  o.riderId = r.riderId AND
       EXTRACT(YEAR FROM o.orderDate) = &v_Year AND
       o.riderId = &v_RiderId
GROUP BY EXTRACT(MONTH FROM o.orderDate), r.riderId, r.riderName
ORDER BY EXTRACT(MONTH FROM o.orderDate);

CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF


--Logic For Rider Performance report

-- Order join Rider


-- TEST DATA 
-- rider id: 1001
-- year : 2017


