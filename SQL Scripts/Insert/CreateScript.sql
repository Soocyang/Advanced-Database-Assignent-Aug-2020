DROP TABLE categoryList;
DROP TABLE foodItemList;
DROP TABLE orderDetails;
DROP TABLE category;
DROP TABLE menu;
DROP TABLE foodItem;
DROP TABLE restaurant;
DROP TABLE reviews;
DROP TABLE orders;
DROP TABLE promotion;
DROP TABLE customers; 
DROP TABLE riders;

CREATE TABLE riders(
    riderId    number(11)   NOT NULL,
    riderName  varchar(100) NOT NULL,
    riderPhone varchar(50)  NOT NULL UNIQUE,
    PRIMARY KEY (riderId)
);

CREATE TABLE customers(
     customerId     number(11)   NOT NULL,
     customerName   varchar(100) NOT NULL,
     phone          varchar(50)  NOT NULL UNIQUE,
     email          varchar(50)  NOT NULL UNIQUE,
     address        varchar(150) NOT NULL,
     city           varchar(50)  NOT NULL,
     state          varchar(50)  NOT NULL,
     postalCode     varchar(15)  NOT NULL,
     credits        number(5,2)  DEFAULT 10.00,
     PRIMARY KEY (customerId)
);

CREATE TABLE promotion(
    promoId         number(11)   NOT NULL,
    promoDesc       varchar(250),
    discountRate    number(4,2)  NOT NULL,
    expiryDate      date         NOT NULL,
    PRIMARY KEY (promoId)
);

CREATE TABLE orders(
    orderId       number(11)  NOT NULL,
    customerId    number(11)  NOT NULL,
    promoId       number(11),
    riderId       number(11)  NOT NULL,
    subtotal      number(9,2) NOT NULL,
    paymentMethod varchar(30) NOT NULL,
    deliveryFees  number(5,2) NOT NULL,
    orderDate     date        NOT NULL,
    status        varchar(15) NOT NULL,
    estimatedTime date        NOT NULL,
    receivedTime  date        NOT NULL,
    PRIMARY KEY(orderId),
    CONSTRAINT fk_orders_customer FOREIGN KEY (customerId) REFERENCES customers(customerId),
    CONSTRAINT fk_orders_promotion FOREIGN KEY (promoId) REFERENCES promotion(promoId),
    CONSTRAINT fk_orders_riders FOREIGN KEY (riderId) REFERENCES riders(riderId),
    CONSTRAINT chk_status CHECK (status = 'Delivered' OR status='Cancelled'),
    CONSTRAINT chk_paymentMethod CHECK (paymentMethod = 'COD'
                                        OR paymentMethod = 'E-wallet' 
                                        OR paymentMethod = 'Online Banking'
                                        OR paymentMethod = 'Credit or Debit Card'
                                        OR paymentMethod = 'In-App Credits')
);

CREATE TABLE reviews(
    reviewId    number(11)    NOT NULL,
    orderId     number(11)    NOT NULL,
    comments    varchar(400)  NOT NULL,
    rating      number(2)     NOT NULL,
    reviewDate  date          NOT NULL,
    reorder     varchar(15)   NOT NULL,
    PRIMARY KEY (reviewId),
    CONSTRAINT fk_reviews_orders FOREIGN KEY (orderId) REFERENCES orders(orderId),
    CONSTRAINT chk_reorder CHECK (reorder = 'Yes' OR reorder = 'No')
);
---------------------------------------------------------------------------------------
CREATE TABLE restaurant(
    restaurantId   number(11)   NOT NULL,
    restaurantName varchar(100) NOT NULL,
    restaurantDesc varchar(250),
    contactNumber  varchar(15)  NOT NULL,
    email          varchar(50)  NOT NULL,
    address        varchar(150) NOT NULL,
    city           varchar(50)  NOT NULL,
    state          varchar(50)  NOT NULL,
    postalCode     varchar(15)  NOT NULL,
    operatingHour  varchar(50)  NOT NULL,
    rating         number(2)    NOT NULL,
    PRIMARY KEY (restaurantId)
);

CREATE TABLE foodItem(
    foodItemId number(11)    NOT NULL,
    foodItemName varchar(50) NOT NULL,
    foodDesc varchar(250),
    PRIMARY KEY (foodItemId)
);

CREATE TABLE menu(
    menuId          number(11)   NOT NULL,
    restaurantId    number(11)   NOT NULL,
    menuName        varchar(50)  NOT NULL,
    category        varchar(50)  NOT NULL,
    menuDesc        varchar(250),
    price           number(7,2)  NOT NULL,
    availableTime   varchar(50)  NOT NULL,
    PRIMARY KEY (menuId),
    CONSTRAINT fk_menu_restaurant FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);

CREATE TABLE category(
    categoryId number(11)     NOT NULL,
    categoryName varchar(50)  NOT NULL,
    PRIMARY KEY (categoryId)
);

--------------------------------------------------------------------------------------------------

CREATE TABLE orderDetails(
    orderId         number(11)   NOT NULL,
    menuId          number(11)   NOT NULL,
    quantityOrdered number(4)    NOT NULL,
    priceEach       number(7,2)  NOT NULL,
    PRIMARY KEY (orderId, menuId),
    CONSTRAINT fk_orderDetails_orders FOREIGN KEY (orderId) REFERENCES orders(orderId),
    CONSTRAINT fk_orderDetails_menuId FOREIGN KEY (menuId) REFERENCES menu(menuId)
);

CREATE TABLE foodItemList(
    menuId     number(11)  NOT NULL,
    foodItemId number(11)  NOT NULL,
    quantity   number(2)   NOT NULL,
    PRIMARY KEY (menuId, foodItemId),
    CONSTRAINT fk_foodItemList_menu FOREIGN KEY (menuId) REFERENCES menu(menuId),
    CONSTRAINT fk_foodItemList_foodItem FOREIGN KEY (foodItemId) REFERENCES foodItem(foodItemId)
);

CREATE TABLE categoryList(
    categoryId number(11)   NOT NULL,
    restaurantId number(11) NOT NULL,
    PRIMARY KEY (categoryId, restaurantId),
    CONSTRAINT fk_categoryList_category FOREIGN KEY (categoryId) REFERENCES category(categoryId),
    CONSTRAINT fk_categoryList_restaurant FOREIGN KEY (restaurantId) REFERENCES restaurant(restaurantId)
);


-- Show all table created
column "Table Created" format a25
select table_name as "Table Created"
from user_tables;


-- Show constraints
column "OWNER" format a10
column "CONSTRAINT_NAME" format a20
column "TABLE_NAME" format a20
column "COLUMN_NAME" format a20

SELECT *
FROM user_cons_columns
WHERE table_name = 'REVIEWS';



select count(*) as TotalNumberOfCategory
from category;

select count(*) as TotalNumberOfCategoryList
from categorylist;

select count(*) as TotalNumberOfRestaurant
from restaurant;

select count(*) as TotalNumberOfMenu
from menu;

select count(*) as TotalNumberOfFoodItem
from foodItem;

select count(*) as TotalNumberOfFoodItemList
from foodItemList;