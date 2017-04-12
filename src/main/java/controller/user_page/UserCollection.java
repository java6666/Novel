package controller.user_page;

import model.dao.NovelEntityDao;
import model.dao.NovelUserCollectionDao;
import model.entity.novel.NovelEntity;
import model.entity.novel.NovelUserCollection;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(path = "/user/collection",method = RequestMethod.GET)
    public String userCollection(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");

        ArrayList<NovelEntity> novelEntities = new ArrayList<>();//收藏数的集合
        List<NovelUserCollection> novelUserCollections = novelUserCollectionDao.selectById(user.getId());
        for (int i=0;i<novelUserCollections.size();i++){
            NovelEntity novelEntity = novelEntityDao.selectById(novelUserCollections.get(i).getNovelId());
            novelEntities.add(novelEntity);
        }

        model.addAttribute("novelList",novelEntities);
        return "/WEB-INF/user_center/user_collection.jsp";
    }
}
