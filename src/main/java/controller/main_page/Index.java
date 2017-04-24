package controller.main_page;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import model.dao.AuthorDao;
import model.dao.NovelEntityDao;
import model.entity.novel.NovelEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/20.
 */
@Controller
public class Index {
    @Resource
    private NovelEntityDao novelEntityDao;
    @RequestMapping(path = "/main",method = RequestMethod.GET)
    public String main(Model model){
        List<NovelEntity> novelEntities = novelEntityDao.selectNovelByClick();
        model.addAttribute("clickNovel",novelEntities);
        return "/WEB-INF/main_page/index.jsp";
    }
    @RequestMapping(path = "/main",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> getNovel(String currentPage){
        if (currentPage==null){
            PageHelper.startPage(1,3);
        }else {
            PageHelper.startPage(Integer.parseInt(currentPage),3);
        }
        List<NovelEntity> novelEntities = novelEntityDao.selectNovelByPage();
        PageInfo pageInfo = new PageInfo<>(novelEntities);
        ArrayList<Object> objects = new ArrayList<>();
        objects.add(novelEntities);
        objects.add(pageInfo);
        return objects;
    }
}
