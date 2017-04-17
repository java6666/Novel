package model.service.author;

import model.dao.AuthorDao;
import model.dao.NovelCategoryDao;
import model.dao.NovelEntityDao;
import model.entity.author.Author;
import model.entity.novel.NovelEntity;
import model.entity.user.UserEntity;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by lenovo on 2017/4/12.
 */
@Service
public class AuthorMyNovelService {
    @Resource
    private AuthorDao authorDao;
    @Resource
    private NovelEntityDao novelEntityDao;
    @Resource
    private NovelCategoryDao novelCategoryDao;

    /**获取所有小说的种类
     * @return List<String>  返回所有种类的集合*/
    public List myWorks(){
        List<String> typeName = novelCategoryDao.seletAllNovelCategoryName();
        return typeName;
    }

    /**创建新书的业务方法
     * @param novelName     小说名字
     *@param novelTypeValue   小说种类
     * @param  novelPrice      小说售价
     *@param    novelSummary    小说简介
     * @param obj   user的实体类
     * @param  novelPhoto      小说封面
     * @param session       用于创建动态路径*/
    public Boolean insertNewNovel(String novelName, String novelTypeValue, Integer novelPrice, String novelSummary,Object obj,  @RequestParam("novelPhoto")MultipartFile novelPhoto, HttpSession session){
        NovelEntity novelEntity = new NovelEntity();            //创建小说类
        novelEntity.setNovelName(novelName);        //设置接收的小说名
        /*创建小说封面动态路径*/
        long millis = System.currentTimeMillis();       //获取毫秒数，防止文件夹重名的情况
        UserEntity user=(UserEntity)obj;        //将session对象转换为作者
        Author author = authorDao.selectAuthorByUserId(user.getId());           //用id该作者的资料
        /*小说文件夹的名字：novelPhoto/每个作者的id+作者的用户名/下     毫秒数+作者id+用户名+小说名*/
        String fileName=author.getUserId()+user.getUserName()+"/"+millis+author.getUserId()+user.getUserName()+novelEntity.getNovelName();          //该小说的文件夹名称
        String novelFile = session.getServletContext().getRealPath("novelPhoto/"+fileName+"/");
        File file = new File(novelFile);
       /*判断该文件夹是否存在，如果不存在就创建一个*/
        if (!file.exists()) {
            file.mkdir();
        }
        /*获取图片的名字，并获取图片的后缀名，转换为小写*/
        String photoName = novelPhoto.getOriginalFilename();
        String photoType = photoName.substring(photoName.lastIndexOf(".")).toLowerCase();
//        储存图片的名称：上面已创建好的文件下+毫秒数+格式
        String savePhotoName=millis + "." + photoType;
        File savePhtotPath = new File(novelFile + savePhotoName);
        /*继续添加作者小说信息*/
        novelEntity.setNovelType(novelTypeValue);       //设置接收的小说种类
        novelEntity.setPrice(novelPrice);                   //设置接收的小说售价
        novelEntity.setNovelSummary(novelSummary);      //设置接收的小说简介
        novelEntity.setNovelAuthor(author.getUserId());        //小说作者，用的是笔名
        novelEntity.setNovelFilePath(novelFile);            //小说的文件路径
        novelEntity.setNovelFileName(fileName);         //小说存在的文件名
        novelEntity.setNovelPicPath(novelFile);            //小说图片途径
        novelEntity.setNovelPicName(savePhotoName);         //小说图片名称
        novelEntity.setNovelTotal(0);                       //小说总张数，创建时默认是0
        novelEntity.setNovelClickRate(0);                   //设置小说点击量，默认是0
        novelEntity.setNovelBuyCount(0);                    //设置掉说购买量，默认是0
        novelEntity.setNovelIsFinish(false);                    //小说是否完结，默认未完结
        novelEntity.setCreateBy(author.getUserId());            //小说发布者ID
        /*获取本地时间*/
        novelEntity.setCreateDate(new Date());              //创建时间
        try {
//            将图片内存图片拷贝到设置的文件夹下
            FileUtils.copyInputStreamToFile(novelPhoto.getInputStream(),savePhtotPath);
            Integer integer = novelEntityDao.insertNewNovel(novelEntity);
            if(integer!=0){
                return true;
            }else {
                return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**获取作者未完成的作品
     * @param obj   获取该作者*/
    public List<NovelEntity> selectNoFinishNovel(Object obj){
        UserEntity novelEntity= (UserEntity) obj;         //将obj转为作者
        Integer id = novelEntity.getId();                   //获取作者id
        UserEntity userEntity = new UserEntity();
        userEntity.setId(id);
        List<NovelEntity> novelEntities = novelEntityDao.selectNoFinishNovelBynovelAuthor(userEntity);
        return novelEntities;
    }
}
