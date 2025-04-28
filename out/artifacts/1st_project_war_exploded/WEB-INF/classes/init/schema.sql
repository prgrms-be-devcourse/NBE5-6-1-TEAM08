DROP TABLE IF EXISTS `MEMBER`;

CREATE TABLE `MEMBER`
(
    `USER_ID`    VARCHAR(36) PRIMARY KEY COMMENT '회원 아이디',
    `PASSWORD`   VARCHAR(70) NOT NULL COMMENT '회원 비밀번호',
    `EMAIL`      VARCHAR(50) NOT NULL COMMENT '회원 이메일',
    `ROLE`       CHAR(50)    NULL     DEFAULT 'ROLE_USER' COMMENT '회원 등급',
    `TEL`        VARCHAR(15) NULL COMMENT '회원 전화번호',
    `CREATED_AT` timestamp   NOT NULL DEFAULT now() COMMENT '가입일시',
    `ACTIVATED`  bool        NOT NULL DEFAULT true COMMENT '탈퇴여부'
);

DROP TABLE IF EXISTS `BOOK`;

CREATE TABLE `BOOK`
(
    `BK_IDX`     int          NOT NULL auto_increment PRIMARY KEY COMMENT '도서번호',
    `CATEGORY`   CHAR(20)     NULL COMMENT '도서카테고리',
    `TITLE`      VARCHAR(255) NOT NULL COMMENT '도서명',
    `AUTHOR`     VARCHAR(36)  NOT NULL COMMENT '저자',
    `INFO`       VARCHAR(36)  NULL COMMENT '도서설명',
    `AMOUNT`     int          NULL     DEFAULT 0 COMMENT '도서재고',
    `CREATED_AT` timestamp    NULL     DEFAULT now() COMMENT '도서등록일자',
    `RENT_CNT`   int          NULL     DEFAULT 0 COMMENT '대출횟수',
    `ACTIVATED`  boolean      NOT NULL DEFAULT true
);

DROP TABLE IF EXISTS `RENT_BOOK`;

CREATE TABLE `RENT_BOOK`
(
    `RB_IDX`      int          NOT NULL auto_increment PRIMARY KEY COMMENT '대출도서번호',
    `RENT_ID`     int          NOT NULL COMMENT '대출번호',
    `BK_IDX`      int          NOT NULL COMMENT '도서번호',
    `BOOK_TITLE`  VARCHAR(255) NOT NULL COMMENT '도서명',
    `CREATED_AT`  timestamp    NULL     DEFAULT now() COMMENT '대출일자',
    `STATE`       VARCHAR(36)  NULL     DEFAULT 'RE00' COMMENT '대출도서상태',
    `RETURN_DATE` timestamp    NULL COMMENT '반납예정일자',
    `ACTIVATED`   boolean      NOT NULL DEFAULT true
);

DROP TABLE IF EXISTS `BOOK_IMG`;

CREATE TABLE `BOOK_IMG`
(
    `BI_IDX`           int          NOT NULL auto_increment PRIMARY KEY COMMENT '파일번호',
    `BK_IDX`           int          NOT NULL,
    `TYPE`             VARCHAR(36)  NOT NULL,
    `ORIGIN_FILE_NAME` VARCHAR(255)  NOT NULL COMMENT '원본파일명',
    `RENAME_FILE_NAME` VARCHAR(255)  NOT NULL COMMENT '저장파일명',
    `SAVE_PATH`        VARCHAR(255) NOT NULL COMMENT '저장경로',
    `CREATED_AT`       timestamp    NULL     DEFAULT now() COMMENT '파일등록일자',
    `ACTIVATED`        boolean      NOT NULL DEFAULT true
);

DROP TABLE IF EXISTS `RENT_HISTORY`;

CREATE TABLE `RENT_HISTORY`
(
    `RH_IDX`     int       NOT NULL auto_increment PRIMARY KEY COMMENT '대출이력번호',
    `RENT_ID`    int       NOT NULL COMMENT '대출번호',
    `RB_IDX`     int       NOT NULL COMMENT '대출도서번호',
    `BK_IDX`     int       NULL COMMENT '도서번호',
    `CREATED_AT` timestamp NULL DEFAULT now() COMMENT '이력등록일자',
    `STATE`      CHAR(20)  NULL COMMENT '대출상태'
);

DROP TABLE IF EXISTS `MEMBER_INFO`;

CREATE TABLE `MEMBER_INFO`
(
    `USER_ID`       VARCHAR(36) PRIMARY KEY COMMENT '회원 아이디',
    `CREATED_AT`    timestamp NULL DEFAULT now() COMMENT '가입일자',
    `LOGIN_DATE`    timestamp NULL COMMENT '마지막로그인일자',
    `MODIFY_DATE`   timestamp NULL COMMENT '마지막수정일자',
    `LEAVE_DATE`    timestamp NULL COMMENT '탈퇴일자',
    `RENTABLE_DATE` timestamp NULL DEFAULT now() COMMENT '대출가능일자'
);

DROP TABLE IF EXISTS `RENT`;

CREATE TABLE `RENT`
(
    `RENT_ID`    int         NOT NULL auto_increment PRIMARY KEY COMMENT '대출번호',
    `USER_ID`    VARCHAR(36) NOT NULL COMMENT '회원 아이디',
    `CREATED_AT` timestamp   NULL     DEFAULT now() COMMENT '대출일자',
    `IS_RETURN`  bool        NULL     DEFAULT 0 COMMENT '반납여부',
    `TITLE`      VARCHAR(50) NOT NULL COMMENT '대출건제목',
    `ACTIVATED`  boolean     NOT NULL DEFAULT true
);
