CREATE TABLE `USER` (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      username VARCHAR(50) NOT NULL UNIQUE,
                      email VARCHAR(100) NOT NULL UNIQUE,
                      phone VARCHAR(20) NOT NULL UNIQUE,
                      password VARCHAR(255) NOT NULL,
                      role VARCHAR(20) DEFAULT 'USER',
                      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `ORDER`
(
    `PRODUCT_NAME`   VARCHAR(36)       NOT NULL PRIMARY KEY COMMENT '상품이름',
    `EMAIL`          VARCHAR(36)       NOT NULL COMMENT '이메일',
    `USER_ID`        VARCHAR(36)       NOT NULL COMMENT '사용자아이디',
    `ORDER_CNT`      int       NULL COMMENT '주문수량',
    `ORDER_DATE` timestamp NULL DEFAULT now() COMMENT '주문등록일자'
);

CREATE TABLE `PRODUCT`
(
    product_id BIGINT NOT NULL UNIQUE COMMENT '상품번호',
    product_name VARCHAR(36) NOT NULL PRIMARY KEY COMMENT '상품이름',
    productInfo VARCHAR(100) NOT NULL COMMENT '상품정보',
    price BIGINT NOT NULL COMMENT '상품가격',
    stock_cnt int NULL COMMENT '현재재고'
);