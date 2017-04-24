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
public class ShowNovel {
    @Resource
    private NovelEntityDao novelEntityDao;
    @RequestMapping(path = "/showNovel",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> showNovel(String currentPage,Integer novelId){
        ArrayList<Object> objects = new ArrayList<>();
        return objects;
    }
}
