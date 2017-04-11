package model.entity.other;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 邮箱表
* */
public class EmailBox {
    private Integer id;           //主键id
    private Integer addresseeId;  //发件人id
    private Integer recipientsId; //收件人id
    private String content;        //邮件内容
    private Date createDate;       //发件日期

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
}
