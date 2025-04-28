package com.grepp.spring.app.model.user;


import com.grepp.spring.app.model.user.dto.User;
import java.util.Optional;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {

    // 사용자 등록
    void insertUser(User user);

    // username 중복 확인
    int countByUsername(String username);

    // email 중복 확인
    int countByEmail(String email);

    // phone 중복 확인
    int countByPhone(String phone);

    // 로그인 및 수정용 사용자 조회
    Optional<User> findByUsername(String username);

    // 사용자 정보 업데이트
    void update(User user);

    // 사용자 비밀번호 변경
    void updatePassword(User user);
}