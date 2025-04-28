package com.grepp.spring.app.controller.web.cart;

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
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/cart")
public class CartController {

    private final OrderService orderService;

    @PostMapping("/add-to-cart")
    public String addToCart(@AuthenticationPrincipal CustomUserDetails userDetails,
        @RequestParam("productName") String productName,
        @RequestParam("quantity") Integer orderCnt,
        HttpServletRequest request,
        HttpServletResponse response)
    {
        log.debug("Adding product to cart: {}, quantity: {}", productName, orderCnt);
        
        Order order = new Order();

        if(userDetails != null) {
            order.setEmail(userDetails.getEmail());
            order.setUserId(userDetails.getUsername());
        }
        else {
            String guestId = getGuestIdFromCookie(request);
            if (guestId == null) {
                guestId = UUID.randomUUID().toString();
                Cookie cookie = new Cookie("guestId", guestId);
                cookie.setPath("/");
                cookie.setMaxAge(60 * 60 * 24); // 1일
                response.addCookie(cookie);
            }
            order.setEmail(guestId);
            order.setUserId("guest");
        }

        order.setProductName(productName);
        order.setOrderCnt(orderCnt);

        orderService.insertOrder(order);
        return "redirect:/cart";
    }

    @GetMapping
    public String viewCart(@AuthenticationPrincipal CustomUserDetails user,
        HttpServletRequest request,
        Model model) {
        log.debug("Accessing cart page");

        String email;

        if (user != null) {
            email = user.getEmail();
        } else {
            email = getGuestIdFromCookie(request);
            if (email == null) {
                model.addAttribute("orderInfos", List.of());
                return "cart";
            }
        }

        List<OrderInfo> orderInfos = orderService.selectAllWithPriceAndProductInfoByEmail(email);
        model.addAttribute("orderInfos", orderInfos);
        return "cart";
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
} 