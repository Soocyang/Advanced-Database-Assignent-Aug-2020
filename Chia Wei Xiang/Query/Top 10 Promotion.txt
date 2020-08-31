-- each promotion used time top 10 of a month
--done
--| promotion code | used_time | 

ACCEPT v_Month   DATE   FORMAT 'MM/YYYY'   PROMPT 'Enter value month/year format(MM/YYYY): '

COLUMN PromoId format 9999 heading 'PromoId'
COLUMN promoDesc format a80 heading 'promoDesc'
COLUMN USEDTIME format 9999 heading 'SubTUSEDTIMEotal'

TTITLE CENTER 'Top 10 Promotion' SKIP 1 -
CENTER 'OF MONTH &v_Month' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

SELECT p.PromoId, p.promoDesc,  COUNT(o.orderId) as USEDTIME
FROM orders o, promotion p
WHERE o.promoId = p.promoId AND
       to_char(o.orderDate, 'MM/YYYY') = '&v_Month'
GROUP BY p.PromoId, p.promoDesc
ORDER By USEDTIME DESC
FETCH next 10 row only;

COLUMN PromoId CLEAR
COLUMN promoDesc CLEAR
COLUMN USEDTIME CLEAR
CLEAR BREAKS;
TTITLE OFF