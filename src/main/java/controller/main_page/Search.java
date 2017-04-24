package controller.main_page;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
 * Created by Administrator on 2017/4/22 0022.
 */
@Controller
public class Search {
    @Resource
    private NovelEntityDao novelEntityDao;
    @RequestMapping(path = "/searchNovel",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> searchNovel(String currentPage,String words){
        if (currentPage==null){
            PageHelper.startPage(1,10);
        }else {
            PageHelper.startPage(Integer.parseInt(currentPage),10);
        }
        List<NovelEntity> novelEntities=null;
        if (words!=null){
            if (words.isEmpty()){
                novelEntities = novelEntityDao.selectNovelByWords(null);
            }else {
                novelEntities = novelEntityDao.selectNovelByWords(words);
            }
        }else {
            novelEntities = novelEntityDao.selectNovelByWords(null);
        }
        PageInfo pageInfo=new PageInfo<>(novelEntities);
        ArrayList<Object> objects = new ArrayList<>();
        objects.add(novelEntities);
        objects.add(pageInfo);
        return objects;
    }
}
