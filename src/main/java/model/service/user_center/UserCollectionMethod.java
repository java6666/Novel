package model.service.user_center;

import model.dao.NovelEntityDao;
import model.dao.NovelUserCollectionDao;
import model.dao.UserInfoEntityDao;
import model.entity.novel.NovelEntity;
import model.entity.novel.NovelUserCollection;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import util.CollectionInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by LJ on 2017/4/13.
 */


public class UserCollectionMethod {

    @Transactional// 这个方法就是支持事务的了
    //封装方法为设置事物做准备
    public void userCollectionMethod(Model model,UserEntity user, NovelEntityDao novelEntityDao, UserInfoEntityDao userInfoEntityDao, NovelUserCollectionDao novelUserCollectionDao){

        UserInfoEntity userInfo = userInfoEntityDao.selectUserInfoByUserId(user.getId());

        ArrayList<CollectionInfo> collectionInfos = new ArrayList<CollectionInfo>();

        List<NovelUserCollection> novelUserCollections = novelUserCollectionDao.selectById(user.getId());
        for (int i=0;i<novelUserCollections.size();i++){
            NovelEntity novelEntity = novelEntityDao.selectById(novelUserCollections.get(i).getNovelId());
            CollectionInfo collectionInfo = new CollectionInfo();
            collectionInfo.setNovelName(novelEntity.getNovelName());
            collectionInfo.setNovelAuthor(novelEntity.getNovelAuthor());
            collectionInfo.setCreateDate(novelUserCollections.get(i).getCreateDate());
            collectionInfo.setReadNow(novelUserCollections.get(i).getReadNow());
            collectionInfo.setId(novelUserCollections.get(i).getNovelId());
            collectionInfo.setUserId(novelUserCollections.get(i).getUserId());

            collectionInfos.add(collectionInfo);
        }
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("novelList",collectionInfos);
    }
}
