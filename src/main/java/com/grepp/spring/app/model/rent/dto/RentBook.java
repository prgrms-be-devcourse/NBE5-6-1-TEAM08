package com.grepp.spring.app.model.rent.dto;

import com.grepp.spring.app.model.rent.code.RentState;
import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class RentBook {
    
    private Integer rbIdx;
    private Integer rentId;
    private Integer bkIdx;
    private String bookTitle;
    private LocalDateTime regDate;
    private RentState state;
    private LocalDate returnDate;
    private Boolean activated;
}
