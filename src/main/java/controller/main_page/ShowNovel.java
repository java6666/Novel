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
        PageHelper.startPage(currentPage,3);
        NovelEntity novelEntity = novelEntityDao.novelLatestChapterById(novelId);

        List<NovelComment> novelComments = novelCommentDao.selectByNovelId(novelId);
        PageInfo<NovelComment> novelCommentPageInfo = new PageInfo<>(novelComments);
        PageInfo<Object> pageInfo = new PageInfo<>();
        return objects;
    }
}
