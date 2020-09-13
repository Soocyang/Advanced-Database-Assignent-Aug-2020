-- each promotion used time top 10 of a month
--done
--| promotion code | used_time | 
set linesize 120
set pagesize 120
set serveroutput on

ACCEPT v_Month   DATE   FORMAT 'MM/YYYY'   PROMPT 'Enter value month/year format(MM/YYYY): '

COLUMN PromoId format 9999 heading 'PromoId'
COLUMN promoDesc format a60 heading 'promoDesc'
COLUMN discountRate format 9.99 heading 'Rate'
COLUMN USEDTIME format 9999 heading 'Used Time'
COLUMN VALUEEARN format 9999.99 heading 'Total Price'
COLUMN AFTERDIS format 9999.99 heading 'After Discount'

TTITLE CENTER 'Top 10 Promotion' SKIP 1 -
CENTER 'OF MONTH &v_Month' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

SELECT p.PromoId, p.promoDesc, p.discountRate, 
COUNT(o.orderId) as USEDTIME, SUM(o.subtotal) AS VALUEEARN, 
SUM(o.subtotal*(1-p.discountRate)) AS AFTERDIS 
FROM orders o, promotion p
WHERE o.promoId = p.promoId AND
       to_char(o.orderDate, 'MM/YYYY') = '&v_Month'
GROUP BY p.PromoId, p.promoDesc, p.discountRate
ORDER By USEDTIME DESC
FETCH next 10 row only;

COLUMN PromoId CLEAR
COLUMN promoDesc CLEAR
COLUMN discountRate CLEAR
COLUMN USEDTIME CLEAR
COLUMN VALUEEARN CLEAR
COLUMN AFTERDIS CLEAR
CLEAR BREAKS;
TTITLE OFF