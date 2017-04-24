package controller.main_page;

import model.dao.NovelEntityDao;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/24.
 */
@Controller
public class ShowAuthor {
    @Resource
    private NovelEntityDao novelEntityDao;
    @RequestMapping(path = "/showAuthor",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> showAuthor(Integer authorId){
        ArrayList<Object> objects = new ArrayList<>();
        return objects;
    }
}
