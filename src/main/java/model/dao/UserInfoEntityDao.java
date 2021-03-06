package model.dao;

import model.entity.user.UserInfoEntity;
import org.springframework.stereotype.Repository;

/**
 * Created by LJ on 2017/4/11.
 */

public interface UserInfoEntityDao {
    UserInfoEntity selectUserInfoByUserId(Integer userId);//查找用户信息
    Boolean updateUserInfo(UserInfoEntity userInfoEntity);//更改用户信息
}
