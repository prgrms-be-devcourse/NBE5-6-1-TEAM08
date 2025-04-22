package com.grepp.spring.app.controller.api.book;

import com.grepp.spring.app.controller.api.book.form.BookListForm;
import com.grepp.spring.app.controller.api.book.payload.BookListPayload;
import com.grepp.spring.app.model.book.BookService;
import com.grepp.spring.app.model.book.dto.Book;
import com.grepp.spring.infra.response.ApiResponse;
import jakarta.validation.Valid;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("api/book")
@RequiredArgsConstructor
public class BookApiController {

    private final BookService bookService;

    @GetMapping("list")
    public ResponseEntity<ApiResponse<BookListPayload>> bookList(
        @Valid BookListForm form
    ){
        List<Book> books = bookService.findPage(form.getPage(), form.getSize());
        BookListPayload payload = BookListPayload.fromDtoList(books);
        return ResponseEntity.ok(ApiResponse.success(payload));
    }
}
