CREATE OR REPLACE PROCEDURE Rpt3(IN_Month IN VARCHAR)
IS
    v_avg_timeTaken     NUMBER := 0;
    v_totalOrders       NUMBER := 0; 

    v_pageCount         NUMBER := 1;
    V_loop              NUMBER := 0;
    v_break             NUMBER := 1;
    e_invalidInput      EXCEPTION;
    e_invalidDate       EXCEPTION;
    e_invalid_ToDate    EXCEPTION;

    CURSOR Report_Cursor IS
        SELECT p.PromoId, p.promoDesc,  COUNT(o.orderId) as USEDTIME
FROM orders o, promotion p
WHERE o.promoId = p.promoId AND
       to_char(o.orderDate, 'MM/YYYY') = IN_Month
GROUP BY p.PromoId, p.promoDesc
ORDER By USEDTIME DESC
FETCH next 10 row only;

    Report_rec Report_Cursor%ROWTYPE;

BEGIN

END;
/

-- exec proc_rider_performance_OnDemandRpt(1001, TO_DATE('01/07/2017', 'DD/MM/YYYY'), TO_DATE('07/07/2017', 'DD/MM/YYYY'));



