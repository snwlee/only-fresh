<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

    <mapper namespace="com.devkurly.address.dao.AddressMapper">

    <select id="count" resultType="int">
SELECT count(*) FROM ADDRESS_TB
    </select>

              <!-- 새 배송지 추가 -->
              <insert id="minInsert" parameterType="AddressDto">
INSERT
INTO    ADDRESS_TB (addr_id, user_id, chk_addr,
                    deli_type, main_addr, sub_addr)
VALUES  (#{addr_id}, #{user_id}, #{chk_addr},
            #{deli_type}, #{main_addr}, #{sub_addr} )
            </insert>

                    <insert id="insert" parameterType="AddressDto">
            INSERT
            INTO ADDRESS_TB (user_id, chk_addr, main_addr, sub_addr,
            addr_name, addr_tel, deli_type)
            VALUES (#{user_id}, #{chk_addr}, #{main_addr}, #{sub_addr},
            #{addr_name}, #{addr_tel}, #{deli_type})
                    </insert>

                    <select id="listSelect" parameterType="int"  resultType="AddressDto">
            SELECT addr_id, user_id, chk_addr, ba_addr, main_addr,
            sub_addr, addr_name, addr_tel, deli_type
            FROM ADDRESS_TB
            WHERE user_id = #{user_id}
            ORDER BY chk_addr DESC
                    </select>
                    <select id="updateSelect" parameterType="int" resultType="AddressDto">
            SELECT main_addr, sub_addr, addr_name, addr_tel, chk_addr
            FROM ADDRESS_TB
            WHERE addr_id =#{addr_id}
                    </select>

                    <update id="update" parameterType="AddressDto" >
            UPDATE ADDRESS_TB
            SET
            sub_addr = #{sub_addr},
            addr_name = #{addr_name},
            addr_tel = #{addr_tel}
            WHERE  user_id = #{user_id} AND addr_id = #{addr_id}
                    </update>

                    <update id="updateDef" parameterType="AddressDto">
            UPDATE ADDRESS_TB
            SET    ba_addr = #{ba_addr}
            WHERE  addr_id = #{addr_id}
                    </update>

                    <update id="updateDefaultFalse" parameterType="AddressDto">
            UPDATE ADDRESS_TB
            SET    ba_addr = 0
            WHERE  user_id = #{user_id}
                    </update>

                    <update id="updateDefaultTrue" parameterType="AddressDto">
            UPDATE ADDRESS_TB
            SET    ba_addr = 1
            WHERE  addr_id = #{addr_id} AND user_id = #{user_id}
                    </update>

                    <delete id="delete" parameterType="AddressDto">
            DELETE FROM ADDRESS_TB
            WHERE addr_id = #{addr_id} AND user_id = #{user_id}
                    </delete>

                    <delete id="deleteAll">
            DELETE FROM ADDRESS_TB
                    </delete>

                    <sql id="addressTelSort">
            SELECT
            A.addr_id,
            CASE length(A.addr_tel)
            WHEN 11 THEN concat(LEFT(A.addr_tel, 3), '-', MID(A.addr_tel, 4, 4),
            '-', RIGHT(A.addr_tel, 4))
            WHEN 10 THEN concat(LEFT(A.addr_tel, 3), '-', MID(A.addr_tel, 4, 3),
            '-', RIGHT(A.addr_tel, 4))
            WHEN 9 THEN concat(LEFT(A.addr_tel, 2), '-', MID(A.addr_tel, 4, 3),
            '-', RIGHT(A.addr_tel, 4))
            END AS addr_tel
            FROM (
            SELECT addr_id, REPLACE(addr_tel, '-', '') AS addr_tel
            FROM ADDRESS_TB
        ) AS A;
                    </sql>

                    <sql id="addrCityType"> -- 도시 정보, 새벽배송 지원여부, 새벽배송 보여주기
            SELECT
            ADDRESS_TB.city_code, ADDRESS_TB.deli_type,
            CITY_CODE_TB.cd_name, CITY_CODE_TB.cd_type_name
            FROM
            ADDRESS_TB
            INNER JOIN
            CITY_CODE_TB
            ON ADDRESS_TB.city_code = CITY_CODE_TB.city_code;
                    </sql>

                    <!-- 유저의 모든 chk_addr을 false로 변경 -->
                    <update id="chkUpdateF" parameterType="AddressDto">
            UPDATE ADDRESS_TB
            SET chk_addr = 0
            WHERE user_id = #{user_id}
                    </update>

                    <!-- 한 배송지만 chk_addr true로 변경 -->
                    <update id="chkUpdateT" parameterType="AddressDto">
            UPDATE ADDRESS_TB
            SET chk_addr = 1
            WHERE user_id = #{user_id} AND addr_id = #{addr_id};
                    </update>

                    <select id="city">

                    </select>
                    </mapper>

            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.board.dao.boardMapper">
            <delete id="deleteAll">
             delete from BOARD_TB
            </delete>

            <delete id="delete" parameterType="map">
             delete
             from BOARD_TB
             where bbs_id=#{bbs_id} and pdt_id=#{pdt_id} and user_id = #{user_id}
            </delete>

            <select id="boardAllCnt" resultType="int">
             select count(*) from BOARD_TB
            </select>

            <select id="boardCount" parameterType="map" resultType="int">
             select count(*) from BOARD_TB
             where bbs_clsf_cd = #{bbs_clsf_cd} and pdt_id = #{pdt_id}
            </select>

            <select id="select" parameterType="int">
             select bbs_id,
             bbs_title,
             wrt_dt,
             user_nm
             from BOARD_TB
             where bbs_id=#{bbs_id}
            </select>

            <select id="selectCn" parameterType="int" resultType="BoardDto">
             select bbs_id, bbs_cn, in_user, up_user
             from BOARD_CONTENT_TB
             where bbs_id=#{bbs_id}
            </select>

            <select id="selectAll" resultType="BoardDto">
             select bbs_id, pdt_id, user_id, bbs_title, wrt_dt, user_nm
             from BOARD_TB
             ORDER BY bbs_id DESC ,wrt_dt DESC
            </select>
            <sql id="selectReview">
             select REVIEW_BOARD_TB.bbs_id, revw_like, revw_img, pdt_id, user_id, bbs_title, wrt_dt, user_nm, bbs_clsf_cd, notice
             from REVIEW_BOARD_TB
             right join BOARD_TB
             on REVIEW_BOARD_TB.bbs_id = BOARD_TB.bbs_id
             where pdt_id = #{pdt_id} and bbs_clsf_cd = #{bbs_clsf_cd}
            </sql>

            <select id="selectReviewPage" parameterType="map" resultType="BoardDto">
            <include refid="selectReview"/>
             order by notice desc, bbs_id desc, wrt_dt desc
             limit #{offset}, #{pageSize}
            </select>

            <select id="selectReviewPageLike" parameterType="map" resultType="BoardDto">
            <include refid="selectReview"/>
             order by notice desc, revw_like desc, bbs_id desc
             limit #{offset}, #{pageSize}
            </select>

            <select id="selectMyReview" parameterType="map" resultType="BoardDto">
             select REVIEW_BOARD_TB.bbs_id, revw_like, revw_img, pdt_id, user_id, bbs_title, wrt_dt, user_nm, bbs_clsf_cd, notice
             from REVIEW_BOARD_TB
             right join BOARD_TB
             on REVIEW_BOARD_TB.bbs_id = BOARD_TB.bbs_id
             where bbs_clsf_cd = #{bbs_clsf_cd} and user_id = #{user_id}
             order by bbs_id desc, wrt_dt desc
             limit #{offset}, #{pageSize}
            </select>

            <select id="selectInqPage" parameterType="map" resultType="BoardDto">
             select INQ_BOARD_TB.bbs_id, bbs_title, user_nm, wrt_dt, is_secret, is_replied, pdt_id, user_id, bbs_clsf_cd, notice
             from INQ_BOARD_TB
             right join BOARD_TB
             on INQ_BOARD_TB.bbs_id = BOARD_TB.bbs_id
             where pdt_id = #{pdt_id} and bbs_clsf_cd = #{bbs_clsf_cd}
             order by notice desc, bbs_id desc, wrt_dt desc
             limit #{offset}, #{pageSize}
            </select>

            <select id="selectMyInq" parameterType="map" resultType="BoardDto">
             select INQ_BOARD_TB.bbs_id, bbs_title, user_nm, wrt_dt, is_secret, is_replied, pdt_id, user_id, bbs_clsf_cd, notice
             from INQ_BOARD_TB
             right join BOARD_TB
             on INQ_BOARD_TB.bbs_id = BOARD_TB.bbs_id
             where bbs_clsf_cd = #{bbs_clsf_cd} and user_id = #{user_id}
             order by bbs_id desc, wrt_dt desc
             limit #{offset}, #{pageSize}
            </select>

            <insert id="insert" parameterType="BoardDto">
             insert into BOARD_TB (pdt_id, user_id, bbs_title, user_nm, bbs_clsf_cd, in_user,  up_user, notice)
             values (#{pdt_id}, #{user_id},#{bbs_title}, #{user_nm},#{bbs_clsf_cd}, #{user_id}, #{user_id}, #{notice})
            </insert>

            <insert id="insertReview" parameterType="map">
             insert into REVIEW_BOARD_TB (bbs_id, in_user, up_user)
             values (#{bbs_id}, #{user_id}, #{user_id})
            </insert>

            <insert id="insertInq" parameterType="map">
             insert into INQ_BOARD_TB(bbs_id, int_user, up_user)
             values (#{bbs_id}, #{user_id}, #{user_id})
            </insert>

            <insert id="insertCn" parameterType="BoardDto">
             insert into BOARD_CONTENT_TB (bbs_id, bbs_cn, in_user, up_user)
             values (#{bbs_id}, #{bbs_cn}, #{user_id},#{user_id})
            </insert>

            <update id="update" parameterType="BoardDto">
             update BOARD_TB
             set bbs_title=#{bbs_title}, wrt_dt=now()
             where bbs_id =#{bbs_id} and user_id=#{user_id} and pdt_id = #{pdt_id}
            </update>

            <update id="updateCn" parameterType="BoardDto">
             update BOARD_CONTENT_TB
             set bbs_cn = #{bbs_cn}
             where bbs_id = #{bbs_id}
            </update>

            <update id="IsRepliedStatus" parameterType="map">
             update INQ_BOARD_TB
             set is_replied = #{replyst}
             where bbs_id = #{bbs_id}
            </update>

            <update id="IsSecretStatus" parameterType="map">
             update INQ_BOARD_TB
             set is_secret = #{is_secret}
             where bbs_id = #{bbs_id}
            </update>

            <update id="upDownLike" parameterType="map">
             update REVIEW_BOARD_TB
             set revw_like = revw_like + #{likeUpDown}
             where bbs_id = #{bbs_id}
            </update>

            <select id="selectUserLike" parameterType="BoardDto" resultType="int">
             select like_no
             from USER_LIKE_NO
             where user_id = #{user_id} and bbs_id = #{bbs_id}
            </select>

            <select id="checkLikeNoTB" parameterType="BoardDto" resultType="int">
             select count(*)
             from USER_LIKE_NO
             where user_id = #{user_id} and bbs_id = #{bbs_id}
            </select>

            <insert id="UserLikeNo" parameterType="BoardDto">
             insert into USER_LIKE_NO (user_id, bbs_id, in_user, up_user)
             values (#{user_id}, #{bbs_id}, #{user_id}, #{user_id})
            </insert>

            <update id="updateUserLikeNo" parameterType="map">
             update USER_LIKE_NO
             set like_no = #{like_no}
             where user_id = #{user_id} and bbs_id = #{bbs_id}
            </update>

            <insert id="insertAnswer" parameterType="CommentDto">
             insert into ANSWER_TB (bbs_id, inq_ans, int_user, up_user)
             values(#{bbs_id}, #{inq_ans}, #{user_id}, #{user_id})
            </insert>

            <update id="updateAnswer" parameterType="CommentDto">
             update ANSWER_TB
             set inq_ans = #{inq_ans}, ans_dt = now()
             where bbs_id = #{bbs_id}
            </update>

            <delete id="deleteAnswer" parameterType="int">
             delete
             from ANSWER_TB
             where bbs_id = #{bbs_id}
            </delete>

            <select id="selectAnswer" parameterType="int" resultType="CommentDto">
             select bbs_id ,inq_ans, ans_dt
             from ANSWER_TB
             where bbs_id = #{bbs_id}
            </select>

            <select id="checkReview" parameterType="int" resultType="BoardDto">
             SELECT pdt_id
             FROM PAYMENT_TB
             JOIN ORDER_PRODUCT_TB
             WHERE PAYMENT_TB.ord_id=ORDER_PRODUCT_TB.ord_id and setl_stus_cd = 'M001' and user_id = #{user_id}
            </select>



            </mapper>

            <?xml version="1.0" encoding="UTF-8"?>

            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.mapper.CartMapper">
            <insert id="save" parameterType="Cart">
             insert into CART_TB(user_id, pdt_id, pdt_qty)
             values (#{user_id}, #{pdt_id}, #{pdt_qty});
            </insert>
            <select id="findById" parameterType="int" resultType="int">
             select user_id
             from CART_TB
             where user_id = #{user_id};
            </select>
            <select id="findByCart" parameterType="Cart" resultType="Cart">
             select user_id, pdt_id, pdt_qty
             from CART_TB
             where user_id = #{user_id}
             and pdt_id = #{pdt_id};
            </select>
            <select id="findAllByUserId" parameterType="int" resultType="Cart">
             select user_id, pdt_id, pdt_qty
             from CART_TB
             where user_id = #{user_id};
            </select>
            <select id="findCheckedByCart" parameterType="Cart" resultType="Cart">
             select user_id, pdt_id, pdt_qty
             from CART_TB
             where user_id = #{user_id}
             and pdt_id = #{pdt_id};
            </select>
            <select id="findProductByPdtId" parameterType="int" resultType="Product">
             select stock
             from PRODUCT_TB
             where pdt_id = #{pdt_id};
            </select>
            <select id="joinCartProductByUserId" parameterType="int" resultType="com.devkurly.cart.dto.CartProductResponseDto">
             select user_id, CT.pdt_id, pdt_qty, price, image, sel_price, title, stock, company
             from CART_TB CT
             join PRODUCT_TB PT
             on CT.pdt_id = PT.pdt_id
             where user_id = #{user_id}
             order by CT.in_date DESC;
            </select>
            <select id="joinCartProductByCart" parameterType="Cart" resultType="com.devkurly.cart.dto.CartProductResponseDto">
             select user_id, CT.pdt_id, pdt_qty, price, image, sel_price, title, stock, company
             from CART_TB CT
             join PRODUCT_TB PT
             on CT.pdt_id = PT.pdt_id
             where user_id = #{user_id}
             and CT.pdt_id = #{pdt_id}
             order by CT.in_date DESC;
            </select>
            <update id="update" parameterType="Cart">
             update CART_TB
             set pdt_qty = #{pdt_qty}
             where user_id = #{user_id}
             and pdt_id = #{pdt_id};
            </update>
            <delete id="delete" parameterType="int">
             delete
             from CART_TB
             where user_id = #{user_id};
            </delete>
            <delete id="deleteOne" parameterType="Cart">
             delete
             from CART_TB
             where user_id = #{user_id}
             and pdt_id = #{pdt_id};
            </delete>
            </mapper>

            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.coupon.dao.CouponMapper">
            <!--C-->
            <insert id="create" parameterType="couponDto">
             insert into COUPON_TB(event_id, nm, ds_max_posbl_amt, use_cnd, lmtt_cnd, func, value, expi_dd)
             values (#{event_id}, #{nm}, #{ds_max_posbl_amt}, #{use_cnd}, #{lmtt_cnd}, #{func}, ${rate}, ${expi_dd})
            </insert>
            <insert id="createWithId" parameterType="couponDto">
             insert into COUPON_TB(coupn_id, event_id, nm, ds_max_posbl_amt, use_cnd, lmtt_cnd, func, value, expi_dd)
             values (#{coupn_id}, #{event_id}, #{nm}, #{ds_max_posbl_amt}, #{use_cnd}, #{lmtt_cnd}, #{func}, ${rate},
             ${expi_dd})
            </insert>
            <insert  id="createCouponToUser" parameterType="UserCouponDto" >
             insert into USER_COUPON_TB(coupn_id, user_id, used)
             values ((select coupn_id from COUPON_TB where nm = #{nm}),#{user_id}, 0)
            </insert>

            <!--R-->
            <select id="read" parameterType="int" resultType="CouponDto">
             select *
             from COUPON_TB
             where coupn_id = #{coupn_id}
            </select>
            <select id="readAll" resultType="CouponDto">
             select *
             from COUPON_TB
            </select>
            <select id="readUserCoupons" parameterType="int" resultType="CouponDto">
             select u.coupn_id, u.used, event_id, nm, ds_max_posbl_amt, unit_type, use_cnd, lmtt_cnd, func, value, expi_dd
             from USER_COUPON_TB as u
             join COUPON_TB as c
             on user_id = #{user_id} and u.coupn_id = c.coupn_id;
            </select>

            <!--U-->
            <update id="update" parameterType="CouponDto">
             update COUPON_TB
             set nm               = #{nm},
             ds_max_posbl_amt = #{ds_max_posbl_amt},
             use_cnd          = #{use_cnd},
             lmtt_cnd         = #{lmtt_cnd},
             func             = #{func},
             value             = #{rate},
             expi_dd          = #{expi_dd}
             where coupn_id = #{coupn_id}
            </update>

            <!--D-->
            <delete id="delete" parameterType="int">
             delete
             from COUPON_TB
             where coupn_id = #{coupn_id}
            </delete>
            <delete id="deleteAll">
             delete
             from COUPON_TB;
            </delete>
            <delete id="deleteUserCoupon" parameterType="map">
             delete
             from USER_COUPON_TB
             where coupn_id = #{coupn_id} and user_id=#{user_id}
            </delete>
            </mapper>

            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.event.dao.EventMapper">
            <!--C-->
            <insert id="insert" parameterType="EventDto">
             insert into EVENT_TB (nm, des, photo, photo_alt, cat_cd, setl_methd_cd, stpt_dd, expi_dd, early_end_stus,
             ds_rate)
             values (#{nm}, #{des}, #{photo}, #{photo_alt}, #{cat_cd}, #{setl_methd_cd}, #{stpt_dd}, #{expi_dd},
            #{early_end_stus}, #{ds_rate});
            </insert>

            <!--R-->
            <select id="count" resultType="int">
             select count(*)
             from EVENT_TB;
            </select>
            <select id="select" parameterType="int" resultType="EventDto">
             select *
             from EVENT_TB
             where event_id = ${event_id}
            </select>
            <select id="selectAll" resultType="EventDto">
             select *
             from EVENT_TB
             ORDER BY stpt_dd DESC
            </select>
            <select id="selectIds" resultType="EventIdDto">
             select event_id
             from EVENT_TB
            </select>


            <!--U-->
            <update id="update" parameterType="EventDto">
             update EVENT_TB
             set nm                  = #{nm},
             des                 = #{des},
             photo               = #{photo},
             photo_alt           = #{photo_alt},
             cat_cd              = #{cat_cd},
             setl_methd_cd       = #{setl_methd_cd},
             stpt_dd             = #{stpt_dd},
             expi_dd             = #{expi_dd},
             early_end_stus      = #{early_end_stus},
             ds_rate             = #{ds_rate}
             where event_id = #{event_id}
            </update>

            <!--D-->
            <delete id="deleteAll">
             delete
             from EVENT_TB
            </delete>
            <delete id="delete" parameterType="int">
             delete
             from EVENT_TB
             where event_id = ${event_id}
            </delete>

            </mapper>

            <?xml version="1.0" encoding="UTF-8"?>

            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.mapper.MemberMapper">
            <insert id="save" parameterType="Member">
             insert into USER_TB(user_id, user_nm, user_email, pwd, telno, subs_dt, gender, bryr, prvc_arge, rcmdr_email)
             values (#{user_id}, #{user_nm}, #{user_email}, #{pwd}, #{telno}, now(), #{gender}, #{bryr}, #{prvc_arge}, #{rcmdr_email});
            </insert>
            <select id="findByEmail" parameterType="String" resultType="Member">
             select *
             from USER_TB
             where user_email = #{user_email};
            </select>
            <select id="findById" parameterType="int" resultType="Member">
             select *
             from USER_TB
             where user_id = #{user_id};
            </select>
            <select id="findCouponById" parameterType="int" resultType="CouponDto">
             select UT.coupn_id, used, event_id, nm, ds_max_posbl_amt, use_cnd, lmtt_cnd, func, value, expi_dd
             from USER_COUPON_TB UT
             join COUPON_TB CT
             on UT.coupn_id = CT.coupn_id
             where user_id = #{user_id}
             and used = 0;
            </select>
            <select id="findCouponByCouponId" parameterType="int" resultType="CouponDto">
             select event_id, nm, ds_max_posbl_amt, use_cnd, lmtt_cnd, func, value, expi_dd
             from COUPON_TB CT
             where CT.coupn_id = #{coupn_id};
            </select>
            <select id="findAddressById" parameterType="int" resultType="AddressDto">
             select addr_id, main_addr, sub_addr, addr_name, addr_tel
             from ADDRESS_TB
             where user_id = #{user_id}
             and chk_addr = 1;
            </select>
            <update id="update" parameterType="Member">
             update USER_TB
             set user_nm = #{user_nm},
             pwd = #{pwd},
             telno = #{telno}
             where user_id = #{user_id};
            </update>
            <!--    <update id="updatePnt" parameterType="int">-->
            <!--        update USER_TB-->
            <!--        set pnt = #{pnt}-->
            <!--        where user_id = #{user_id};-->
            <!--    </update>-->
            <update id="updatePnt" parameterType="int">
             update USER_TB UT
             inner join USER_COUPON_TB UCT
             on UT.user_id = UCT.user_id
             set used = 1,
             pnt = #{pnt}
             where coupn_id = #{coupn_id}
             and UCT.user_id = #{user_id};
            </update>

            <delete id="delete" parameterType="int">
             delete
             from USER_TB
             where user_id = #{user_id};
            </delete>
            </mapper>

            <?xml version="1.0" encoding="UTF-8"?>

            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.mapper.OrderMapper">
            <insert id="add" parameterType="int">
             insert into ORDER_TB(user_id)
             values (#{user_id});
            </insert>
            <insert id="insertOrderProduct" parameterType="OrderProduct">
             insert into ORDER_PRODUCT_TB(ord_id, pdt_id, pdt_qty)
             values (#{ord_id}, #{pdt_id}, #{pdt_qty});
            </insert>
            <select id="findByUserId" parameterType="int" resultType="int">
             select ord_id
             from ORDER_TB
             where user_id = #{user_id}
             order by in_date DESC
             limit 1;
            </select>
            <select id="findByOrderId" parameterType="int" resultType="Order">
             select *
             from ORDER_TB
             where ord_id = #{ord_id};
            </select>
            <select id="findByPdtId" parameterType="int" resultType="Product">
             select *
             from PRODUCT_TB
             where pdt_id = #{pdt_id};
            </select>
            <select id="joinOrderProductName" parameterType="int" resultType="com.devkurly.order.dto.OrderProductNameResponseDto">
             select OPT.ord_id, OPT.pdt_id, pdt_qty, price, image, sel_price, title, stock, company
             from ORDER_PRODUCT_TB OPT
             join PRODUCT_TB PT
             on OPT.pdt_id = PT.pdt_id
             where ord_id = #{ord_id};
            </select>
            <select id="joinOrderProduct" parameterType="int" resultType="com.devkurly.order.dto.OrderResponseDto">
             select OT.ord_id,
             user_id,
             coupn_id,
             stus_cd,
             req_plc_cd,
             req_dtls,
             used_acamt,
             dlvr_yn,
             pdt_id,
             pdt_qty
             from ORDER_TB OT
             join ORDER_PRODUCT_TB OPT
             on OT.ord_id = OPT.ord_id
             where OT.ord_id = #{ord_id}
             order by OT.in_date DESC;
            </select>
            <update id="updateAmt" parameterType="Order">
             update ORDER_TB
             set all_amt = #{all_amt}
             where ord_id = #{ord_id};
            </update>
            <update id="updateOrder" parameterType="Order">
             update ORDER_TB
             set user_id = #{user_id},
             addr_id = #{addr_id},
             coupn_id = #{coupn_id},
             req_dtls = #{req_dtls},
             used_acamt = #{used_acamt}
             where ord_id = #{ord_id};
            </update>
            <delete id="delete" parameterType="int">
             delete
             from ORDER_TB
             where user_id = #{user_id}
             and ord_id = #{ord_id};
            </delete>
            </mapper>

            <?xml version="1.0" encoding="UTF-8"?>

            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.mapper.PaymentMapper">
            <insert id="save" parameterType="Payment">
             insert into PAYMENT_TB(ord_id, user_id, setl_cd, all_amt, all_dc_amt)
             values (#{ord_id}, #{user_id}, #{setl_cd}, #{all_amt}, #{all_dc_amt});
            </insert>
            <select id="findById" parameterType="Int" resultType="Payment">
             select *
             from PAYMENT_TB
             where ord_id = #{ord_id};
            </select>
            <update id="update" parameterType="Payment">
             update PAYMENT_TB
             set setl_cd = #{setl_cd},
             setl_stus_cd = #{setl_stus_cd},
             all_amt = #{all_amt},
             all_dc_amt = #{all_dc_amt},
             dlvr_amt = #{dlvr_amt}
             where user_id = #{user_id};
            </update>
            <delete id="delete" parameterType="Integer">
             delete
             from PAYMENT_TB
             where user_id = #{user_id}
             and ord_id = #{ord_id};
            </delete>
            </mapper>

            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.productDetail.dao.ProductDetailMapper">

            <insert id="insert" parameterType="ProductDetailDto" >
             INSERT INTO PRODUCT_DETAIL_TB(pdt_id, company ,pack_cd, sell_cd, weca_cd, origin, allg_dt, ex_dt, notice, prt_info, de_type, in_user, up_user, prt_image)
             VALUES (#{pdt_id}, #{company}, #{pack_cd}, #{sell_cd}, #{weca_cd}, #{origin}, #{allg_dt}, #{ex_dt}, #{notice}, #{prt_info}, #{de_type}, #{user_id}, #{user_id}, #{prt_image});
            </insert>

            <select id="select" parameterType="int" resultType="ProductDetailDto">
             select *
             from PRODUCT_TB
             left join PRODUCT_DETAIL_TB
             on PRODUCT_TB.pdt_id = PRODUCT_DETAIL_TB.pdt_id
             where PRODUCT_TB.pdt_id=#{pdt_id}
            </select>

            <update id="update" parameterType="ProductDetailDto">
             UPDATE PRODUCT_DETAIL_TB
             SET pack_cd = #{pack_cd},
             sell_cd = #{sell_cd},
             weca_cd = #{weca_cd},
             prt_info = #{prt_info},
             allg_dt = #{allg_dt},
             ex_dt = #{ex_dt},
             origin = #{origin},
             notice = #{notice},
             company = #{company},
             de_type = #{de_type},
             in_user = #{user_id},
             up_user = #{user_id},
             prt_image = #{prt_image}
             WHERE pdt_id = #{pdt_id}
            </update>
            </mapper>

            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.product.dao.ProductMapper">


            <!--    <select id="count" resultType="int">-->
            <!--        SELECT count(*) FROM PRODUCT_TB P-->
            <!--                 JOIN PRODUCT_TAG_TB T-->
            <!--        ON T.pdt_id = P.pdt_id-->
            <!--            JOIN TAG_TB TG-->
            <!--            ON TG.tag_id = T.tag_id-->
            <!--            JOIN CATEGORY_TB C-->
            <!--            ON C.pdt_id = P.pdt_id-->
            <!--    </select>-->


            <delete id="deleteAll">
             DELETE FROM PRODUCT_TB
            </delete>


            <delete id="delete" parameterType="map">
             DELETE FROM PRODUCT_TB WHERE pdt_id = #{pdt_id}
            </delete>

            <insert id="create" parameterType="Product">
             INSERT INTO PRODUCT_TB
            (pdt_id, title, ds_rate, sel_price, price, sub_title,company,de_type)
             VALUES
            (#{pdt_id},#{price},#{ds_rate},#{sel_price}, #{title}, #{sub_title},#{company},#{de_type})
            </insert>

            <select id="ProductNewList" parameterType="SearchCondition" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code

             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE TRUE
             AND title LIKE concat('%', #{keyword}, '%')
             ORDER BY in_date DESC
             limit #{offset}, #{pageSize}
            </select>


            <select id="ProductThriftyList" parameterType="SearchCondition" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             where P.sel_price <![CDATA[<]]>10000
             ORDER BY P.sel_price DESC
             limit #{offset}, #{pageSize}
            </select>

            <select id="ThriftyCnt" parameterType="int" resultType="int">
             SELECT count(*)
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             where P.sel_price <![CDATA[<]]>10000
             ORDER BY P.sel_price DESC
            </select>
            <select id="ProductBestList" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             ORDER BY P.sales_rate DESC
             limit #{offset}, #{pageSize}
            </select>

            <select id="PriceAscList" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             ORDER BY P.sel_price ASC
             limit #{offset}, #{pageSize}
            </select>

            <select id="ProductList"  parameterType="SearchCondition" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code

             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCTT.cd_type_id = 'P003' and CCT.cd_name= 'CCT.cd_name'
             WHERE TRUE
            <include refid="searchCondition"/>
             limit #{offset}, #{pageSize}
            </select>

            <select id="mainlist" resultType="Product" parameterType="String">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code

             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCTT.cd_type_name =#{cd_type_name}
             limit 0, 4
            </select>


            <select id="cate" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,P.adt_sts,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCTT.cd_type_name =#{cd_type_name}
             ORDER BY P.${order_sc} DESC, ${asc}
             limit #{offset}, #{pageSize}
            </select>
            <select id="cateCnt" parameterType="String" resultType="int">
             SELECT  count(*)
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCTT.cd_type_name =#{cd_type_name}
            </select>



            <select id="CodeNameSelect" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,P.adt_sts,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code

             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCT.cd_name_num =#{cd_name_num}
             ORDER BY P.${order_sc} DESC, ${asc}
             limit #{offset}, #{pageSize}
            </select>

            <select id="codeNameSelectCnt" parameterType="int" resultType="int">
             SELECT  count(*)
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCT.cd_name_num =#{cd_name_num}
            </select>
            <select id="ProductListDESC" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,P.stock,C.cat_code,C.cd_name,P.in_date
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             ORDER BY ${order_sc} DESC
             limit #{offset}, #{pageSize}
            </select>


            <sql id="selectFromProduct">
             select pdt_id,
             price,
             ds_rate,
             sel_price,
             title,
             sub_title,
             rec_info,
             adt_sts,
             stock,
             in_date,
             in_user,
             up_date,
             up_user
             FROM PRODUCT_TB
            </sql>


            <sql id="searchCondition">
            <choose>
            <when test='option=="T"'>
             AND title LIKE concat('%', #{keyword}, '%')
            </when>
            <when test='option=="C"'>
             AND company LIKE concat('%', #{keyword}, '%')
            </when>
            <otherwise>
             AND  title   LIKE concat('%', #{keyword}, '%')
             OR   company LIKE concat('%', #{keyword}, '%')
            </otherwise>
            </choose>
            </sql>


            <update id="update" parameterType="Product">
             UPDATE PRODUCT_TB
             SET   price = #{price},
             ds_rate = #{ds_rate},
             sel_price =#{sel_price},
             title = #{title},
             sub_title = #{sub_title},
             up_date = now()
             WHERE pdt_id = #{pdt_id}
             ORDER BY title DESC
            </update>


            <select id="selectProductId" resultType="Product">
             select pdt_id
             from PRODUCT_TB
            </select>


            <select id="searchResultCnt" parameterType="SearchCondition" resultType="int">
             SELECT count(*)
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             WHERE TRUE
            <include refid="searchCondition"/>
            </select>

            <select id="searchSelectPage" parameterType="SearchCondition" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,P.stock,C.cat_code,C.cd_name,P.in_date
             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             WHERE TRUE
            <include refid="searchCondition"/>
             ORDER BY in_date desc
             limit #{offset}, #{pageSize}
            </select>


            <select id="goodslist" parameterType="map" resultType="Product">
             SELECT  P.pdt_id, TG.tag_name, P.title, P.sub_title,
             P.ds_rate, P.price,P.image,P.sel_price,P.sales_rate,
             P.de_type,P.company,C.cat_code,CCTT.cd_type_name,CCT.cd_name,CCT.cat_code

             FROM PRODUCT_TB P
             JOIN PRODUCT_TAG_TB T
             ON T.pdt_id = P.pdt_id
             JOIN TAG_TB TG
             ON TG.tag_id = T.tag_id
             JOIN CATEGORY_TB C
             ON C.pdt_id = P.pdt_id
             JOIN COMMON_CODE_TB CCT
             ON CCT.cat_code = C.cat_code
             JOIN COMMON_CODE_TYPE_TB CCTT
             ON CCTT.cd_type_id = CCT.cd_type_id
             WHERE CCT.cd_name= #{cd_name}
            </select>

            <select id="selectCategories" resultType="MainSubCategoryDto">
             select DISTINCT CCT.cd_type_id, cd_name, cd_type_name, CCT.cd_name_num
             from COMMON_CODE_TB CCT
             join COMMON_CODE_TYPE_TB CCTT on CCT.cd_type_id = CCTT.cd_type_id;
            </select>


            <select id="selectCate"  parameterType="int" resultType="String">
             select DISTINCT cd_name from COMMON_CODE_TB
             where cd_name_num = #{cd_name_num}
            </select>
            </mapper>
            <?xml version="1.0" encoding="UTF-8" ?>
            <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
             "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

            <mapper namespace="com.devkurly.admin.dao.UserMapper">
            <select id="select" parameterType="int" resultType="UserDto">
             select
             user_id,
             user_nm,
             user_email,
             subs_dt,
             gender,
             bryr,
             pwd,
             telno,
             rcmdr_email
             from USER_TB
             where user_id = #{user_id}
            </select>
            <select id="count" resultType="int">
             SELECT count(*) FROM USER_TB
            </select>

            <delete id="deleteAll">
             DELETE FROM USER_TB
            </delete>

            <delete id="deleteForAdmin">
             DELETE FROM USER_TB WHERE user_id = #{user_id}
            </delete>
            <delete id="delete" parameterType="int">
             DELETE FROM USER_TB WHERE user_id = #{user_id}
            </delete>

            <!--회원등록-->
            <insert id="insert" parameterType="UserDto">
             INSERT INTO USER_TB
            (user_email,pwd,user_nm,telno,subs_dt,gender,bryr,rcmdr_email)
             VALUES
            (#{user_email},#{pwd},#{user_nm},#{telno},#{subs_dt},#{gender},#{bryr},#{rcmdr_email})
            </insert>

            <select id="selectAll" resultType="UserDto">
             SELECT user_id,
             user_nm,
             user_email,
             pwd,
             telno,
             subs_dt,
             gender,
             bryr,
             rcmdr_email
             FROM USER_TB
             ORDER BY subs_dt DESC, user_id DESC
            </select>


            <sql id="selectFromUser">
             SELECT user_id,
             user_nm,
             user_email,
             pwd,
             telno,
             subs_dt,
             gender,
             bryr,
             rcmdr_email
             FROM USER_TB
            </sql>

            <select id="selectPage" parameterType="map" resultType="UserDto">
             SELECT user_id,
             user_nm,
             user_email,
             pwd,
             telno,
             subs_dt,
             gender,
             bryr,
             rcmdr_email
             FROM USER_TB
             ORDER BY subs_dt DESC, user_id DESC
             LIMIT #{offset}, #{pageSize}
            </select>

            <update id="update" parameterType="UserDto">
             UPDATE USER_TB
             SET pwd = #{pwd},
             user_nm = #{user_nm},
             user_email = #{user_email},
             telno = #{telno},
             subs_dt = #{subs_dt},
             gender = #{gender},
             bryr = #{bryr},
             rcmdr_email = #{rcmdr_email}
             WHERE user_id = #{user_id}
            </update>


            <sql id="searchCondition">
            <choose>
            <when test='option=="T"'>
             AND title LIKE concat('%', #{keyword}, '%')
            </when>
            <when test='option=="W"'>
             AND writer LIKE concat('%', #{keyword}, '%')
            </when>
            <otherwise>
             AND (title LIKE concat('%', #{keyword}, '%')
             OR content LIKE concat('%', #{keyword}, '%'))
            </otherwise>
            </choose>
            </sql>

            <select id="searchSelectPage" parameterType="SearchCondition" resultType="UserDto">
             SELECT  user_id,
             user_nm,
             user_email,
             pwd,
             telno,
             subs_dt,
             gender,
             bryr,
             rcmdr_email
             FROM USER_TB
             where true
            <include refid="searchCondition"/>
             ORDER BY subs_dt DESC, user_id DESC
             LIMIT #{offset}, #{pageSize}
            </select>

            <select id="searchResultCnt" parameterType="SearchCondition" resultType="int">
             SELECT count(*)
             FROM USER_TB
             where true
            <include refid="searchCondition"/>
            </select>

            </mapper>