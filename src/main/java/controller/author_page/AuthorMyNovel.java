package controller.author_page;

import model.dao.NovelCategoryDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lenovo on 2017/4/12.
 */
@Controller
public class AuthorMyNovel {
    @Resource
    private NovelCategoryDao novelCategoryDao;
    @RequestMapping(path = "/newNovel")
    public String myWorks(Model model){
        List<String> typeName = novelCategoryDao.seletAllNovelCategoryName();
        model.addAttribute("typeName",typeName);
        return "/WEB-INF/author-center/author_my_novel.jsp";
    }

    /*创建新书的方法*/
    @RequestMapping(path = "/insertNewNovel",method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
    public String insertNewNovel(String novelName, String novelTypeValue, Integer novelPrice, String novelSummary,
                                 @RequestParam("novelPhoto")MultipartFile novelPhoto){
        System.out.println(novelName+"\t"+novelTypeValue+"\t"+novelPrice+"\t'"+novelSummary);

        return "/WEB-INF/author-center/author_my_novel.jsp";
    }
}
