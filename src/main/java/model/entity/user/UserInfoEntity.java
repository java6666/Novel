package model.entity.user;

import java.util.Date;

/**
 * Created by lenovo on 2017/4/6.
 *
 * 用户详细信息
 */
public class UserInfoEntity {
    private Integer userId;                 //关联的用户id
    private String realName;               //用户真实姓名
    private Integer phone;                  //用户电话
    private Integer money;                  //用户余额
    private Boolean gender;                 //用户性别0.女1.男
    private String headSculpturePath;      //用户头像路径
    private Date createDate;              //注册用户日期

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getPhone() {
        return phone;
    }

    public void setPhone(Integer phone) {
        this.phone = phone;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getHeadSculpturePath() {
        return headSculpturePath;
    }

    public void setHeadSculpturePath(String headSculpturePath) {
        this.headSculpturePath = headSculpturePath;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
