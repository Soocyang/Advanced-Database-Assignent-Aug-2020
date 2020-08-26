--         RIDERS PERFORMANCE - Total Orders Delivered BY MONTH/YEAR

ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY HH24:MI';

ACCEPT v_Month   DATE   FORMAT 'MM/YYYY'   PROMPT 'Enter value month/year format(MM/YYYY): '

COLUMN riderName FORMAT a45

SELECT r.riderId, r.riderName, count(o.orderId) as Total_Orders_Delivered
FROM orders o, riders r
WHERE o.riderId = r.riderId AND
      to_char(o.orderDate, 'MM/YYYY') = '&v_Month'
GROUP BY r.riderId, r.riderName
ORDER BY Total_Orders_Delivered DESC
FETCH NEXT 15 ROW ONLY;





--Logic For Rider Performance report

-- Order join Rider

-- -----------Count time difference

-- SELECT orderId, orderDate, to_char(estimatedTime, 'HH24:MI') as estimatedTime, to_char(receivedTime, 'HH24:MI') as receivedTime,
--        (receivedTime - estimatedTime)*24*60 as timeDifferencee
-- from orders
-- fetch next 5 row only;

-- --------------------
-- column riderName format a45
-- break on r.riderId
-- break on r.riderName

-- SELECT r.riderId, r.riderName, count(o.orderId)
-- FROM orders o, riders r
-- WHERE o.riderId = r.riderId AND
--         o.riderId = 1001
-- GROUP BY r.riderId, r.riderName;



