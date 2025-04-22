package com.grepp.spring.app.model.rent.dto;

import com.grepp.spring.app.model.rent.code.RentState;
import java.time.LocalDateTime;
import lombok.Data;

@Data
public class RentHistory {
    
    private Integer rhIdx;
    private Integer rentId;
    private Integer rbIdx;
    private Integer bkIdx;
    private LocalDateTime regDate;
    private RentState state;
}
