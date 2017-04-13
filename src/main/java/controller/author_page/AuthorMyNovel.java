package controller.author_page;

import model.dao.NovelCategoryDao;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
