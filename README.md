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
