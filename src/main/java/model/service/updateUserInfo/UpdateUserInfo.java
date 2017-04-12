package model.service.updateUserInfo;

import model.dao.UserInfoEntityDao;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by LJ on 2017/4/11.
 */
public class UpdateUserInfo {
    public Boolean updateUserInfo(@RequestParam("alice")MultipartFile file, UserInfoEntityDao userInfoEntityDao, String name, Integer phone, Boolean sex, UserEntity user){

        Boolean result=false;
        UserInfoEntity userInfo = new UserInfoEntity();
        userInfo.setUserId(user.getId());
        userInfo.setRealName(name);
        userInfo.setGender(sex);
        userInfo.setPhone(phone);
        long millis = System.currentTimeMillis();
        userInfo.setHeadSculpturePath("head\\"+millis+".jpg");
        File targetFile = new File("E:\\gitworkspace\\novel\\target\\novel-1.0-SNAPSHOT\\head\\"+millis+".jpg");
        try {
            FileUtils.copyInputStreamToFile(file.getInputStream(),targetFile);
            File webFile = new File("E:\\gitworkspace\\novel\\src\\main\\webapp\\head\\" + millis + ".jpg");
            FileUtils.copyInputStreamToFile(file.getInputStream(),webFile);
            result = userInfoEntityDao.updateUserInfo(userInfo);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return result;
    }
}
