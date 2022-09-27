SELECT * FROM bookstore_db.orders order by order_time ASC;

update orders set order_time = adddate(order_time, 9) where id > 0;
update orders set deliver_date = date_format(adddate(order_time, deliver_days + 1), '%Y-%m-%d') where id > 0; 