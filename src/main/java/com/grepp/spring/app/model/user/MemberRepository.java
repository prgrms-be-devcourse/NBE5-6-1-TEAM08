package com.grepp.spring.app.model.user;

import com.grepp.spring.app.model.user.dto.Member;
import com.grepp.spring.app.model.user.dto.MemberInfo;
import java.util.Optional;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MemberRepository {

    Optional<Member> selectById(String userId);
    @Select("select count(*) from member where user_id = #{userId}")
    Boolean existMember(String userId);

    @Insert("insert into member (USER_ID, PASSWORD, EMAIL, TEL, ROLE)"
        + "values (#{userId}, #{password}, #{email}, #{tel}, #{role})")
    void insert(Member dto);

    @Insert("insert into member_info(USER_ID) values (#{userId})")
    void insertInfo(MemberInfo memberInfo);
}
