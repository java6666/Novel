package model.entity.novel;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lenovo on 2017/4/6.
 */
public class NovelCatregory {
    private Integer id;         //小说分类id
    private String name;        //分类名称
    private Date createDate;        //创建日期(从数据库取数据)
    private String viewCreateDate;       //创建日期(用于页面显示)

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    /***
     * 用于显示在页面是的日期
     */
    public String getViewCreateDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        viewCreateDate=simpleDateFormat.format(getCreateDate());
        return viewCreateDate;
    }

    public void setViewCreateDate(String viewCreateDate) {
        this.viewCreateDate = viewCreateDate;
    }
}
