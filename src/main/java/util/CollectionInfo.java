package util;

import java.util.Date;

/**
 * Created by LJ on 2017/4/12.
 */
//工具类 用于储存用户收藏书籍
public class CollectionInfo {
    private Date createDate;  //收藏日期
    private String readNow;              //当前阅读章数
    private Integer novelAuthor;     //小说作者
    private String novelName;       //小说名
    private  Integer id;   //小说ID
    private Integer userId;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

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

    public String getReadNow() {
        return readNow;
    }

    public void setReadNow(String readNow) {
        this.readNow = readNow;
    }

    public Integer getNovelAuthor() {
        return novelAuthor;
    }

    public void setNovelAuthor(Integer novelAuthor) {
        this.novelAuthor = novelAuthor;
    }

    public String getNovelName() {
        return novelName;
    }

    public void setNovelName(String novelName) {
        this.novelName = novelName;
    }
}
