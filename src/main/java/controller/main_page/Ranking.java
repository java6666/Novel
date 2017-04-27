package controller.main_page;

import model.dao.NovelEntityDao;
import model.entity.novel.NovelEntity;
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
public class Ranking {
    @Resource
    private NovelEntityDao novelEntityDao;
    @RequestMapping(path = "/ranking",method = RequestMethod.POST,produces ="application/json;charset=utf-8")
    @ResponseBody
    public List<Object> showRanking() {
        ArrayList<Object> objects = new ArrayList<>();
        List<NovelEntity> novelEntities = novelEntityDao.selectNovelByBuyCount();
        objects.add(1);
        objects.add(2);
        objects.add(novelEntities);
        List<NovelEntity> novelEntities1 = novelEntityDao.selectNovelClickRate();
        objects.add(novelEntities1);
        return objects;
    }
}
