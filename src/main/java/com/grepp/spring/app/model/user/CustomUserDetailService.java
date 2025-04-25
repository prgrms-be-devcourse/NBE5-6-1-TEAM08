package com.grepp.spring.app.model.user;

import com.grepp.spring.app.model.user.dto.Member;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CustomUserDetailService implements UserDetailsService {

    private final MemberRepository memberRepository;

    @Override
    public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
        Optional<Member> optionalMember = memberRepository.selectById(userId);

        Member member = optionalMember.orElseThrow(() ->
            new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + userId)
        );

        return User.builder()
            .username(member.getUserId())
            .password(member.getPassword())  // 반드시 암호화된 비밀번호여야 해!
            .authorities(List.of(new SimpleGrantedAuthority(member.getRole().name())))
            .build();
    }
}