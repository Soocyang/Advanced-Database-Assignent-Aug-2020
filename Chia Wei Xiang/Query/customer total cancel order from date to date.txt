
ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '
ACCEPT v_toDate   DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for to date format(DD/MM/YYYY): '

COLUMN customerID format 9999 heading 'customerID'
COLUMN customerName format a50 heading 'customerName'
COLUMN phone format a15 heading 'phone'
COLUMN email format a20 heading 'email'
COLUMN orderID format 999999 heading 'orderID'
COLUMN subtotal format 999999 heading 'subtotal'
COLUMN status format a20 heading 'status'

TTITLE CENTER 'TOTAL CANCEL TIME OF CUSTOMER FROM DATE TO DATE' SKIP 1 -
CENTER 'FROM &v_fromDate TO &v_toDate' SKIP 1 -
CENTER =========================================================================  SKIP 1 -
RIGHT 'Page: ' FORMAT 999 SQL.PNO SKIP 2 -

SELECT c.customerID, c.customerName, c.phone, c.email, o.orderID, o.subtotal, o.status
FROM customers c, orders o
WHERE c.customerId = o.customerId AND
    o.status = 'Cancelled' AND
    o.orderDate BETWEEN TO_DATE('&v_fromDate', 'DD/MM/YYYY') AND TO_DATE('&v_toDate', 'DD/MM/YYYY')
ORDER BY c.customerID;

COLUMN customerID CLEAR
COLUMN customerName CLEAR
COLUMN phone CLEAR
COLUMN email CLEAR
COLUMN orderID CLEAR
COLUMN subtotal CLEAR
COLUMN status CLEAR
CLEAR BREAKS;
TTITLE OFF
