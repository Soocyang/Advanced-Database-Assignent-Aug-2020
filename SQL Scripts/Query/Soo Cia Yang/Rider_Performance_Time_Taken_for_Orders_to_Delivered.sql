
-- Rider performance rpt - by time taken / Average Time Taken

ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

------
COLUMN riderName format a45
BREAK ON riderId ON riderName SKIP 1

COMPUTE AVG LABEL 'Average Time Taken to Deliver Orders: ' OF timeDifferencee ON riderName

SELECT r.riderId, r.riderName, 
        to_char(o.orderDate, 'DD/MM/YYYY') orderDate, 
        to_char(o.estimatedTime, 'HH24:MI') estimatedTime, 
        to_char(o.receivedTime, 'HH24:MI') receivedTime,
       (o.receivedTime - o.estimatedTime)*24*60 as timeDifferencee
from orders o, riders r
where r.riderId = o.riderId AND 
        o.orderDate BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY')
order by r.riderId;

CLEAR BREAKS;

-- Logic

-- ADD LOCATION

