package com.grepp.spring.app.controller.api.user;

import com.grepp.spring.app.model.user.MemberService;
import com.grepp.spring.infra.response.ApiResponse;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("api/member")
public class MemberApiController {

    private final MemberService memberService;

    @GetMapping("exist/{id}")
    public ResponseEntity<ApiResponse<Boolean>> existId(@PathVariable String id) {
        return ResponseEntity.ok(ApiResponse.success(
            memberService.isDuplicatedId(id)
        ));
    }
}
