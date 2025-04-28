package com.grepp.spring.app.model.user;

import com.grepp.spring.app.model.user.dto.User;
import com.grepp.spring.app.model.user.dto.UserUpdateRequestDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Slf4j
@Service
@RequiredArgsConstructor
public class UserService {

    private final UserMapper userMapper;
    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    public void register(User user) {
        log.debug("Registering new user: {}", user.getUsername());
        
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
        log.debug("User registered successfully: {}", user.getUsername());
    }

    public User login(String username, String rawPassword) {
        log.debug("Attempting login for user: {}", username);
        
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 사용자입니다."));

        if (!passwordEncoder.matches(rawPassword, user.getPassword())) {
            throw new IllegalArgumentException("비밀번호가 일치하지 않습니다.");
        }

        log.debug("Login successful for user: {}", username);
        return user;
    }

    public void updateUser(String username, UserUpdateRequestDto dto) {
        log.debug("Updating user info for: {}", username);
        
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("해당 사용자를 찾을 수 없습니다."));

        user.setEmail(dto.getEmail());
        user.setPhone(dto.getPhone());

        userMapper.update(user);
        log.debug("User info updated successfully for: {}", username);
    }

    public void changePassword(String username, String currentPassword, String newPassword) {
        log.debug("Changing password for user: {}", username);
        
        User user = userMapper.findByUsername(username)
                              .orElseThrow(() -> new IllegalArgumentException("사용자를 찾을 수 없습니다."));

        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new IllegalArgumentException("현재 비밀번호가 일치하지 않습니다.");
        }

        String encodedNewPassword = passwordEncoder.encode(newPassword);
        user.setPassword(encodedNewPassword);
        userMapper.updatePassword(user);
        log.debug("Password changed successfully for user: {}", username);
    }
}