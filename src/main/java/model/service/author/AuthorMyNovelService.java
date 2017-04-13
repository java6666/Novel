package model.service.author;

import model.dao.AuthorDao;
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
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by lenovo on 2017/4/12.
 */
@Service
public class AuthorMyNovelService {
    @Resource
    private AuthorDao authorDao;
    @Resource
    private NovelEntityDao novelEntityDao;
    /**创建新书的业务方法
     * @param novelEntity   小说的实体类
     * @param obj   user的实体类
     * @param  novelPhoto      小说封面
     * @param session       用于创建动态路径*/
    public Boolean insertNewNovel(NovelEntity novelEntity,Object obj,  @RequestParam("novelPhoto")MultipartFile novelPhoto, HttpSession session){
        /*创建小说封面动态路径*/
        long millis = System.currentTimeMillis();       //获取毫秒数，防止文件夹重名的情况
        UserEntity user=(UserEntity)obj;        //将session对象转换为user对象
        Author author = authorDao.selectAuthorByUserId(user.getId());           //用id该作者的资料
        /*小说文件夹的名字：novelPhoto/文件夹下的     毫秒数+作者id+用户名+小说名*/
        String fileName=millis+author.getUserId()+user.getUserName()+novelEntity.getNovelName();          //该小说的文件夹名称
        String novelFile = session.getServletContext().getRealPath("novelPhoto/"+fileName+"/");
        File file = new File(novelFile);
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
        novelEntity.setNovelAuthor(author.getUserId());        //小说作者，用的是笔名
        novelEntity.setNovelFilePath(novelFile);            //小说的文件路径
        novelEntity.setNovelFileName(fileName);         //小说存在的文件名
        novelEntity.setNovelPicPath(novelFile);            //小说图片途径
        novelEntity.setNovelPicName(savePhotoName);         //小说图片名称
        novelEntity.setNovelTotal(0);                       //小说总张数，创建时默认是0
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
}
