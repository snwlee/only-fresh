create table if not exists ADDRESS_TB
(
    addr_id   int auto_increment comment 'AUTO_INCREMENT'
        primary key,
    user_id   int                                   not null comment 'AUTO_INCREMENT',
    addr      varchar(30)                           null,
    ba_addr   tinyint(1)  default 0                 not null comment '선택 배송지 1: true, 0: false
',
    chk_addr  tinyint(1)  default 0                 null comment '1: 기본배송지  0: 일반 배송지',
    deli_type tinyint(1)  default 0                 not null comment '1:샛별배송, 0:낮배송',
    city_code varchar(30) default '1'               not null,
    main_addr varchar(50)                           not null,
    sub_addr  varchar(50) default ''                null,
    addr_name varchar(20) default ''                null,
    addr_tel  varchar(20) default ''                null,
    in_user   varchar(30) default 'in_user'         not null,
    in_date   datetime    default CURRENT_TIMESTAMP not null,
    up_user   varchar(30) default 'up_user'         not null,
    up_date   datetime    default CURRENT_TIMESTAMP not null
);

create table if not exists BOARD_TB
(
    bbs_id      int auto_increment comment 'auto increment, PK'
        primary key,
    pdt_id      int                                   not null comment 'AUTO_INCREMENT',
    user_id     int                                   not null comment 'AUTO_INCREMENT',
    bbs_title   varchar(60)                           not null,
    wrt_dt      datetime    default CURRENT_TIMESTAMP not null,
    user_nm     varchar(20)                           not null,
    bbs_clsf_cd varchar(30)                           not null,
    in_date     datetime    default CURRENT_TIMESTAMP not null,
    in_user     varchar(30)                           not null,
    up_date     datetime    default CURRENT_TIMESTAMP not null,
    up_user     varchar(30)                           not null,
    notice      varchar(10) default '0'               not null
);

create table if not exists ANSWER_TB
(
    bbs_id   int                                not null
        primary key,
    inq_ans  text                               not null,
    ans_dt   datetime default CURRENT_TIMESTAMP not null,
    in_date  datetime default CURRENT_TIMESTAMP null,
    int_user varchar(30)                        null,
    up_date  datetime default CURRENT_TIMESTAMP null,
    up_user  varchar(30)                        null,
    constraint FK_BOARD_TB_TO_ANSWER_TB_1
        foreign key (bbs_id) references BOARD_TB (bbs_id)
            on delete cascade
);

create table if not exists BOARD_CONTENT_TB
(
    bbs_id  int                                     not null
        primary key,
    bbs_cn  varchar(5000) default ''                not null,
    in_date datetime      default CURRENT_TIMESTAMP not null,
    in_user varchar(30)   default ''                not null,
    up_date datetime      default CURRENT_TIMESTAMP not null,
    up_user varchar(30)   default ''                not null,
    constraint FK_BOARD_TB_TO_BOARD_CONTENT_TB_1
        foreign key (bbs_id) references BOARD_TB (bbs_id)
            on delete cascade
);

create table if not exists CART_TB
(
    user_id int                                   not null comment '유저 id (AUTO_INCREMENT)',
    pdt_id  int                                   not null comment '제품 id (AUTO_INCREMENT)',
    pdt_qty int         default 1                 not null,
    in_date datetime    default CURRENT_TIMESTAMP not null,
    in_user varchar(30) default 'in_user'         not null,
    up_date datetime    default CURRENT_TIMESTAMP not null,
    up_user varchar(30) default 'up_user'         null,
    primary key (user_id, pdt_id)
);

create table if not exists CATEGORY_CHILD_TB
(
    cd_type_id varchar(50) not null,
    cd_name    varchar(50) not null comment 'EX)콩나물,감자,당근',
    cd_code    varchar(30) null
);

create table if not exists CATEGORY_PR_TB
(
    cd_type_id   varchar(50) not null,
    cd_type_name varchar(50) not null,
    cd_code      varchar(30) null
);

