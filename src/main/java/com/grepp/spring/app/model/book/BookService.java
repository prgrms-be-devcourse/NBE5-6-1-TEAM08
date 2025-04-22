package com.grepp.spring.app.model.book;

import com.grepp.spring.app.model.book.code.BookImgType;
import com.grepp.spring.app.model.book.dto.Book;
import com.grepp.spring.app.model.book.dto.BookImg;
import com.grepp.spring.infra.error.exceptions.CommonException;
import com.grepp.spring.infra.response.ResponseCode;
import com.grepp.spring.infra.util.file.FileDto;
import com.grepp.spring.infra.util.file.FileUtil;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import java.io.IOException;
import java.util.List;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
@RequiredArgsConstructor
@Slf4j
public class BookService {

    private final BookRepository bookRepository;
    private final FileUtil fileUtil;


    @Transactional
    public void registBook(List<MultipartFile> thumbnail, Book dto) {
        try {
            List<FileDto> fileDtos = fileUtil.upload(thumbnail, "book");
            bookRepository.insert(dto); // dto 주입

            if (fileDtos.isEmpty()) return;

            BookImg bookImg = new BookImg(dto.getBkIdx(), BookImgType.THUMBNAIL, fileDtos.getFirst());
            bookRepository.insertImage(bookImg);
        } catch (IOException e) {
            throw new CommonException(ResponseCode.INTERNAL_SERVER_ERROR, e);
        }
    }

    public List<Book> findAll() {
        return bookRepository.selectAll();
    }

    public List<Book> findPage(int page, int size) {
        int start = (page - 1) * size;
        return bookRepository.selectPaged(start, size);
    }
}
