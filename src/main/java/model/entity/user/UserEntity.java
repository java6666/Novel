package model.entity.user;

/**
 * Created by lenovo on 2017/4/6.
 *
 * 用户基本信息
 */
public class UserEntity {
    private Integer id;                           //用户id
    private String userName;                    //用户名
    private String password;                     //密码
    private Integer userType;                   //用户类型1.管理员2.作者3.普通用户
    private Integer accountType;                //账户状态1.正常2.封停3.删除

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }
}
