package model.service.user_center;

import model.dao.AuthorDao;
import model.dao.EmailBoxDao;

import model.entity.author.Author;
import model.entity.other.EmailBox;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by LJ on 2017/4/13.
 */
@Service
public class UserUpMethod {
@Resource
    private EmailBoxDao emailBoxDao;
@Resource
    private AuthorDao authorDao;
@Transactional
    public void upAuthorSer(Author author, EmailBox emailBox){
    authorDao.addAuthor(author);
    emailBoxDao.addMail(emailBox);
}
}
