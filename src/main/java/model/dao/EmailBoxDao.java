package model.dao;

import model.entity.other.EmailBox;

import java.util.List;

/**
 * Created by LJ on 2017/4/11.
 */
public interface EmailBoxDao {
    //通过收件者id查询消息
    List<EmailBox> selectByInId(int id);
    //通过收件者id查询消息总条数
    Integer selectCountByInId(int id);
    //添加一条消息
    void addMail(EmailBox emailBox);
}
