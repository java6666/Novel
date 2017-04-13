package controller.author_page;

import model.dao.AuthorDao;
import model.dao.UserInfoEntityDao;
import model.entity.author.Author;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import model.service.author.UpdateAuthorInfo;
import model.service.updateUserInfo.UpdateUserInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;



/**
 * Created by HKB on 2017/4/12.
 */
@Controller
public class AuthorInfo {
    @Resource
    private AuthorDao authorDao;
    @Resource
    private UserInfoEntityDao userInfoEntityDao;
    @RequestMapping(value = "/author/info",method = RequestMethod.GET)
    public String authorMessage(Model model, HttpSession session,String flag) {
        if (flag!=null){
            if (Integer.parseInt(flag)==0){
                model.addAttribute("modal","<script>$('#myModal7').modal();</script>");
            }else if (Integer.parseInt(flag)==1){
                model.addAttribute("modal","<script>$('#myModal6').modal();</script>");
            }
        }
        UserEntity user = (UserEntity)session.getAttribute("superUser");
        Author author = authorDao.selectAuthorByUserId(user.getId());
        UserInfoEntity userInfo = userInfoEntityDao.selectUserInfoByUserId(user.getId());
        model.addAttribute("userInfo",userInfo);
        model.addAttribute("author",author);
        return "/WEB-INF/author_center/author_info.jsp";
    }



    @RequestMapping(value = "/author/update",method = RequestMethod.POST)
    public String updateAuthorMessage(@RequestParam("alice") MultipartFile file, HttpSession session,
                                      String realName, Integer phone, Boolean sex,
                                      String birthday, String birthplace, String introduction){
        /*UserEntity user = (UserEntity)session.getAttribute("superUser");*/
        UserEntity user = (UserEntity)session.getAttribute("superUser");
        UserInfoEntity userInfo = userInfoEntityDao.selectUserInfoByUserId(user.getId());
        UpdateAuthorInfo authorInfo=new UpdateAuthorInfo();
        UpdateUserInfo userInfo1=new UpdateUserInfo();
        userInfo1.updateUserInfo(file, userInfoEntityDao,realName, phone, sex, user,session);
        authorInfo.updateAuthorInfo(authorDao,birthday,birthplace,introduction,userInfo);
        return "redirect:/author/info";
    }
}

