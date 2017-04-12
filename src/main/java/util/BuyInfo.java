package util;

import java.util.Date;

/**
 * Created by LJ on 2017/4/12.
 */
public class BuyInfo {
    private Date createDate;  //购买日期
    private String readNow;              //当前阅读章数
    private String novelAuthor;     //小说作者
    private String novelName;       //小说名
    private  Integer id;   //小说ID

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getReadNow() {
        return readNow;
    }

    public void setReadNow(String readNow) {
        this.readNow = readNow;
    }

    public String getNovelAuthor() {
        return novelAuthor;
    }

    public void setNovelAuthor(String novelAuthor) {
        this.novelAuthor = novelAuthor;
    }

    public String getNovelName() {
        return novelName;
    }

    public void setNovelName(String novelName) {
        this.novelName = novelName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
