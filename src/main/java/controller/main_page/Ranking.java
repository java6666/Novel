package controller.main_page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/4/24.
 */
@Controller
public class Ranking {
    @RequestMapping(path = "/ranking",method = RequestMethod.POST,produces ="application/json;charset=utf-8")
    public List<Object> showRanking(){
        ArrayList<Object> objects = new ArrayList<>();
        return objects;
    }
}
