package model.dao;

import model.entity.novel.NovelUserBuy;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */

public interface NovelUserBuyDao {
    List<NovelUserBuy> selectByUserId(Integer id); //查找购买的书
}
