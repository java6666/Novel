package model.entity.user;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 作者信息表
* */
public class Author {
    private Integer userId;         //关联userId
    private Date birthDate;        //作者出生年月
    private String penName;         //作者笔名
    private String birthAddress;    //作者出生地
    private String authorIntroduce; //作者简介
    private Date createDate;       //升级为作者日期

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public String getPenName() {
        return penName;
    }

    public void setPenName(String penName) {
        this.penName = penName;
    }

    public String getBirthAddress() {
        return birthAddress;
    }

    public void setBirthAddress(String birthAddress) {
        this.birthAddress = birthAddress;
    }

    public String getAuthorIntroduce() {
        return authorIntroduce;
    }

    public void setAuthorIntroduce(String authorIntroduce) {
        this.authorIntroduce = authorIntroduce;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
