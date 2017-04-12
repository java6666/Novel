package model.dao;

import model.entity.novel.NovelUserBuy;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
public interface NovelUserBuyDao {
    List<NovelUserBuy> selectByUserId(Integer id);
}
