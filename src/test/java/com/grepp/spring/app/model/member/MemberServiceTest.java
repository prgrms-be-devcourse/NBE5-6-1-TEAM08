package com.grepp.spring.app.model.member;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.assertj.core.api.AssertionsForClassTypes.assertThatThrownBy;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.BDDMockito.given;

import com.grepp.spring.app.model.member.dto.Member;
import com.grepp.spring.app.model.member.dto.MemberInfo;
import com.grepp.spring.infra.error.exceptions.CommonException;
import java.util.Optional;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class MemberServiceTest {

    // NOTE Mock 객체와 단위 테스트
    // DB 와 귀찮게 통신하지 않아도 목 객체 만들어서 확인
    // 기능 별로 단위 테스트를 통해 확인해보기
    // TDD

    @Mock
    private MemberRepository memberRepository;

    @InjectMocks
    private MemberService memberService;

    // 성공 테스트
    @Test
    public void signup(){
        // given : 테스트를 위한 데이터 및 mock 객체의 행위를 설정
        given(memberRepository.existMember(anyString()))
            .willAnswer(invocation -> {
                String userId = invocation.getArgument(0);
                return userId.equals("duplicated");
            });
        Member member = new Member();
        member.setUserId("test");

        // when : 테스트 실행
        // then : 테스트 검증
        memberService.signup(member);
    }

    // 테스트케이스 작명 : 메서드 이름 - 결과 - 이유
    // 실패 테스트
    @Test
    public void signup_throwException_existName(){
        given(memberRepository.existMember(anyString()))
            .willAnswer(invocation -> {
                String userId = invocation.getArgument(0);
                return userId.equals("duplicated");
            });
        Member member = new Member();
        member.setUserId("duplicated");

        // when - then
        assertThatThrownBy(()->memberService.signup(member))
            .isInstanceOf(CommonException.class);
    }

    private class MockMemberRepository implements MemberRepository {

        @Override
        public Optional<Member> selectById(String userId) {
            return Optional.empty();
        }

        @Override
        public Boolean existMember(String userId) {
            return userId.equals("duplicated");
        }

        @Override
        public void insert(Member dto) {

        }

        @Override
        public void insertInfo(MemberInfo memberInfo) {

        }
    }
}