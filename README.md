# Create & Insert SQL Script

## Tables 

|  Table Name   | Number of rows |
| ------------- |           ---: |
| Riders        |              40|
| Customers     |             200|
| Promotion     |              30|
| Orders        |          28,800|
| Reviews       |           18000|
| Restaurant    |              20|
| FoodItem      |             200|
| Menu          |             300|
| Category      |              30|
| OrderDetails  |          86,400|
| FoodItemList  |             600|
| CategoryList  |              77|


## Instruction to run the script
1. Ensure you login with a new user/ if no please create a new user.
2. Start running the script **one file by one file**.
3. Make sure **follow the sequence** as the table listed above.
4. Ignore *CreateScript.sql* and *Drop_All_Table.sql* for now.

## Useful commands 
DISPLAY USER CREATED TABLES
```
column table_name format a30

select table_name
from user_tables;
```
Execute the file
```
SQL > start {file_path/drag n drop here}
```


## Queries

### Brendan Chew Jian Wen (Restaurant/Orders)
1. Sales from which location Highest(Top 5) --> Compare by Years/Month
2. Sales from which Restaurant Compare by month
3. Total Orders Group by Payment Method (summary rpt) by Month

### Chia Wei Xiang (Promotion/Customers)
1. Promotion Code Used Count(*) compare over month
2. Order + Promotion Promotion By (Sales) link to order compare over month 
3. Customers with highest orders by location by month

### Cheah Poh Reng (Reviews/Menu)
1. Reviews with Reorder(True?) Total Reorder
2. Review Rating by Orders by Restaurant by Compare Years
3. Menu (Category) Most Orders (Top 10 menu) by restaurant by month/ weeks

### Soo Cia Yang (Riders)
1. Rider Performance - Total Orders Delivered Comparison by Years
2. Rider Performance - Toal Orders Delivered By Month - Details
3. Rider Performance - Average time taken to delivered orders

## Procedures
1. Insert_menu -- input number of fooditem, loop the input and insert into the fooditemlist
2. Update_menu -- update the price of the menu item

1. Insert_orders -- input orders details, orders, Check Promo Code/ Expiry date, 
                 -- check customer with payment method of credits need verify,
                 -- Sum automatically the subtotal with the delivery fees,
2. Insert_orderList -- check food menu must all from the same restaurant / cannot from different restaurant with same order id

1. Insert_categoryList  -- the restaurant type 
                        -- categoryList 
2. Delete_categoryList  -- The type of the restaurant

1. Insert_reviews   -- check orders legit or not 
                    -- cancelled order insert cannot review 
                    -- Comments cannot more than 400 char
2. Update_review  -- reorder == yes or no

## Triggers
### For menu
1. verify_create_menu
2. verify_update_menu

1. verify_create_orders
2. verify_create_orderList

1. verify_new_restaurant
2. verify_update_restaurant

1. verify_create_reviews
2. veridy_update_reviews