create table if not exists CATEGORY_TB
(
    cat_code varchar(30) not null comment '코드테이블 -> 카테고리 코드 '
        primary key,
    pdt_id   int comment 'AUTO_INCREMENT',
    cd_name  varchar(50) not null
);

create index FK_PRODUCT_TB_TO_CATEGORY_TB_1
    on CATEGORY_TB (pdt_id);

alter table CATEGORY_TB
    modify pdt_id int auto_increment comment 'AUTO_INCREMENT';

create table if not exists CITY_CODE_TB
(
    ct_code      int auto_increment
        primary key,
    cd_type_id   varchar(20)                           not null,
    cd_type_name varchar(20)                           not null,
    city_code    varchar(20)                           not null,
    cd_name      varchar(20)                           not null,
    in_user      varchar(30) default 'in_user'         not null,
    in_date      datetime    default CURRENT_TIMESTAMP not null,
    up_user      varchar(30) default 'up_user'         not null,
    up_date      datetime    default CURRENT_TIMESTAMP not null
);

create table if not exists COMMON_CODE_TB
(
    cat_code    varchar(10)                            not null,
    cd_type_id  varchar(30)                            not null,
    cd_name     varchar(30)                            not null comment 'EX)콩나물·버섯',
    cd_name_num int                                    not null,
    brief_desc  varchar(50)  default '정말로 맛있습니다'       null,
    long_desc   varchar(150) default '아주 맛이 베리굿굿'      null,
    `order`     int                                    not null,
    is_use      tinyint(1)   default 0                 not null,
    in_date     datetime     default CURRENT_TIMESTAMP not null,
    in_user     varchar(30)  default 'khm'             not null,
    up_date     datetime     default CURRENT_TIMESTAMP not null,
    up_user     varchar(30)  default 'lsw'             not null,
    primary key (cat_code, cd_type_id)
);

create table if not exists COMMON_CODE_TYPE_TB
(
    cd_type_id    varchar(10)                        not null
        primary key,
    up_cd         varchar(5)                         not null,
    up_cd_type_id varchar(10)                        not null,
    cd_type_name  varchar(10)                        not null comment 'EX)채소',
    in_date       datetime default CURRENT_TIMESTAMP not null,
    in_user       varchar(30)                        not null,
    up_date       datetime default CURRENT_TIMESTAMP not null,
    up_user       varchar(30)                        not null
);

create table if not exists DELIVERY_LOG_TB
(
    order_id     int                                  not null comment 'AUTO_INCREMENT'
        primary key,
    rcv_nm       varchar(30)                          not null,
    rcv_mobl     varchar(30)                          not null,
    all_addr     varchar(100)                         not null comment '주소 + 상세 주소',
    req_dtls     varchar(100)                         null,
    dlvr_stus_cd varchar(30)                          not null comment '배송대기, 배송중, 배송완료',
    pack_typ_cd  varchar(30)                          not null comment '상온, 냉장, 냉동',
    dlvr_yn      tinyint(1) default 1                 not null comment '배송 직후, 수신 거부',
    in_date      datetime   default CURRENT_TIMESTAMP not null,
    in_user      varchar(30)                          not null,
    up_date      datetime   default CURRENT_TIMESTAMP not null,
    up_user      varchar(30)                          not null
);

create table if not exists EVENT_PRODUCT_LIST_TB
(
    event_id int                                not null comment 'AUTO_INCREMENT',
    pdt_id   int                                not null comment 'AUTO_INCREMENT',
    in_date  datetime default CURRENT_TIMESTAMP not null,
    in_user  varchar(30)                        not null,
    up_date  datetime default CURRENT_TIMESTAMP not null,
    up_user  varchar(30)                        not null,
    primary key (event_id, pdt_id)
);

create table if not exists EVENT_TB
(
    event_id       int auto_increment comment 'AUTO_INCREMENT'
        primary key,
    nm             varchar(50)                           not null,
    des            varchar(200)                          null,
    photo          varchar(1000)                         null,
    photo_alt      varchar(100)                          null,
    cat_cd         int                                   not null,
    setl_methd_cd  varchar(10)                           null,
    stpt_dd        datetime                              not null,
    expi_dd        datetime                              not null,
    early_end_stus tinyint(1)  default 0                 not null,
    ds_rate        int         default 0                 not null,
    in_date        datetime    default CURRENT_TIMESTAMP not null,
    in_user        varchar(30) default 'abc'             not null,
    up_date        datetime    default CURRENT_TIMESTAMP not null,
    up_user        varchar(30) default 'CURRENT_USER'    not null
);

