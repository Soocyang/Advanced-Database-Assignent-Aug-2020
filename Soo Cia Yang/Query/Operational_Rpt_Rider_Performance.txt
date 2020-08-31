-- -----------Count time difference

-- SELECT orderId, orderDate, to_char(estimatedTime, 'HH24:MI') as estimatedTime, to_char(receivedTime, 'HH24:MI') as receivedTime,
--        (receivedTime - estimatedTime)*24*60 as timeDifference
-- from orders
-- fetch next 5 row only;

-- Rider performance rpt - by time taken / Average Time Taken

ACCEPT v_riderID  NUMBER FORMAT '9999'         PROMPT 'Enter value for Rider ID format(9999): R'
ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

------
COLUMN riderId format a5 heading 'R_ID'
COLUMN riderName format a45 heading 'Rider Name'
COLUMN orderDate format a10 heading 'Order Date'
COLUMN estimatedTime format a15 heading 'Estimated Time'
COLUMN receivedTime format a15 heading 'Received Time'

BREAK ON riderId ON riderName SKIP 1

COMPUTE AVG LABEL 'Average Time Taken to Deliver Orders: ' OF timeDifferences ON riderName

TTITLE CENTER 'RIDERS PERFORMANCE REPORT' SKIP 1 -
CENTER 'ORDERS DELIVERED BY RIDER ID: &v_RiderId FROM &v_fromDate TO &v_toDate' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

SELECT CONCAT('R', r.riderId) AS riderId, r.riderName, 
        to_char(o.orderDate, 'DD/MM/YYYY') orderDate, 
        to_char(o.estimatedTime, 'HH12:MI AM') estimatedTime, 
        to_char(o.receivedTime, 'HH12:MI AM') receivedTime,
       (o.receivedTime - o.estimatedTime)*24*60 AS timeDifferences
FROM orders o, riders r
WHERE r.riderId = o.riderId AND 
        o.orderDate BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY') AND
        r.riderId = &v_riderID
ORDER BY orderDate, estimatedTime;

CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF

-- Logic

-- ADD LOCATION

-- TEST DATA

-- rider id : 1001
-- fromdate: 01/07/2017
-- todate: 07/07/2017


