package controller.author_page;

import model.dao.NovelCategoryDao;
import model.dao.UserEntityDao;
import model.entity.novel.NovelEntity;
import model.entity.user.UserEntity;
import model.service.author.AuthorMyNovelService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

/**
 * Created by lenovo on 2017/4/12.
 */
@Controller
public class AuthorMyNovel {
    /*测试开始*/
    @Resource
    private UserEntityDao userEntityDao;
    /*测试结束*/
    @Resource
    private AuthorMyNovelService authorMyNovelService;
    @RequestMapping(path = "/newNovel")
    public String myWorks(Model model,HttpSession session){
        List typeName = authorMyNovelService.myWorks();
        /*测试开始*/
        UserEntity userEntity = userEntityDao.selectUserById(2);
        session.setAttribute("superUser",userEntity);
        /*测试结束*/
        model.addAttribute("typeName",typeName);
        return "/WEB-INF/author_center/author_my_novel.jsp";
    }

    /*创建新书的方法*/
    @RequestMapping(path = "/insertNewNovel",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insertNewNovel(HttpSession session,String novelName, String novelTypeValue, Integer novelPrice, String novelSummary,
                                 @RequestParam("novelPhoto")MultipartFile novelPhoto){
        Object superUser = session.getAttribute("superUser");//获取session的user对象
        Boolean aBoolean = authorMyNovelService.insertNewNovel(novelName,novelTypeValue,novelPrice,novelSummary, superUser, novelPhoto, session);
        System.out.println(aBoolean);
        return "redirect:/newNovel";
    }

    /*获取作者所有未完成的书籍*/
    @RequestMapping(path = "/selectNoFinishNovel",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<NovelEntity> selectNoFinishNovel(HttpSession session){
        Object superUser = session.getAttribute("superUser");
        List<NovelEntity> novelEntities = authorMyNovelService.selectNoFinishNovel(superUser);
        return novelEntities;
    }
}
