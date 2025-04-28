package com.grepp.spring.app.model.user;

import com.grepp.spring.app.model.user.dto.User;
import com.grepp.spring.app.model.user.dto.UserUpdateRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public void register(User user) {
        if (userMapper.countByUsername(user.getUsername()) > 0) {
            throw new IllegalArgumentException("이미 사용 중인 아이디입니다.");
        }
        if (userMapper.countByEmail(user.getEmail()) > 0) {
            throw new IllegalArgumentException("이미 등록된 이메일입니다.");
        }
        if (userMapper.countByPhone(user.getPhone()) > 0) {
            throw new IllegalArgumentException("이미 등록된 전화번호입니다.");
        }

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("USER");

        userMapper.insertUser(user);
    }

    public User login(String username, String rawPassword) {
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자입니다."));
        if (user == null) {
            throw new IllegalArgumentException("존재하지 않는 사용자입니다.");
        }

        if (!passwordEncoder.matches(rawPassword, user.getPassword())) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }

        return user;
    }

    public void updateUser(String username, UserUpdateRequestDto dto) {
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));

        user.setEmail(dto.getEmail());
        user.setPhone(dto.getPhone());

        userMapper.update(user); // MyBatis 매퍼에 정의된 update 쿼리 호출
    }

    public void changePassword(String username, String currentPassword, String newPassword) {
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("사용자를 찾을 수 없습니다."));

        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new IllegalArgumentException("현재 비밀번호가 일치하지 않습니다.");
        }

        String encodedNewPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodedNewPassword);
        userMapper.updatePassword(user);
    }
}