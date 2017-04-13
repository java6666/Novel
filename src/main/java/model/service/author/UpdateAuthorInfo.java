package model.service.author;

import model.dao.AuthorDao;
import model.dao.UserInfoEntityDao;
import model.entity.author.Author;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by HKB on 2017/4/12.
 */
public class UpdateAuthorInfo {
    public Boolean updateAuthorInfo( AuthorDao authorDao, String birthday,
                                     String birthplace, String introduction, UserInfoEntity userInfo)  {

        Boolean result1 = false;
        /*更新作者信息*/
        Author author = new Author();
        author.setUserId(userInfo.getUserId());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sdf.parse(birthday);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        author.setBirthDate(date);
        author.setBirthAddress(birthplace);
        author.setAuthorIntroduce(introduction);

        result1 = authorDao.updateAuthorInfo(author);
        return result1;
    }
}
