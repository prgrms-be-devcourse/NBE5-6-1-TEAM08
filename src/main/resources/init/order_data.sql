insert into orders(product_name, email, user_id, order_cnt, order_date)
values ('Hawaian_Cona', 'test@test', 'test', 2, '2025-04-24 15:30:26');
insert into orders (product_name, email, user_id, order_cnt, order_date)
values ('Blue_mountain', 'test2test', 'test2', 1, '2025-04-12 19:30:26');
insert into orders (product_name, email, user_id, order_cnt, order_date)
values ('ethiopia', 'test3@test', 'test3', 7, '2025-03-24 18:21:10');
insert into orders (product_name, email, user_id, order_cnt, order_date)
values ('korea', 'test@test', 'test4', 2, '2025-04-24 13:22:33');

insert into product(product_id, product_name, productInfo, price, stock_cnt)
values (1, 'Hawaian_Cona', '하와이산 원두입니다.', 20000, 100);
insert into product(product_id, product_name, productInfo, price, stock_cnt)
values (2, 'Blue_mountain', '블루 마운틴 원두입니다.', 25000, 100);
insert into product(product_id, product_name, productInfo, price, stock_cnt)
values (3, 'korea', '한국산 원두입니다.', 30000, 100);

insert into user(id, username, email, phone, password, role, created_at)
values (1000, 'test', 'test@test', '01012345678', 'testt', 'USER', '2025-02-28 12:30:21');
insert into user(id, username, email, phone, password, role, created_at)
values (1001, 'test2', 'test2@test', '01012355678', 'testt', 'USER', '2025-03-11 12:30:21');
insert into user(id, username, email, phone, password, role, created_at)
values (1002, 'test3', 'test3@test', '01012365678', 'testt', 'USER', '2025-03-05 12:30:21');
insert into user(id, username, email, phone, password, role, created_at)
values (1003, 'test4', 'test4@test', '01012385678', 'testt', 'USER', '2025-04-17 12:30:21');
