package model.entity.user;

/**
 * Created by lenovo on 2017/4/6.
 *
 * 用户详细信息
 */
public class UserInfoEntity {
    private Integer id;                     //本表自己id
    private Integer userId;                 //关联的用户id
    private String realName;               //用户真实姓名
    private Integer phone;                  //用户电话
    private Integer moeny;                  //用户余额

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

    public Integer getMoeny() {
        return moeny;
    }

    public void setMoeny(Integer moeny) {
        this.moeny = moeny;
    }
}
