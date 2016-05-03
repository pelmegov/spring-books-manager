package ru.pelmegov.booksmanager.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.pelmegov.booksmanager.dao.BookDao;
import ru.pelmegov.booksmanager.model.Book;

import java.util.List;

/**
 * @author modkomi
 * @since 03.05.2016
 */
@Service
public class BookServiceImpl implements BookService {

    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    private BookDao bookDao;


    @Override
    @Transactional
    public void addBook(Book book) {
        this.bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        this.bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        this.bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBookById(int id) {
        return this.bookDao.getBookById(id);
    }

    @Override
    @Transactional
    public List<Book> listBooks() {
        return this.bookDao.listBooks();
    }
}
