package controller.main_page;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import model.dao.NovelCommentDao;
import model.dao.NovelEntityDao;
import model.entity.novel.NovelComment;
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
public class ShowNovel {
    @Resource
    private NovelEntityDao novelEntityDao;

    @Resource
    private NovelCommentDao novelCommentDao;
    @RequestMapping(path = "/showNovel",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> showNovel(Integer currentPage,Integer novelId){
        ArrayList<Object> objects = new ArrayList<>();

        NovelEntity novelEntity = novelEntityDao.novelLatestChapterById(novelId);//小说信息

        String novelType = novelEntity.getNovelType();
        String[] split = novelType.split("/");
        for (int i = 0; i < split.length; i++) {
            split[i]="%"+split[i]+"%";
        }
        List<NovelEntity> novelEntities = novelEntityDao.selectByNovelType(split);
        PageHelper.startPage(currentPage,3);
        List<NovelComment> novelComments = novelCommentDao.selectByNovelId(novelId);//评论集合
        PageInfo<NovelComment> novelCommentPageInfo = new PageInfo<>(novelComments);//分页对象

        objects.add(novelComments);
        objects.add(novelCommentPageInfo);
        objects.add(novelEntity);
        objects.add(novelEntities);
        return objects;
    }
}
