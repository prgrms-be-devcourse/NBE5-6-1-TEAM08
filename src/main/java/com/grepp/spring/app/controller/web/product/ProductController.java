package com.grepp.spring.app.controller.web.product;

import com.grepp.spring.app.model.product.ProductService;
import com.grepp.spring.app.model.product.dto.Product;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;

    @GetMapping
    public String productPage(Model model) {
        log.debug("Accessing product page");
        List<Product> products = productService.getAllProducts();
        model.addAttribute("products", products);
        return "product";
    }
}
