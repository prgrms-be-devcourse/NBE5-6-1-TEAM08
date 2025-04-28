package com.grepp.spring.app.model.product;

import com.grepp.spring.app.model.product.dto.Product;
import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper productMapper;

    public void addProduct(Product product) {
        productMapper.insertProduct(product);
    }

    public void deleteProduct(Long id) {
        productMapper.deleteProduct(id);
    }

    public List<Product> getAllProducts() {
        return productMapper.findAllProducts();
    }
}