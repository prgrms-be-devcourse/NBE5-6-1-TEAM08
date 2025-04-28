DROP TABLE IF EXISTS `ORDERS`;

CREATE TABLE `ORDERS`
(
    `PRODUCT_NAME`   VARCHAR(36)       NOT NULL COMMENT '상품이름',
    `EMAIL`          VARCHAR(36)       NOT NULL COMMENT '이메일',
    `USER_ID`        VARCHAR(36)       NOT NULL COMMENT '사용자아이디',
    `ORDER_CNT`      int                NULL COMMENT '주문수량',
    `ORDER_DATE` timestamp NULL DEFAULT now() COMMENT '주문등록일자'
);

DROP TABLE IF EXISTS `PRODUCT`;
CREATE TABLE PRODUCT
(
    PRODUCT_ID   BIGINT      NOT NULL UNIQUE COMMENT '상품번호',
    PRODUCT_NAME VARCHAR(36) NOT NULL PRIMARY KEY COMMENT '상품이름',
    PRODUCT_INFO  VARCHAR(100) NOT NULL COMMENT '상품정보',
    PRICE        BIGINT       NOT NULL COMMENT '상품가격',
    STOCK_CNT    int          NULL     COMMENT '현재재고'
);

DROP TABLE IF EXISTS `user`;
CREATE TABLE user (
                      id BIGINT AUTO_INCREMENT PRIMARY KEY,
                      username VARCHAR(50) NOT NULL UNIQUE,
                      email VARCHAR(100) NOT NULL UNIQUE,
                      phone VARCHAR(20) NOT NULL UNIQUE,
                      password VARCHAR(255) NOT NULL,
                      role VARCHAR(20) DEFAULT 'USER',
                      created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);