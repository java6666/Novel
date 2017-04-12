package model.dao;

import model.entity.novel.NovelUserCollection;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
public interface NovelUserCollectionDao {
    List<NovelUserCollection> selectById(Integer id);

    void delById(@Param("novelId") Integer id, @Param("userId") Integer userId); //取消收藏
}
