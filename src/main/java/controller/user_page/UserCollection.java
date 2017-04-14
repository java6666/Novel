package controller.user_page;

import model.dao.NovelEntityDao;
import model.dao.NovelUserCollectionDao;
import model.dao.UserInfoEntityDao;


import model.entity.user.UserEntity;

import model.service.user_center.UserCollectionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

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

        UserCollectionMethod userCollectionMethod = new UserCollectionMethod();
        userCollectionMethod.userCollectionMethod(model,user,novelEntityDao,userInfoEntityDao,novelUserCollectionDao);

        return "/WEB-INF/user_center/user_collection.jsp";
    }

    @RequestMapping(path = "/user/collectionDel",method = RequestMethod.GET)
    public String userCollectionDel(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");

        UserCollectionMethod userCollectionMethod = new UserCollectionMethod();

        userCollectionMethod.userCollectionMethod(model,user,novelEntityDao,userInfoEntityDao,novelUserCollectionDao);

        return "/WEB-INF/user_center/user_collection_del.jsp";
    }

    @RequestMapping(path = "/user/delCollection",method = RequestMethod.GET)
    public String collectionDel(Integer userId,Integer id,HttpSession session, Model model){
        novelUserCollectionDao.delById(id,userId);
        return "redirect:/user/collectionDel";
    }
}
