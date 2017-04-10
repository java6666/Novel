package model.entity.other;

import java.util.Date;

/**
 * Created by Administrator on 2017/4/10.
 */
/*
* 广告栏
* */
public class Advert {
    private Integer id;                   //主键id
    private Date createDate;             //创建日期
    private Integer createBy;             //创建者
    private Date modifyDate;              //修改日期
    private Integer modifyBy;             //修改者

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Integer getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy) {
        this.modifyBy = modifyBy;
    }
}
