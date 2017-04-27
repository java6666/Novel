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
/*        *//*测试开始*//*
        UserEntity userEntity = userEntityDao.selectUserById(2);
        session.setAttribute("superUser",userEntity);
        *//*测试结束*/
        model.addAttribute("typeName",typeName);
        return "/WEB-INF/author_center/author_my_novel.jsp";
    }

    /*创建新书的方法*/
    @RequestMapping(path = "/insertNewNovel",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String insertNewNovel(HttpSession session,String novelName, String novelTypeValue, Integer novelPrice, String novelSummary,
                                 @RequestParam("novelPhoto")MultipartFile novelPhoto){
        Object superUser = session.getAttribute("superUser");//获取session的user对象
        Boolean flag = authorMyNovelService.insertNewNovel(novelName,novelTypeValue,novelPrice,novelSummary, superUser, novelPhoto, session);
        if(flag){
            return "新增小说成功！";
        }else {
            return "新增小说失败！";
        }

    }

    /*获取作者所有未完成的书籍集合*/
    @RequestMapping(path = "/selectNoFinishNovelList",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<NovelEntity> selectNoFinishNovelList(HttpSession session){
        Object superUser = session.getAttribute("superUser");
        List<NovelEntity> novelEntities = authorMyNovelService.selectNoFinishNovelList(superUser);
        return novelEntities;
    }

    /*点击续载后，根据小说id查看小说详细信息*/
    @RequestMapping(path = "/selectNoFinishNovelInfoByNovelId",produces = "application/json;charset=utf-8")
    @ResponseBody
    public NovelEntity selectNoFinishNovelInfoByNovelId(Integer novelId){
        NovelEntity novelEntity = authorMyNovelService.selectNoFinishNovelInfoByNovelId(novelId);
        System.out.println(novelEntity);
        return novelEntity;
    }

    /*点击已完结时的操作*/
    @RequestMapping(path = "/selectFinishNovelList",produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<NovelEntity> selectFinishNovelList(HttpSession session){
        Object superUser = session.getAttribute("superUser");
        List<NovelEntity> novelEntities = authorMyNovelService.selectFinishNovelList(superUser);
        return novelEntities;
    }

    /*在未完结的板块中，点击完结的按钮的操作代码*/
    @RequestMapping(path = "/readFinishNovel",produces="text/html;charset=utf-8")
    @ResponseBody
    public String readFinishNovel(Integer novelId){
        Boolean flag = authorMyNovelService.readFinishNovel(novelId);
        if(flag){
            return "完结小说成功！";
        }else {
            return "完结小说失败！";
        }
    }

    /*点击续载的时候的服务*/
    @RequestMapping(path = "/continuedNovel",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    @ResponseBody
    public String continuedNovel(Integer novelId,MultipartFile uplodNovel){
        Boolean ok = authorMyNovelService.continuedNovel(novelId, uplodNovel);
        if(ok){
            return "续载成功！";
        }else {
            return "续载失败！";
        }
    }
}
