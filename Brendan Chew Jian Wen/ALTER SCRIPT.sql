ALTER TABLE USER1.orderDetails
DROP CONSTRAINT fk_orderDetails_orders;

ALTER TABLE USER1.orderDetails
DROP CONSTRAINT fk_orderDetails_menuId;

ALTER TABLE USER1.orderDetails
ADD CONSTRAINT fk_orderDetails_orders FOREIGN KEY (orderId) REFERENCES orders(orderId) ON DELETE CASCADE;

ALTER TABLE USER1.orderDetails
ADD CONSTRAINT fk_orderDetails_menuId FOREIGN KEY (menuId) REFERENCES menu(menuId) ON DELETE CASCADE;

ALTER TABLE USER1.reviews
DROP CONSTRAINT fk_reviews_orders;

ALTER TABLE USER1.reviews
ADD CONSTRAINT fk_reviews_orders FOREIGN KEY (orderId) REFERENCES orders(orderId) ON DELETE CASCADE;

DELETE FROM orders WHERE orderid = 100001;
DELETE FROM orders WHERE orderid = 100011;
DELETE FROM orders WHERE orderid = 100111;
DELETE FROM orders WHERE orderid = 101111;
DELETE FROM orders WHERE orderid = 111111;
DELETE FROM orders WHERE orderid = 100002;
DELETE FROM orders WHERE orderid = 100022;
DELETE FROM orders WHERE orderid = 100222;
DELETE FROM orders WHERE orderid = 102222;
DELETE FROM orders WHERE orderid = 122222;
DELETE FROM orders WHERE orderid = 100003;
DELETE FROM orders WHERE orderid = 100033;
DELETE FROM orders WHERE orderid = 100333;
DELETE FROM orders WHERE orderid = 103333;
DELETE FROM orders WHERE orderid = 100004;
DELETE FROM orders WHERE orderid = 100044;
DELETE FROM orders WHERE orderid = 100444;
DELETE FROM orders WHERE orderid = 104444;
DELETE FROM orders WHERE orderid = 100005;
DELETE FROM orders WHERE orderid = 100055;
DELETE FROM orders WHERE orderid = 100555;
DELETE FROM orders WHERE orderid = 105555;
DELETE FROM orders WHERE orderid = 100006;
DELETE FROM orders WHERE orderid = 100066;
DELETE FROM orders WHERE orderid = 100666;
DELETE FROM orders WHERE orderid = 106666;
DELETE FROM orders WHERE orderid = 100007;
DELETE FROM orders WHERE orderid = 100077;
DELETE FROM orders WHERE orderid = 100777;
DELETE FROM orders WHERE orderid = 107777;
DELETE FROM orders WHERE orderid = 100008;
DELETE FROM orders WHERE orderid = 100088;
DELETE FROM orders WHERE orderid = 100888;
DELETE FROM orders WHERE orderid = 108888;
DELETE FROM orders WHERE orderid = 100009;
DELETE FROM orders WHERE orderid = 100099;
DELETE FROM orders WHERE orderid = 100999;
DELETE FROM orders WHERE orderid = 109999;
DELETE FROM orders WHERE orderid = 110000;
DELETE FROM orders WHERE orderid = 128800;




