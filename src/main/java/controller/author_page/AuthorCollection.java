package controller.author_page;

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
 * Created by HKB on 2017/4/13.
 */
@Controller
public class AuthorCollection {
    @Resource
    private NovelEntityDao novelEntityDao;
    @Resource
    private NovelUserCollectionDao novelUserCollectionDao;
    @Resource
    private UserInfoEntityDao userInfoEntityDao;


    @RequestMapping(path = "/author/collection",method = RequestMethod.GET)
    public String userCollection(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");

        UserCollectionMethod userCollectionMethod = new UserCollectionMethod();
        userCollectionMethod.userCollectionMethod(model,user,novelEntityDao,userInfoEntityDao,novelUserCollectionDao);

        return "/WEB-INF/author_center/book_shelf.jsp";
    }

    @RequestMapping(path = "/author/collectionDel",method = RequestMethod.GET)
    public String userCollectionDel(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");

        UserCollectionMethod userCollectionMethod = new UserCollectionMethod();

        userCollectionMethod.userCollectionMethod(model,user,novelEntityDao,userInfoEntityDao,novelUserCollectionDao);

        return "/WEB-INF/author_center/book_shelf.jsp";
    }

    @RequestMapping(path = "/author/delCollection",method = RequestMethod.GET)
    public String collectionDel(Integer userId,Integer id,HttpSession session, Model model){
        novelUserCollectionDao.delById(id,userId);
        return "redirect:/author/collection";
    }
}
