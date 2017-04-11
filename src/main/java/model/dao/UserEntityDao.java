package model.dao;

import model.entity.user.UserEntity;

/**
 * Created by LJ on 2017/4/11.
 */
public interface UserEntityDao {
    UserEntity selectUserByUser(UserEntity userEntity);
    UserEntity selectUserById(int id);
}
