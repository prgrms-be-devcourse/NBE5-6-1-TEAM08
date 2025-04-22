package com.grepp.spring.app.model.rent.dto;

import java.time.LocalDateTime;
import java.util.List;
import lombok.Data;

@Data
public class Rent {
    
    private Integer rentId;
    private String userId;
    private LocalDateTime createdAt;
    private Boolean isReturn;
    private String title;
    private Integer rentBookCnt;
    private List<RentBook> rentBooks;
    private Boolean activated;
}