create table if not exists COUPON_TB
(
    coupn_id         int auto_increment comment 'AUTO INCREMENT'
        primary key,
    event_id         int                                   null,
    nm               varchar(50)                           not null,
    ds_max_posbl_amt int                                   null,
    func             varchar(10)                           not null,
    lmtt_cnd         varchar(50)                           null,
    unit_type        tinyint     default 0                 null,
    value            int         default 0                 not null,
    expi_dd          char(8)                               not null,
    in_date          datetime    default CURRENT_TIMESTAMP not null,
    in_user          varchar(30) default 'CURRENT_USER'    not null,
    up_date          datetime    default CURRENT_TIMESTAMP not null,
    up_user          varchar(30) default 'CURRENT_USER'    not null,
    use_cnd          varchar(50)                           null,
    constraint COUPON_TB_ibfk_1
        foreign key (event_id) references EVENT_TB (event_id)
            on delete cascade
);

create index event_id_idx
    on COUPON_TB (event_id);

create table if not exists INQ_BOARD_TB
(
    bbs_id     int                                  not null
        primary key,
    is_secret  tinyint(1) default 0                 not null comment 'true면 비밀글',
    is_replied tinyint(1) default 0                 not null comment 'true면 답변완료',
    in_date    datetime   default CURRENT_TIMESTAMP not null,
    int_user   varchar(30)                          not null,
    up_date    datetime   default CURRENT_TIMESTAMP not null,
    up_user    varchar(30)                          not null,
    constraint FK_BOARD_TB_TO_INQ_BOARD_TB_1
        foreign key (bbs_id) references BOARD_TB (bbs_id)
            on delete cascade
);

create table if not exists KURLYPAY_POINT_HIST_TB
(
    pnt_hist_id int auto_increment,
    user_id     int                                not null comment 'AUTO_INCREMENT',
    odr_id      int                                not null comment 'AUTO_INCREMENT',
    chng_pnt    int                                not null,
    pnt_chng_dt timestamp                          null,
    in_date     datetime default CURRENT_TIMESTAMP not null,
    in_user     varchar(30)                        not null,
    up_date     datetime default CURRENT_TIMESTAMP not null,
    up_user     varchar(30)                        not null,
    primary key (pnt_hist_id, user_id)
);

create table if not exists NON_USER_TB
(
    email     varchar(30)                          not null,
    id        int                                  not null comment 'AUTO_INCREMENT',
    mobl      varchar(20)                          not null,
    sel_terms tinyint(1) default 1                 not null,
    dlvr_info varchar(30)                          not null,
    in_date   datetime   default CURRENT_TIMESTAMP not null,
    in_user   varchar(30)                          not null,
    up_date   datetime   default CURRENT_TIMESTAMP not null,
    up_user   varchar(30)                          not null,
    primary key (email, id)
);

create table if not exists ORDER_LOG_TB
(
    ord_id       int                                not null comment 'AUTO_INCREMENT'
        primary key,
    ord_nm       varchar(20)                        not null,
    ord_mobl     varchar(20)                        not null,
    ord_stus_cd  varchar(30)                        not null comment '주문대기, 주문완료, 주문취소, 주문오류',
    ord_dcrs_dtm datetime                           null,
    in_date      datetime default CURRENT_TIMESTAMP not null,
    in_user      varchar(30)                        not null,
    up_date      datetime default CURRENT_TIMESTAMP not null,
    up_user      varchar(30)                        not null
);

