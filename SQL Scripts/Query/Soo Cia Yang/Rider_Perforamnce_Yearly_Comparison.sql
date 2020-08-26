-- =========================================================================
--   RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY COMPARING YEARS
-- =========================================================================

SPOOL D:\RIDERS_PERFORMANCE_REPORT_1.txt

ACCEPT v_Year1   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 1st Year format(YYYY): '
ACCEPT v_Year2   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 2nd Year format(YYYY): '
ACCEPT v_Year3   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 3rd Year format(YYYY): '


TTITLE CENTER 'RIDERS PERFORMANCE REPORT - TOTAL ORDERS DELIVERED BY YEARS' -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 1 -
CENTER ===========================================================  SKIP 2 -
LEFT 'RIDERS INFORMATION' -
CENTER '                                              TOTAL NUMBER OF ORDERS' SKIP 1

COLUMN riderId FORMAT 9999 Heading "R_ID"
COLUMN riderName FORMAT a45 Heading "Rider Name"
COLUMN riderPhone FORMAT a15 Heading "Contact No."
COLUMN TotalOrders_For_Year1 FORMAT 9999 Heading "Year (&v_Year1)"
COLUMN TotalOrders_For_Year2 FORMAT 9999 Heading "Year (&v_Year2)"
COLUMN TotalOrders_For_Year3 FORMAT 9999 Heading "Year (&v_Year3)"

SELECT r.riderId, r.riderName, r.riderPhone, q1.TotalOrders_For_Year1, q2.TotalOrders_For_Year2, q3.TotalOrders_For_Year3
FROM riders r 
      LEFT JOIN
      (SELECT r.riderId, r.riderName, count(o.orderId) TotalOrders_For_Year1
      FROM orders o, riders r
      WHERE o.riderId = r.riderId AND
            EXTRACT(YEAR FROM o.orderDate) = '&v_Year1'
      GROUP BY r.riderId, r.riderName
      ORDER BY r.riderId) q1
      ON r.riderId = q1.riderId
            LEFT JOIN
            (SELECT r.riderId, r.riderName, count(o.orderId) TotalOrders_For_Year2
            FROM orders o, riders r
            WHERE o.riderId = r.riderId AND
                  EXTRACT(YEAR FROM o.orderDate) = '&v_Year2'
            GROUP BY r.riderId, r.riderName
            ORDER BY r.riderId) q2
            ON r.riderId = q2.riderId
                  LEFT JOIN
                  (SELECT r.riderId, r.riderName, count(o.orderId) TotalOrders_For_Year3
                  FROM orders o, riders r
                  WHERE o.riderId = r.riderId AND
                        EXTRACT(YEAR FROM o.orderDate) = '&v_Year3'
                  GROUP BY r.riderId, r.riderName
                  ORDER BY r.riderId) q3
                  ON r.riderId = q3.riderId
ORDER BY r.riderId
FETCH NEXT 15 ROW ONLY;


COLUMN riderId CLEAR
COLUMN riderName CLEAR
COLUMN riderPhone CLEAR
COLUMN TotalOrders_For_Year1 CLEAR
COLUMN TotalOrders_For_Year2 CLEAR
COLUMN TotalOrders_For_Year3 CLEAR
TTITLE OFF

SPOOL OFF


-- =====================================
--                 LOGIC
-- =====================================




-- Rider ID | Rider Name | Total Order Deliver frm Year (2017) | Total Order Deliver frm Year (2018) | Total Order Deliver frm Year (2018)

-- GET ALL RIDERS


-- COLUMN riderName FORMAT a45
-- SELECT riderId, riderName
-- FROM RIDERS;


-- GET ONE RIDER


-- COLUMN riderName FORMAT a45
-- SELECT riderId, riderName
-- FROM RIDERS
-- WHERE riderId=1001;


-- SELECT count(*) as Total_Orders_Delivered
-- FROM RIDERS R, ORDERS O
-- WHERE O.orderId = R.riderId AND
--         R.riderId=1001



-- GET RIDER TOTAL ORDERS BY YEAR


-- SELECT r.riderId, r.riderName, count(o.orderId) as Total_Orders_Delivered
-- FROM orders o, riders r
-- WHERE o.riderId = r.riderId AND
--       r.riderId = 1001 AND
--       EXTRACT(YEAR FROM o.orderDate) = '2017'
-- GROUP BY r.riderId, r.riderName
-- ORDER BY r.riderId;

-- SELECT r.riderId, r.riderName, count(o.orderId) as Total_Orders_Delivered
-- FROM orders o, riders r
-- WHERE o.riderId = r.riderId AND
--       r.riderId = 1001 AND
--       EXTRACT(YEAR FROM o.orderDate) = '2018'
-- GROUP BY r.riderId, r.riderName
-- ORDER BY r.riderId;

-- SELECT r.riderId, r.riderName, count(o.orderId) as Total_Orders_Delivered
-- FROM orders o, riders r
-- WHERE o.riderId = r.riderId AND
--       r.riderId = 1001 AND
--       EXTRACT(YEAR FROM o.orderDate) = '2019'
-- GROUP BY r.riderId, r.riderName
-- ORDER BY r.riderId;


-- CREAT VIEWS
