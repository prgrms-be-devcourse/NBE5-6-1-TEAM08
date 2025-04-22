package com.grepp.spring.app.controller.api.book.form;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import lombok.Data;

@Data
public class BookListForm {

    @Min(1)
    private int page;

    @Min(2)
    @Max(10)
    private int size;

}