create table if not exists ORDER_PRODUCT_TB
(
    ord_id  int                                   not null comment 'AUTO_INCREMENT',
    pdt_id  int                                   not null comment 'AUTO_INCREMENT',
    pdt_qty int         default 1                 not null,
    in_date datetime    default CURRENT_TIMESTAMP not null,
    in_user varchar(30) default 'in_user'         not null,
    up_date datetime    default CURRENT_TIMESTAMP not null,
    up_user varchar(30) default 'up_user'         not null,
    primary key (ord_id, pdt_id)
);

create table if not exists ORDER_TB
(
    ord_id     int auto_increment comment '주문 ID, AUTO_INCREMENT'
        primary key,
    user_id    int                                   not null comment '유저 ID, AUTO_INCREMENT',
    addr_id    int         default 0                 not null comment '배송지 ID, AUTO_INCREMENT',
    coupn_id   int         default 0                 not null comment '쿠폰 ID, AUTO INCREMENT',
    stus_cd    varchar(30) default 'O001'            not null comment '주문 상태 코드 (주문대기, 주문완료, 주문취소, 주문오류)',
    req_plc_cd varchar(30) default ''                not null comment '요청 수령 장소 (문 앞, 경비실, 택배함)',
    req_dtls   varchar(100)                          null comment '세부 요청 사항',
    used_acamt int         default 0                 not null comment '사용된 포인트',
    dlvr_yn    tinyint(1)  default 1                 not null comment '배송 완료 여부 (배송 직후, 수신 거부)',
    in_date    datetime    default CURRENT_TIMESTAMP not null,
    in_user    varchar(30) default 'in_user'         not null,
    up_date    datetime    default CURRENT_TIMESTAMP not null,
    up_user    varchar(30) default 'up_user'         not null,
    all_amt    int         default 0                 null comment '총 주문 가격'
);

create table if not exists PAYMENT_LOG_TB
(
    ord_id       int         not null comment 'AUTO_INCREMENT'
        primary key,
    setl_stus_cd varchar(30) not null,
    setl_mn_cd   varchar(30) not null comment '신용카드, 간편결제, 휴대폰',
    setl_amt     int         not null,
    setl_dtm     datetime    not null,
    in_date      datetime    not null,
    in_user      varchar(30) not null,
    up_date      datetime    not null,
    up_user      varchar(30) not null
);

create table if not exists PAYMENT_TB
(
    ord_id       int                                   not null comment 'AUTO_INCREMENT'
        primary key,
    user_id      int                                   not null comment 'AUTO_INCREMENT',
    setl_cd      varchar(30)                           not null comment '결제 수단 코드 (신용카드, 간편결제, 휴대폰)',
    setl_stus_cd varchar(30) default 'M001'            not null comment '결제 상태 코드 (결제중, 결제완료, 결제취소, 결제오류)',
    all_amt      int                                   not null comment '총 상품 금액',
    all_dc_amt   int         default 0                 not null comment '총 상품 할인 금액',
    dlvr_amt     int         default 0                 not null comment '배송비',
    in_date      datetime    default CURRENT_TIMESTAMP not null,
    in_user      varchar(30) default 'in_user'         not null,
    up_date      datetime    default CURRENT_TIMESTAMP not null,
    up_user      varchar(30) default 'up_user'         not null
);

create table if not exists PRICE_CHANGE_HISTORY_TB
(
    his_id  int auto_increment comment 'AUTO_INCREMENT',
    pdt_id  int                                not null comment 'AUTO_INCREMENT',
    bf_date date                               not null,
    ar_date date                               not null,
    price   int      default 0                 not null,
    his_rsn varchar(50)                        not null,
    in_date datetime default CURRENT_TIMESTAMP not null,
    in_user varchar(30)                        not null,
    up_date datetime default CURRENT_TIMESTAMP not null,
    up_user varchar(30)                        not null,
    primary key (his_id, pdt_id)
);

create table if not exists PRODUCT_TAG_TB
(
    tag_id  int auto_increment comment 'AUTO_INCREMENT',
    pdt_id  int                                not null comment 'AUTO_INCREMENT',
    in_date datetime default CURRENT_TIMESTAMP not null,
    in_user varchar(30)                        not null,
    up_date datetime default CURRENT_TIMESTAMP not null,
    up_user varchar(30)                        not null,
    primary key (tag_id, pdt_id)
);

