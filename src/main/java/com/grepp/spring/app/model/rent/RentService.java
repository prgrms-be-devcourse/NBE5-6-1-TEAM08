package com.grepp.spring.app.model.rent;

import com.grepp.spring.app.model.rent.dto.Rent;
import com.grepp.spring.app.model.rent.dto.RentBook;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class RentService {

    private final RentRepository rentRepository;


    public List<Rent> selectAll() {
        return rentRepository.selectAll();
    }
}
