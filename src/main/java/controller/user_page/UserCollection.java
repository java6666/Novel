package controller.user_page;

import model.dao.NovelEntityDao;
import model.dao.NovelUserCollectionDao;
import model.dao.UserInfoEntityDao;
import model.entity.novel.NovelEntity;
import model.entity.novel.NovelUserCollection;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import util.CollectionInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LJ on 2017/4/12.
 */
@Controller
public class UserCollection {
    @Resource
    private NovelEntityDao novelEntityDao;
    @Resource
    private NovelUserCollectionDao novelUserCollectionDao;
    @Resource
    private UserInfoEntityDao userInfoEntityDao;


    @RequestMapping(path = "/user/collection",method = RequestMethod.GET)
    public String userCollection(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");
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

            collectionInfos.add(collectionInfo);
        }
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("novelList",collectionInfos);
        return "/WEB-INF/user_center/user_collection.jsp";
    }

    @RequestMapping(path = "/user/collectionDel",method = RequestMethod.GET)
    public String userCollectionDel(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");
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

            collectionInfos.add(collectionInfo);
        }
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("novelList",collectionInfos);
        return "/WEB-INF/user_center/user_collection_del.jsp";
    }

    @RequestMapping(path = "/user/delCollection",method = RequestMethod.GET)
    public String collectionDel(Integer id,HttpSession session, Model model){
        novelEntityDao.delById(id);
        return "redirect:/user/collectionDel";
    }
}
