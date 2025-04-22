package com.grepp.spring.app.model.member;

import com.grepp.spring.app.model.member.code.Role;
import com.grepp.spring.app.model.member.dto.Member;
import com.grepp.spring.app.model.member.dto.MemberInfo;
import com.grepp.spring.app.model.member.dto.Principal;
import com.grepp.spring.infra.error.exceptions.CommonException;
import com.grepp.spring.infra.response.ResponseCode;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Slf4j
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    @Transactional
    public void signup(Member dto) {
        if (memberRepository.existMember(dto.getUserId()))
            throw new CommonException(ResponseCode.BAD_REQUEST);

        dto.setRole(Role.ROLE_USER);
        memberRepository.insert(dto);
        MemberInfo memberInfo = new MemberInfo();
        memberInfo.setUserId(dto.getUserId());
        memberRepository.insertInfo(memberInfo);
    }

    public Principal signin(String userId, String password) {

        Optional<Member> optional = memberRepository.selectById(userId);

        Member member = optional.get();

        if (!member.getPassword().equals(password)) {
            return Principal.ANONYMOUS;
        }

        return new Principal(userId, List.of(Role.ROLE_USER), LocalDateTime.now());
    }

    public Boolean isDuplicatedId(String id) {
        return memberRepository.existMember(id);
    }
}
