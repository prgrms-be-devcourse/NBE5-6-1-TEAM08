package com.grepp.spring.app.model.book;

import com.grepp.spring.app.model.book.dto.Book;
import com.grepp.spring.app.model.book.dto.BookImg;
import java.util.List;
import java.util.Optional;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface BookRepository {

    List<Book> selectAll();

    List<Book> selectPaged(@Param("start") int start, @Param("offset") int offset);

    @Select("select * from book where bk_idx = #{bkIdx}")
    Optional<Book> selectById(Integer bkIdx);

    // '%디디%'
    @Select("select * from book where title like concat('%', #{title}, '%')")
    List<Book> selectByTitle(String title);

    @Insert("insert into book(category, title, author, info) "
        + "values (#{category},#{title},#{author},#{info})")
    @Options(useGeneratedKeys = true, keyColumn = "bk_idx", keyProperty = "bkIdx")
    void insert(Book book);

    @Update("update book set title=#{title}, author=#{author} where bk_idx = #{bkIdx}")
    boolean update(Book book);

    @Delete("delete from book where bk_idx = #{bkIdx}")
    boolean delete(Integer bkIdx);

    List<Book> recentRentBook(Integer n);

    List<Book> selectByIf(
        @Param("search") String search,
        @Param("keyword") String keyword);

    // org.apache.ibatis.binding.BindingException: Invalid bound statement (not found): com.grepp.spring.app.model.book.BookRepository.selectByChooseWhen
//    List<Book> selectByChooseWhen(
//        @Param("search") String search,
//        @Param("keyword") String keyword);

    void bulkInsert(List<Book> books);

    List<Book> selectDynamic(
        @Param("searches") List<String> searches,
        @Param("keyword") String keyword);

    @Select("insert into book_img (BK_IDX, TYPE, ORIGIN_FILE_NAME, RENAME_FILE_NAME, SAVE_PATH) "
        + "values(#{bkIdx}, #{type}, #{originFileName}, #{renameFileName}, #{savePath})")
    void insertImage(BookImg bookImg);
}