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
1. Promotion Code Used Count(*)
2. Promotion link to order compare over years/month
3. Customers with highest orders by location by month

### Cheah Poh Reng (Reviews/Menu)
1. Reviews with Reorder(True?) Total Reorder
2. Review Rating by Orders by Restaurant by Compare Years
3. Menu (Category) Most Orders (Top 10 menu) by restaurant by month/ weeks

### Soo Cia Yang (Riders)
1. Rider Performance - Total Orders Delivered Comparison by Years
2. Rider Performance - Toal Orders Delivered By Month - Details
3. Rider Performance - Average time taken to delivered orders

