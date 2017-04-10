package model.entity.novel;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 小说表与用户表购买关系多对多连接表
* */
public class NovelUserBuy {
    private Integer id;                 //主键id
    private Integer userId;             //用户id
    private Integer novelId;             //小说id
    private Date createDate;            //购买小说日期

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getNovelId() {
        return novelId;
    }

    public void setNovelId(Integer novelId) {
        this.novelId = novelId;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
