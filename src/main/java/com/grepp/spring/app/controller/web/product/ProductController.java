package com.grepp.spring.app.controller.web.product;

import com.grepp.spring.app.controller.web.product.form.OrderRegistForm;
import com.grepp.spring.app.model.order.OrderService;
import com.grepp.spring.app.model.order.dto.Order;
import com.grepp.spring.app.model.order.dto.OrderInfo;
import com.grepp.spring.infra.config.CustomUserDetails;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.UUID;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("cart")
public class ProductController {

    private final OrderService orderService;

    @PostMapping("/add-to-cart")
    public String create(@AuthenticationPrincipal CustomUserDetails userDetails,
        @RequestParam("productName") String productName,
        @RequestParam("quantity") Integer orderCnt,
        HttpServletRequest request,
        HttpServletResponse response)
    {
        Order order = new Order();

        if(userDetails != null) {
            order.setEmail(userDetails.getEmail());
            order.setUserId(userDetails.getUsername());
        }
        else {
            // 쿠키에서 guestId 읽기
            String guestId = getGuestIdFromCookie(request);
            if (guestId == null) {
                guestId = UUID
                    .randomUUID().toString();
                Cookie cookie = new Cookie("guestId", guestId);
                cookie.setPath("/");
                cookie.setMaxAge(60 * 60 * 24); // 1일
                response.addCookie(cookie);
            }
            order.setEmail(guestId);    // 비회원 이메일 자리에 guestId 저장
            order.setUserId("guest");   // userId는 guest로 고정
        }

        order.setProductName(productName);
        order.setOrderCnt(orderCnt);


        orderService.insertOrder(order);
        return "redirect:/cart/product";
    }

    private String getGuestIdFromCookie(HttpServletRequest request) {
        if (request.getCookies() != null) {
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("guestId")) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

    @GetMapping("man")
    public String read(@AuthenticationPrincipal CustomUserDetails user,
        HttpServletRequest request,
        Model model) {

        String email;

        if (user != null) {
            // 로그인한 회원
            email = user.getEmail();
        } else {
            // 비회원: 쿠키에서 guestId 가져오기
            email = getGuestIdFromCookie(request);
            if (email == null) {
                // 쿠키도 없다면 그냥 빈 리스트 반환
                model.addAttribute("orderInfos", List.of());
                return "cart/cart";
            }
        }

        List<OrderInfo> orderInfos = orderService.selectAllWithPriceAndProductInfoByEmail(email);
        model.addAttribute("orderInfos", orderInfos);
        return "cart/cart";
    }

}
