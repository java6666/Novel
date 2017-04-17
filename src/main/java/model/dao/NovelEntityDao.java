package model.dao;

import model.entity.novel.NovelEntity;
import model.entity.user.UserEntity;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */

public interface NovelEntityDao {
    NovelEntity selectById(Integer id); //查找收藏的书籍

    Integer insertNewNovel(NovelEntity novelEntity);            //创建新书

    List<NovelEntity> selectNoFinishNovelBynovelAuthor(UserEntity userEntity);          //查看作者所有未完成书籍
}
