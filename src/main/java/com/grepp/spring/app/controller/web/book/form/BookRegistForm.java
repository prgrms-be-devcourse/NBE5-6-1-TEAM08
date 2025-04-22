package com.grepp.spring.app.controller.web.book.form;

import com.grepp.spring.app.model.book.code.Category;
import com.grepp.spring.app.model.book.dto.Book;
import jakarta.validation.constraints.NotBlank;
import java.util.List;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class BookRegistForm {

    private List<MultipartFile> thumbnail;
    @NotBlank
    private String title;
    @NotBlank
    private String author;
    @NotBlank
    private String info;
    @NotBlank
    private String category;

    public Book toDto() {
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setInfo(info);
        book.setCategory(Category.valueOf(category));
        return book;
    }
}
