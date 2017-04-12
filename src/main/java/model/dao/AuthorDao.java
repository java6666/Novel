package model.dao;

import model.entity.author.Author;

/**
 * Created by LJ on 2017/4/11.
 */
public interface AuthorDao {
    //根据id查询作者详细信息
    Author selectAuthorByUserId(Integer id);
}
