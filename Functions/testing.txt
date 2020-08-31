

ACCEPT v_fromDate DATE   FORMAT 'DD/MM/YYYY'   PROMPT 'Enter value for from date format(DD/MM/YYYY): '

Select to_date('&v_fromDate', 'dd/mm/yyyy') + 7
From dual;

select TRUNC(TO_DATE('&inputDate', 'dd/mm/yyyy') + 7,  'iw')from dual;