RAISE_APPLICATION_ERROR(-20001, 'Fooditem cannot be insert: Either menu or fooditem not found.');
RAISE_APPLICATION_ERROR(-20002, 'There are too many fooditem for this menu already. You cannot add more than 10 fooditem for the menu.');
RAISE_APPLICATION_ERROR(-20003, 'Invalid Input: Input Year Must Be A Numberic.');
RAISE_APPLICATION_ERROR(-20004, 'Invalid Input: Input Year Cannot Be Future Year.');
RAISE_APPLICATION_ERROR(-20005, 'Invalid Input: Input Date Must Be DD/MM/YYYY.');
RAISE_APPLICATION_ERROR(-20006, 'Invalid Input: Input Date Cannot Be Future Date.');
RAISE_APPLICATION_ERROR(-20007, 'Invalid Input: Input From Date Cannot Be Greater Than To Date.');

RAISE_APPLICATION_ERROR(-20010, 'Error Found. Please Contact Your Database Administrator.');