create table if not exists PRODUCT_TB
(
    pdt_id     int auto_increment comment 'AUTO_INCREMENT'
        primary key,
    price      int          default 0                 not null,
    image      varchar(255) default 'dd'              not null,
    ds_rate    int          default 0                 not null,
    sel_price  int          default 0                 not null,
    title      varchar(50)  default 'hi'              not null,
    sub_title  varchar(50)  default 'hello'           not null,
    rec_info   varchar(50)                            null,
    adt_sts    tinyint(1)   default 0                 not null,
    stock      int          default 0                 not null,
    in_date    datetime     default CURRENT_TIMESTAMP not null,
    in_user    varchar(30)  default 'goodboy'         not null,
    up_date    datetime     default CURRENT_TIMESTAMP not null,
    up_user    varchar(30)  default 'badboy'          not null,
    sales_rate int          default 50                not null,
    company    varchar(50)                            null,
    de_type    tinyint(1)                             not null
);

create table if not exists PRODUCT_DETAIL_TB
(
    pdt_id    int                                    not null comment 'AUTO_INCREMENT'
        primary key,
    pack_cd   varchar(30)                            not null comment '상온, 냉장, 냉동',
    sell_cd   varchar(30)                            not null,
    weca_cd   varchar(30)                            not null,
    allg_dt   varchar(200) default ''                null,
    ex_dt     varchar(100) default ''                null,
    origin    varchar(20)  default ''                null,
    notice    varchar(300) default ''                null,
    prt_info  text                                   not null,
    prt_image varchar(255) default ''                null,
    company   varchar(20)  default ''                null,
    de_type   tinyint(1)   default 1                 not null comment 'T:샛별배송, F:낮배송',
    in_date   datetime     default CURRENT_TIMESTAMP not null,
    in_user   varchar(30)                            not null,
    up_date   datetime     default CURRENT_TIMESTAMP not null,
    up_user   varchar(30)                            not null,
    constraint FK_PRODUCT_TB_TO_PRODUCT_DETAIL_TB_1
        foreign key (pdt_id) references PRODUCT_TB (pdt_id)
            on delete cascade
);

create table if not exists REVIEW_BOARD_TB
(
    bbs_id    int                                not null
        primary key,
    revw_like int      default 0                 not null,
    revw_img  varchar(255)                       null,
    in_date   datetime default CURRENT_TIMESTAMP not null,
    in_user   varchar(30)                        not null,
    up_date   datetime default CURRENT_TIMESTAMP not null,
    up_user   varchar(30)                        not null,
    constraint FK_BOARD_TB_TO_REVIEW_BOARD_TB_1
        foreign key (bbs_id) references BOARD_TB (bbs_id)
            on delete cascade
);

create table if not exists SKU_TB
(
    st_hi_id    int auto_increment,
    pdt_id      int                                not null comment 'AUTO_INCREMENT',
    stock       int                                not null,
    st_in_date  datetime                           not null,
    st_out_date datetime                           not null,
    sku_code    varchar(100)                       not null comment 'SKU관리',
    in_date     datetime default CURRENT_TIMESTAMP not null,
    in_user     varchar(30)                        not null,
    up_date     datetime default CURRENT_TIMESTAMP not null,
    up_user     varchar(30)                        not null,
    primary key (st_hi_id, pdt_id)
);

create table if not exists TAG_TB
(
    tag_id   int auto_increment comment 'AUTO_INCREMENT'
        primary key,
    tag_name varchar(50)                        not null,
    in_date  datetime default CURRENT_TIMESTAMP not null,
    in_user  varchar(30)                        not null,
    up_date  datetime default CURRENT_TIMESTAMP not null,
    up_user  varchar(30)                        not null
);

create table if not exists USER_COUPON_TB
(
    coupn_id int                                   not null comment 'AUTO INCREMENT',
    user_id  int                                   not null comment 'AUTO_INCREMENT',
    used     tinyint     default 0                 not null,
    in_date  datetime    default CURRENT_TIMESTAMP not null,
    up_date  datetime    default CURRENT_TIMESTAMP not null,
    up_user  varchar(30) default 'CURRENT_USER'    not null,
    in_user  varchar(30) default 'CURRENT_USER'    not null,
    primary key (coupn_id, user_id)
);

