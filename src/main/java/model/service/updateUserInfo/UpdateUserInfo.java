package model.service.updateUserInfo;

import model.dao.UserInfoEntityDao;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * Created by LJ on 2017/4/11.
 */
public class UpdateUserInfo {
    public Boolean updateUserInfo(@RequestParam("alice")MultipartFile file, UserInfoEntityDao userInfoEntityDao, String name, Integer phone, Boolean sex, UserEntity user, HttpSession session){

        Boolean result=false;
        UserInfoEntity userInfo = new UserInfoEntity();
        userInfo.setUserId(user.getId());
        userInfo.setRealName(name);
        userInfo.setGender(sex);
        userInfo.setPhone(phone);
        long millis = System.currentTimeMillis();
        userInfo.setHeadSculpturePath("head\\"+millis+".jpg");
        String uploadPath = session.getServletContext().getRealPath("head/");
        File file1 = new File(uploadPath);
        if (!file1.exists()){
            file1.mkdir();
        }
        File targetFile = new File(uploadPath+millis+".jpg");
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),targetFile);
            result = userInfoEntityDao.updateUserInfo(userInfo);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }
}
