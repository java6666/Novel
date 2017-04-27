package model.entity.novel;

import model.entity.user.UserEntity;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 小说评论表
* */
public class NovelComment {
    private Integer id;           //主键id
    private Integer novelDetailId;//关联小说id
    private String content;        //评论内容
    private Date createDate;       //评论日期
    private Integer createBy;      //评论者id
    private UserEntity userEntity;  //评论者对象

    public UserEntity getUserEntity() {
        return userEntity;
    }

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getNovelDetailId() {
        return novelDetailId;
    }

    public void setNovelDetailId(Integer novelDetailId) {
        this.novelDetailId = novelDetailId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }
}
