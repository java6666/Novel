package model.dao;

import model.entity.author.Author;
import org.springframework.stereotype.Repository;

/**
 * Created by LJ on 2017/4/11.
 */
@Repository
public interface AuthorDao {
    //根据id查询作者详细信息
    Author selectAuthorByUserId(Integer id);
    //添加作者
    void addAuthor(Author author);
    //根据id删除对应的作者信息yz
    void deleteAuthorInfoByUserId(Integer id);

    Boolean updateAuthorInfo(Author author);//更改作者信息hkb
}
