package model.entity.novel;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lenovo on 2017/4/6.
 *
 * 小说详细信息
 */
public class NovelEntity {
    private Integer id;                                 //小说id
    private String novelName;                         //小说名字
    private String novelSummary;                    //小说摘要
    private String novelType;                           //小说种类
    private Integer novelAuthor;                      //小说作者
    private String novelFilePath;                     //小说文件路径
    private String novelFileName;                    //小说文件名
    private String novelPicPath;                     //小说图片路径
    private String novelPicName;                    //小说图片名字
    private Integer novelClickRate;                  //小说点击量
    private Integer novelBuyCount;                   //小说购买量
    private Integer novelTotal;                      //小说总章数
    private Boolean novelIsFinish;                  //小说是否完结0.未完结1.完结
    private Integer price;                           //小说价格（单位：金币）
    private Date createDate;                        //上传日期(从数据库里面取值)
    private Date modifyDate;                       //更新日期(从数据库里面取值)
    private Integer createBy;                      //上传者的id
    private Integer modifyBy;                     //修改者的id
    private Integer novelLatestChapter;          //小说最新章节

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNovelName() {
        return novelName;
    }

    public void setNovelName(String novelName) {
        this.novelName = novelName;
    }

    public String getNovelSummary() {
        return novelSummary;
    }

    public void setNovelSummary(String novelSummary) {
        this.novelSummary = novelSummary;
    }

    public Integer getNovelAuthor() {
        return novelAuthor;
    }

    public void setNovelAuthor(Integer novelAuthor) {
        this.novelAuthor = novelAuthor;
    }

    public String getNovelFilePath() {
        return novelFilePath;
    }

    public void setNovelFilePath(String novelFilePath) {
        this.novelFilePath = novelFilePath;
    }

    public String getNovelFileName() {
        return novelFileName;
    }

    public void setNovelFileName(String novelFileName) {
        this.novelFileName = novelFileName;
    }

    public String getNovelPicPath() {
        return novelPicPath;
    }

    public void setNovelPicPath(String novelPicPath) {
        this.novelPicPath = novelPicPath;
    }

    public String getNovelPicName() {
        return novelPicName;
    }

    public void setNovelPicName(String novelPicName) {
        this.novelPicName = novelPicName;
    }

    public Integer getNovelClickRate() {
        return novelClickRate;
    }

    public void setNovelClickRate(Integer novelClickRate) {
        this.novelClickRate = novelClickRate;
    }

    public Integer getNovelBuyCount() {
        return novelBuyCount;
    }

    public void setNovelBuyCount(Integer novelBuyCount) {
        this.novelBuyCount = novelBuyCount;
    }

    public Integer getNovelTotal() {
        return novelTotal;
    }

    public void setNovelTotal(Integer novelTotal) {
        this.novelTotal = novelTotal;
    }

    public Boolean getNovelIsFinish() {
        return novelIsFinish;
    }

    public void setNovelIsFinish(Boolean novelIsFinish) {
        this.novelIsFinish = novelIsFinish;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getModifyDate() {
        return modifyDate;
    }

    public void setModifyDate(Date modifyDate) {
        this.modifyDate = modifyDate;
    }

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public Integer getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(Integer modifyBy) {
        this.modifyBy = modifyBy;
    }

    public String getNovelType() {
        return novelType;
    }

    public void setNovelType(String novelType) {
        this.novelType = novelType;
    }

    public Integer getNovelLatestChapter() {
        return novelLatestChapter;
    }

    public void setNovelLatestChapter(Integer novelLatestChapter) {
        this.novelLatestChapter = novelLatestChapter;
    }
}
