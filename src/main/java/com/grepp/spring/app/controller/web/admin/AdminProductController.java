package com.grepp.spring.app.controller.web.admin;

import com.grepp.spring.app.model.product.ProductService;
import com.grepp.spring.app.model.product.dto.Product;
import java.time.LocalDateTime;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
public class AdminProductController {

    private final ProductService productService;

    @GetMapping("/product")
    public String productPage() {
        return "product";
    }

    @PostMapping("/api/admin/products/add")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseBody
    public ResponseEntity<String> addProduct(@RequestBody Product product) {
        product.setCreatedAt(LocalDateTime.now());

        productService.addProduct(product);
        return ResponseEntity.ok("상품이 추가되었습니다.");
    }

    @DeleteMapping("/api/admin/products/delete/{id}")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseBody
    public ResponseEntity<String> deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return ResponseEntity.ok("상품이 삭제되었습니다.");
    }

    @GetMapping("/api/admin/products/all")
    @PreAuthorize("hasRole('ADMIN')")
    @ResponseBody
    public ResponseEntity<List<Product>> getAllProducts() {
        return ResponseEntity.ok(productService.getAllProducts());
    }
}