create table if not exists USER_INFO_TB
(
    user_id     int                                  not null comment 'AUTO_INCREMENT'
        primary key,
    coupn_id    int                                  not null comment 'AUTO INCREMENT',
    pnt_hist_id int                                  not null,
    gd_cd       varchar(10)                          not null comment 'AUTO_INCREMENT',
    subs_state  tinyint(1) default 0                 not null,
    in_update   datetime   default CURRENT_TIMESTAMP not null,
    in_user     varchar(30)                          not null,
    up_date     datetime   default CURRENT_TIMESTAMP not null,
    up_user     varchar(30)                          not null
);

create table if not exists USER_LIKE_NO
(
    user_id int                                   not null,
    bbs_id  int                                   not null,
    like_no int         default 0                 not null,
    in_date datetime    default CURRENT_TIMESTAMP not null,
    in_user varchar(30) default 'in_user'         not null,
    up_date datetime    default CURRENT_TIMESTAMP not null,
    up_user varchar(30) default 'up_user'         not null,
    primary key (user_id, bbs_id)
);

create table if not exists USER_MOD_INFO_TB
(
    user_id int                                not null comment 'AUTO_INCREMENT'
        primary key,
    prvc_cd varchar(10)                        not null comment '이메일,비밀번호,이름,성별,생년월일',
    content varchar(10)                        null,
    in_date datetime default CURRENT_TIMESTAMP not null,
    in_user varchar(30)                        not null,
    up_date datetime default CURRENT_TIMESTAMP not null,
    up_user varchar(30)                        not null
);

create table if not exists USER_TB
(
    user_id     int auto_increment comment '유저 ID (AUTO_INCREMENT)'
        primary key,
    user_nm     varchar(20)                           not null comment '이름',
    user_email  varchar(30) default '1234'            not null,
    pwd         varchar(500)                          not null comment '비밀번호',
    telno       varchar(30) default '1'               not null comment '휴대폰',
    subs_dt     varchar(30) default '1'               not null comment '가입일',
    gender      varchar(10) default '1'               not null comment '성별',
    bryr        varchar(30) default '1'               not null comment '생년월일',
    prvc_arge   tinyint(1)  default 1                 not null comment '선택 이용 약관 동의',
    user_cls_cd varchar(10) default '0'               not null comment '유저 분류 코드 (관리자, 유저)',
    rcmdr_email varchar(30)                           null comment '추천인 이메일',
    pnt         int         default 3000              null comment '페이 포인트',
    in_date     datetime    default CURRENT_TIMESTAMP not null,
    in_user     varchar(30) default 'in_user'         not null,
    up_date     datetime    default CURRENT_TIMESTAMP not null,
    up_user     varchar(30) default 'up_user'         not null
);

create table if not exists USER_TIER_BNFT_TB
(
    gd_cd        varchar(10)                           not null comment 'AUTO_INCREMENT'
        primary key,
    gd_nm        varchar(10) default '일반'              not null,
    gd_rate      int                                   not null,
    coupn_id     int                                   null,
    revw_acamt   int                                   null,
    mmby_gift    varchar(20)                           null,
    acmlt_py_cnd int                                   null,
    in_date      datetime    default CURRENT_TIMESTAMP not null,
    in_user      varchar(30)                           not null,
    up_date      datetime    default CURRENT_TIMESTAMP not null,
    up_user      varchar(30)                           not null
);

create table if not exists USER_WISHLIST_TB
(
    pdt_id  int                                not null comment 'AUTO_INCREMENT',
    user_id int                                not null comment 'AUTO_INCREMENT',
    in_date datetime default CURRENT_TIMESTAMP not null,
    in_user varchar(30)                        not null,
    up_date datetime default CURRENT_TIMESTAMP not null,
    up_user varchar(30)                        not null,
    primary key (pdt_id, user_id)
);

