package model.dao;

import model.entity.novel.NovelUserCollection;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
public interface NovelUserCollectionDao {
    List<NovelUserCollection> selectById(Integer id);
}
