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

## Set Page and Line Size
set linesize 120
set pagesize 35
set serveroutput on format wrap

## Brendan Chew Jian Wen
### Queries
1. Sales from which location Highest(Top 5) --> Compare by Years/Month
2. Sales from which Restaurant Compare by month
3. Total Orders Group by Payment Method (summary rpt) by Month
### Procedures
1. 
2. 
### Triggers
1. 
2. 
### Report
1. 
2. 
3. 

## Chia Wei Xiang
### Queries
1. Promotion Code Used Count(*) compare over month
2. Order + Promotion Promotion By (Sales) link to order compare over month 
3. Customers with highest orders by location by month
4. Orders with Promotion compare wothout Promotion
### Procedures
1. 
2. 
### Triggers
1. 
2. 
### Report
1. 
2. 
3. 

## Cheah Poh Reng
### Queries
1. Reviews with Reorder(True?) Total Reorder
2. Review Rating by Orders by Restaurant by Compare Years
3. Menu (Category) Most Orders (Top 10 menu) by restaurant by month/ weeks
### Procedures
1. 
2. 
### Triggers
1. 
2. 
### Report
1. 
2. 
3. 

## Soo Cia Yang
### Queries
1. Rider Performance - Total Orders Delivered Comparison by Years
2. Rider Performance - Toal Orders Delivered By Month - Details
3. Rider Performance - Average time taken to delivered orders
### Procedures
1. Insert restaurant category
2. Delete restaurant category
### Triggers
1. Trigger Update Audit Log When Insert Category List
2. Trigger Validate Insert Category List 

### Report
1. Summary Report – Rider Performance Report of Total Orders Delivered by Years
2. Detail Report – Rider Performance Report of Total Orders Delivered of the specific Year
3. On Demand Report – Rider Performance Report of Orders Details Delivered of the Rider

