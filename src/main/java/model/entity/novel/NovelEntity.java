package model.entity.novel;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lenovo on 2017/4/6.
 *
 * 小说详细信息
 */
public class NovelEntity {
    private Integer id;                                     //小说id
    private Integer categoryId;                         //小说分类id
    private String novelName;                         //小说名字
    private String novelSummary;                    //小说摘要
    private String novelAuthor;                      //小说作者
    private String novelFilePath;                     //小说文件路径
    private String novelFilename;                    //小说文件名
    private String novelFicPath;                     //小说图片路径
    private String novelFicName;                    //小说图片名字
    private Integer novelClickRate;                  //小说点击量
    private Date createDate;                        //上传日期(从数据库里面取值)
    private String viewCreateDate;                 //上传日期(用作显示)
    private Date modifyDate;                       //更新日期(从数据库里面取值)
    private String viewModifyDate;                 //更新日期(从数据库里面取值)
    private Integer createBy;                      //上传者的id
    private Integer modifyBy;                     //修改者的id

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
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

    public String getNovelAuthor() {
        return novelAuthor;
    }

    public void setNovelAuthor(String novelAuthor) {
        this.novelAuthor = novelAuthor;
    }

    public String getNovelFilePath() {
        return novelFilePath;
    }

    public void setNovelFilePath(String novelFilePath) {
        this.novelFilePath = novelFilePath;
    }

    public String getNovelFilename() {
        return novelFilename;
    }

    public void setNovelFilename(String novelFilename) {
        this.novelFilename = novelFilename;
    }

    public String getNovelFicPath() {
        return novelFicPath;
    }

    public void setNovelFicPath(String novelFicPath) {
        this.novelFicPath = novelFicPath;
    }

    public String getNovelFicName() {
        return novelFicName;
    }

    public void setNovelFicName(String novelFicName) {
        this.novelFicName = novelFicName;
    }

    public Integer getNovelClickRate() {
        return novelClickRate;
    }

    public void setNovelClickRate(Integer novelClickRate) {
        this.novelClickRate = novelClickRate;
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

    /**下面四个get和set是String的日期类
     * 用于在页面上显示时间使用
     * 从数据里面的取出的数据在后台进行格式化*/
    public String getViewCreateDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        viewCreateDate=simpleDateFormat.format(getCreateDate());
        return viewCreateDate;
    }

    public void setViewCreateDate(String viewcreateDate) {
        this.viewCreateDate = viewcreateDate;
    }

    public String getViewModifyDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        viewModifyDate=simpleDateFormat.format(getModifyDate());
        return viewModifyDate;
    }

    public void setViewModifyDate(String viewmodifyDate) {
        this.viewModifyDate = viewmodifyDate;
    }
}
