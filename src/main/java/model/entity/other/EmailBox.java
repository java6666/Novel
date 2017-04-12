package model.entity.other;

import model.entity.user.UserEntity;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 邮箱表
* */
public class EmailBox {
    private Integer id;           //主键id
    private Integer addresseeId;    //发件人id
    private Integer recipientsId;   //收件人id
    private String content;        //邮件内容
    private Date createDate;       //发件日期
    private UserEntity addressee;  //发件人
    private UserEntity recipients; //收件人

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public UserEntity getAddressee() {
        return addressee;
    }

    public void setAddressee(UserEntity addressee) {
        this.addressee = addressee;
    }

    public UserEntity getRecipients() {
        return recipients;
    }

    public void setRecipients(UserEntity recipients) {
        this.recipients = recipients;
    }

    public Integer getAddresseeId() {
        return addresseeId;
    }

    public void setAddresseeId(Integer addresseeId) {
        this.addresseeId = addresseeId;
    }

    public Integer getRecipientsId() {
        return recipientsId;
    }

    public void setRecipientsId(Integer recipientsId) {
        this.recipientsId = recipientsId;
    }
}
