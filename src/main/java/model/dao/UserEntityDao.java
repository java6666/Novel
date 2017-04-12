package model.dao;

import model.entity.user.UserEntity;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
public interface UserEntityDao {
    UserEntity selectUserByUser(UserEntity userEntity);
    UserEntity selectUserById(int id);
    boolean updateUserByUser(UserEntity userEntity);

    //查询novel_user表中所有用户信息
    List<UserEntity> selectUserEntityAll();

    //根据id修改用户类型(userType为修改成的用户类型)
    void updateUserEntityByUserId(Integer id,Integer userType);
}
