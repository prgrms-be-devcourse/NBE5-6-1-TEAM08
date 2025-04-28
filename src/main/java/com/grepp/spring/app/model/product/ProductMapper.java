package com.grepp.spring.app.model.product;

import com.grepp.spring.app.model.product.dto.Product;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    void insertProduct(Product product);
    void deleteProduct(Long id);
    List<Product> findAllProducts();
}