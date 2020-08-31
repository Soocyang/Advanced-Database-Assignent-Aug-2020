-- orders with promotion compare without promo promotion
-- month | order with promocode |  order without promocode |

------------------- USE THIS----------------------

COLUMN Promo_sales format 99999999.99 heading 'Sales with promotion'
COLUMN WITHOUT_PROMO format 99999999.99 heading 'Sales Without promotion'
COLUMN percentage format 99999999.99 heading 'Diffent Percentage'
ACCEPT v_year CHAR PROMPT 'Enter the year: '

TTITLE CENTER 'Sales of promotion compare with without promotion' SKIP 1 -
CENTER 'OF MONTH &v_year' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

DROP VIEW v_promo_sales;
CREATE VIEW v_promo_sales AS (
    SELECT EXTRACT(YEAR FROM orderDate) year, promoid, SUM(subtotal) AS TOTAL_SALES
    FROM orders
    GROUP BY EXTRACT(YEAR FROM orderDate),  promoid
);

SELECT SUM(v1.TOTAL_SALES) AS Promo_sales, SUM(v2.TOTAL_SALES) AS WITHOUT_PROMO, (SUM(v2.TOTAL_SALES) -  SUM(v1.TOTAL_SALES)) / SUM(v1.TOTAL_SALES) AS percentage
FROM v_promo_sales v1, v_promo_sales v2
WHERE v2.promoid IS NULL AND
      v1.promoid IS NOT NULL AND
      v1.year = &v_year AND
      v2.year = &v_year;    
      
COLUMN Promo_sales CLEAR
COLUMN WITHOUT_PROMO CLEAR

CLEAR BREAKS;
TTITLE OFF


-- SELECT TO_CHAR(TO_DATE(EXTRACT(MONTH FROM o.orderDate),'mm'), 'MONTH') AS month, 
-- COUNT(v1.promoId) AS promoUsed, SUM(v1.subtotal) AS subtotal,
-- COUNT(p.promoId) AS promoUsed2, SUM(o.subtotal) AS subtotal2
-- FROM orders o, promotion p, views_promotion v1
-- WHERE (o.orderDate = v1.orderDate) AND
-- (EXTRACT(YEAR FROM o.orderDate) = &v_Year) AND
-- (EXTRACT(YEAR FROM v1.orderDate) = &v_Year) AND
-- o.promoId IS NULL
-- GROUP BY EXTRACT(MONTH FROM o.orderDate)
-- ORDER BY EXTRACT(MONTH FROM o.orderDate);

------------------- USE THIS----------------------
-- ACCEPT v_Year    DATE      FORMAT 'YYYY'   PROMPT 'Enter value Year format(YYYY): '

-- COLUMN city format a45 heading 'City'
-- COLUMN orderCount format 999999 heading 'Order Count'
-- COLUMN subtotal format 999999.99 heading 'SubTotal'

-- TTITLE CENTER 'CUSTOEMR REPORT' SKIP 1 -
-- CENTER 'TEST' SKIP 1 -
-- CENTER =========================================================================  SKIP 1 -
-- RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

-- SELECT c.city, COUNT(o.orderId) AS orderCount, SUM(o.subtotal) AS subtotal
-- FROM customers c, orders o
-- WHERE c.customerId = o.customerId AND
--        EXTRACT(YEAR FROM o.orderDate) = &v_Year
-- GROUP BY c.city
-- ORDER BY c.city LIMIT 1;

-- COLUMN city CLEAR
-- COLUMN orderCount CLEAR
-- COLUMN subtotal CLEAR
-- CLEAR BREAKS;
-- TTITLE OFF

------------------- USE THIS----------------------
-- ACCEPT v_Year    DATE      FORMAT 'YYYY'   PROMPT 'Enter value Year format(YYYY): '
-- BREAK ON city ON customers
-- SELECT c.city, o.customerId, COUNT(o.orderId) AS total
-- FROM customers c, orders o
-- WHERE c.customerId = o.customerId AND
--        EXTRACT(YEAR FROM o.orderDate) = &v_Year
-- GROUP BY c.city, o.customerId, c.customerName
-- ORDER BY c.city, total DESC;

