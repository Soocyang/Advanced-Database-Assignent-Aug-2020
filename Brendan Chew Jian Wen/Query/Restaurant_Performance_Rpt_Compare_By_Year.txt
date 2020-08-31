
-- RESTAURANT_ID | R_NAME | TOTAL_ORDER COUNT(*) | TOTAL_SALES SUM( RM Subtotal)

-- ===========CREATE VIEWS================
CREATE OR REPLACE VIEW views_TotalOrders_Sales_Restaurant_by_year AS
      SELECT r.restaurantid, r.restaurantName, EXTRACT(YEAR FROM o.orderDate) year, count(o.orderId) TOTAL_ORDER, sum(o.Subtotal) TOTAL_SALES
      FROM restaurant r, menu m, orderDetails od, orders o 
      WHERE r.restaurantId = m.restaurantId AND
              m.menuId = od.menuId AND
              od.orderId = o.orderId
      GROUP BY r.restaurantid, r.restaurantName, EXTRACT(YEAR FROM o.orderDate)
      ORDER BY r.restaurantid, year;
-- ========================================
-- Test Views
-- COLUMN restaurantName FORMAT a45
-- select * from views_TotalOrders_Sales_Restaurant_by_year;
-- CLEAR COLUMNS

--===============CREATE QUERY=============
ACCEPT v_Year1   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 1st Year format(YYYY): '
ACCEPT v_Year2   DATE   FORMAT 'YYYY'   PROMPT 'Enter value 2nd Year format(YYYY): '

TTITLE CENTER 'RESTAURANT PERFORMANCE REPORT - TOTAL ORDERS AND SALES COMPARISON BY YEARS' -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 1 -
CENTER ==========================================================================  SKIP 2 -
LEFT '                RESTAURANT INFORMATION                          YEAR &v_Year1                YEAR &v_Year2' SKIP 1

COLUMN restaurant_ID FORMAT a5 HEADING 'R_ID'
COLUMN restaurantName FORMAT a50 HEADING 'Restaurant Name'
COLUMN Year_1_TOTAL_ORDERS FORMAT  9999999 HEADING 'Total Orders'
COLUMN Year_1_TOTAL_SALES FORMAT 9999999.99 HEADING 'Total Sales'
COLUMN Year_2_TOTAL_ORDERS FORMAT 9999999 HEADING 'Total Orders'
COLUMN Year_2_TOTAL_SALES FORMAT 9999999.99 HEADING 'Total Sales'

SELECT  CONCAT('R', r.restaurantId) AS restaurant_ID, 
        r.restaurantName, 
        v1.TOTAL_ORDER AS Year_1_TOTAL_ORDERS, 
        v1.TOTAL_SALES AS Year_1_TOTAL_SALES,
        v2.TOTAL_ORDER AS Year_2_TOTAL_ORDERS,
        v2.TOTAL_SALES AS Year_2_TOTAL_SALES
FROM    restaurant r, 
        views_TotalOrders_Sales_Restaurant_by_year v1,
        views_TotalOrders_Sales_Restaurant_by_year v2
WHERE   (r.restaurantId = v1.restaurantId) AND
        (v1.year = '&v_Year1') AND
        (r.restaurantId = v2.restaurantId) AND
        (v2.year = '&v_Year2') 
ORDER BY restaurant_ID;
CLEAR COLUMNS
TTITLE OFF



--============================
