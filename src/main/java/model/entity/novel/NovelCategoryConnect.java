package model.entity.novel;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 小说表与小说类型表多对多连接表
* */
public class NovelCategoryConnect {
    private Integer id;                 //主键id
    private Integer novelId;           //小说id
    private Integer categoryId;        //小说类型id
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNovelId() {
        return novelId;
    }

    public void setNovelId(Integer novelId) {
        this.novelId = novelId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
