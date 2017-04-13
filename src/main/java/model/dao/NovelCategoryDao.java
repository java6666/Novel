package model.dao;

import org.springframework.stereotype.Repository;
import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
@Repository
public interface NovelCategoryDao {
    List<String> seletAllNovelCategoryName();     //获取所有的小说分类，主要是为页面的分类做提供
}
