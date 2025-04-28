package com.grepp.spring.app.controller.web.user;

import com.grepp.spring.app.model.user.UserService;
import com.grepp.spring.app.model.user.dto.User;
import com.grepp.spring.app.model.user.dto.UserResponseDto;
import com.grepp.spring.app.model.user.dto.UserUpdateRequestDto;
import com.grepp.spring.infra.config.CustomUserDetails;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Slf4j
@Controller
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/login")
    public String loginPage() {
        log.debug("Accessing login page");
        return "login";
    }

    @GetMapping("/guest_login")
    public String guestLoginPage() {
        log.debug("Accessing guest login page");
        return "guest_login";
    }

    @GetMapping("/signup")
    public String signupPage() {
        log.debug("Accessing signup page");
        return "signup";
    }

    @GetMapping("/mypage")
    public String mypage() {
        log.debug("Accessing mypage");
        return "mypage";
    }

    @GetMapping("/userEdit")
    public String userEditPage() {
        log.debug("Accessing user edit page");
        return "userEdit";
    }

    @GetMapping("/userOrderlist")
    public String userOrderlist() {
        log.debug("Accessing user order list page");
        return "userOrderlist";
    }

    @PostMapping("/api/users/register")
    @ResponseBody
    public ResponseEntity<String> register(@RequestBody User user) {
        log.debug("Registering new user: {}", user);
        try {
            userService.register(user);
            log.debug("User registered successfully: {}", user.getUsername());
            return ResponseEntity.ok("회원가입 성공!");
        } catch (IllegalArgumentException e) {
            log.error("Registration failed: {}", e.getMessage());
            return ResponseEntity.badRequest().body("회원가입 실패: " + e.getMessage());
        } catch (Exception e) {
            log.error("Unexpected error during registration: ", e);
            return ResponseEntity.internalServerError().body("회원가입 중 오류가 발생했습니다.");
        }
    }

    @GetMapping("/api/users/check-id")
    @ResponseBody
    public ResponseEntity<String> checkUsernameDuplicate(@RequestParam String username) {
        log.debug("Checking username duplicate: {}", username);
        return ResponseEntity.ok("사용 가능한 아이디입니다.");
    }

    @PostMapping("/api/users/login")
    @ResponseBody
    public ResponseEntity<?> login(@RequestBody Map<String, String> loginData) {
        log.debug("Login attempt: {}", loginData.get("username"));
        try {
            String username = loginData.get("username");
            String password = loginData.get("password");

            User user = userService.login(username, password);
            log.debug("Login successful: {}", username);
            return ResponseEntity.ok(user);
        } catch (IllegalArgumentException e) {
            log.error("Login failed: {}", e.getMessage());
            return ResponseEntity.badRequest().body("로그인 실패: " + e.getMessage());
        }
    }

    @GetMapping("/api/users/mypage")
    @ResponseBody
    public ResponseEntity<UserResponseDto> getMyInfo(Authentication authentication) {
        log.debug("Getting user info for: {}", authentication.getName());
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        User user = userDetails.getUser();

        UserResponseDto response = new UserResponseDto(
            user.getUsername(),
            user.getEmail(),
            user.getPhone()
        );

        return ResponseEntity.ok(response);
    }

    @PatchMapping("/api/users/mypage")
    @ResponseBody
    public ResponseEntity<String> updateMyInfo(@RequestBody UserUpdateRequestDto dto, Authentication authentication) {
        log.debug("Updating user info for: {}", authentication.getName());
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        userService.updateUser(userDetails.getUser().getUsername(), dto);
        return ResponseEntity.ok("회원정보 수정 완료");
    }

    @PostMapping("/api/users/mypage/password")
    @ResponseBody
    public ResponseEntity<?> changePassword(
        @RequestBody Map<String, String> pwData,
        Authentication authentication
    ) {
        log.debug("Changing password for: {}", authentication.getName());
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String username = userDetails.getUsername();

        String currentPassword = pwData.get("currentPassword");
        String newPassword = pwData.get("newPassword");

        try {
            userService.changePassword(username, currentPassword, newPassword);
            return ResponseEntity.ok("비밀번호 변경 성공!");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body("비밀번호 변경 실패: " + e.getMessage());
        }
    }

//    getEmail 메서드 테스트용
//    @GetMapping("/check-email")
//    public ResponseEntity<String> getLoginUserEmail() {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        CustomUserDetails userDetails = (CustomUserDetails) auth.getPrincipal();
//        return ResponseEntity.ok(userDetails.getEmail());
//    }
}
