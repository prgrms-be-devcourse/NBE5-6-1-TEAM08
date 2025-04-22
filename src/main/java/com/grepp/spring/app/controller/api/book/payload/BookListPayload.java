package com.grepp.spring.app.controller.api.book.payload;

import com.grepp.spring.app.model.book.code.BookImgType;
import com.grepp.spring.app.model.book.dto.Book;
import com.grepp.spring.app.model.book.dto.BookImg;
import java.util.List;

public record BookListPayload(
    List<BookInfo> bookInfos
) {
    public record BookInfo(
        int bkIdx,
        String title,
        String author,
        String thumbnail
    ){
        public static BookInfo fromDto(Book book){
            List<BookImg> images = book.getImages();
            if(images == null){
                return new BookInfo(
                    book.getBkIdx(),
                    book.getTitle(),
                    book.getAuthor(),
                    null
                );
            }

            List<BookImg> thumbnail =  images.stream().
                filter(e -> e.getType().equals(BookImgType.THUMBNAIL))
                .toList();

            return new BookInfo(
                book.getBkIdx(),
                book.getTitle(),
                book.getAuthor(),
                thumbnail.isEmpty() ? null : thumbnail.getFirst().getUrl()
            );
        }
    }

    public static BookListPayload fromDtoList(List<Book> books){
        List<BookInfo> bookInfos = books.stream().map(BookInfo::fromDto).toList();
        return new BookListPayload(bookInfos);
    }

}