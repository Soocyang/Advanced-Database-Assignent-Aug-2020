-- Logic
-- CUST | ORDER.ORDERDATE |
-- STATE | MONTH  | TOTAL ORDER | TOTAL SALES AMOUNT 

ACCEPT v_state CHAR PROMPT 'Enter value for State: '
ACCEPT v_Year  DATE FORMAT 'YYYY'   PROMPT 'Enter value Year format(YYYY): '

TTITLE CENTER 'Total Orders and Sales Report on Year &v_Year in &v_state ' - 
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 1 -
CENTER =========================================================================  SKIP 2 -

COLUMN state FORMAT a30 HEADING 'State'
COLUMN Month FORMAT a30 HEADING 'Month'
COLUMN total_orders FORMAT 99999 HEADING '   Total Orders'
COLUMN total_sales FORMAT a15 HEADING '   Total Sales'
BREAK ON state

SELECT  r.state, 
        TO_CHAR(TO_DATE(EXTRACT(MONTH FROM o.orderDate),'mm'), 'MONTH') AS Month,
        COUNT(o.orderId) total_orders,
        CONCAT('   RM', TO_CHAR(SUM(o.subtotal), 999999.99)) total_sales
FROM    restaurant r, menu m, orderDetails od, orders o 
WHERE   r.restaurantId = m.restaurantId AND
        m.menuId = od.menuId AND
        od.orderId = o.orderId AND
        EXTRACT(YEAR FROM o.orderDate) = '&v_Year' AND
        r.state = '&v_state'
GROUP BY r.state, EXTRACT(MONTH FROM o.orderDate)
ORDER BY EXTRACT(MONTH FROM o.orderDate);

CLEAR COLUMNS
CLEAR BREAKS
TTITLE OFF

-- TEST DATA 
-- Kuala Lumpur
-- 2017




