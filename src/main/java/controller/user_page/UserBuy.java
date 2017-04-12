package controller.user_page;

import model.dao.NovelEntityDao;
import model.dao.NovelUserBuyDao;
import model.dao.UserInfoEntityDao;
import model.entity.novel.NovelEntity;
import model.entity.novel.NovelUserBuy;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import util.BuyInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LJ on 2017/4/12.
 */
@Controller
public class UserBuy {

    @Resource
    private UserInfoEntityDao userInfoEntityDao;

    @Resource
    private NovelEntityDao novelEntityDao;
    @Resource
    NovelUserBuyDao novelUserBuyDao;
    @RequestMapping(path = "/user/buy",method = RequestMethod.GET)
    public String userBuy(HttpSession session, Model model){
        UserEntity user = (UserEntity)session.getAttribute("superUser");
        UserInfoEntity userInfo = userInfoEntityDao.selectUserInfoByUserId(user.getId());

        ArrayList<BuyInfo> buyInfos = new ArrayList<>();
        List<NovelUserBuy> novelUserBuys = novelUserBuyDao.selectByUserId(user.getId());
        for (int i=0;i<novelUserBuys.size();i++){
            NovelEntity novelEntity = novelEntityDao.selectById(novelUserBuys.get(i).getNovelId());
            BuyInfo buyInfo = new BuyInfo();
            buyInfo.setId(novelEntity.getId());
            buyInfo.setNovelAuthor(novelEntity.getNovelAuthor());
            buyInfo.setNovelName(novelEntity.getNovelName());
            buyInfo.setCreateDate(novelUserBuys.get(i).getCreateDate());
            buyInfo.setReadNow(novelUserBuys.get(i).getReadNow());

            buyInfos.add(buyInfo);
        }

        model.addAttribute("buyInfos",buyInfos);
        model.addAttribute("userInfo",userInfo);
        return "/WEB-INF/user_center/user_buy.jsp";
    }
}
