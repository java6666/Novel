package model.dao;

import model.entity.novel.NovelEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by LJ on 2017/4/11.
 */

public interface NovelEntityDao {
    NovelEntity selectById(Integer id); //查找收藏的书籍

    Integer insertNewNovel(NovelEntity novelEntity);            //创建新书
}
