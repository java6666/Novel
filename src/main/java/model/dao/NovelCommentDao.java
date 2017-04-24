package model.dao;

import model.entity.novel.NovelComment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */

public interface NovelCommentDao {
    List<NovelComment> selectByNovelId(Integer novelId);
}
