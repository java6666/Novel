package controller.author_page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by lenovo on 2017/4/12.
 */
@Controller
public class AuthorMyNovel {
    @RequestMapping(path = "/newNovel")
    public String myWorks(){
        return "/WEB-INF/author-center/author_my_novel.jsp";
    }
}
