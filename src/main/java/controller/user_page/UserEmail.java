package controller.user_page;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import model.dao.EmailBoxDao;
import model.dao.UserInfoEntityDao;
import model.entity.other.EmailBox;
import model.entity.user.UserEntity;
import model.entity.user.UserInfoEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/4/11.
 */
@Controller
public class UserEmail {
    @Resource
    private UserInfoEntityDao userInfoEntityDao;
    @Resource
    private EmailBoxDao emailBoxDao;
    @RequestMapping(path = "/user/mail",method = RequestMethod.GET)
    public String userMail(HttpSession session, Model model,String flag){
        UserEntity user1 =(UserEntity) session.getAttribute("superUser");
        UserInfoEntity userInfo = userInfoEntityDao.selectUserInfoByUserId(user1.getId());
        model.addAttribute("userInfo",userInfo);
        UserEntity user =(UserEntity)session.getAttribute("superUser");
        Integer id = user.getId();
        List<EmailBox> emailBoxes = emailBoxDao.selectByInId(id);
        Integer count = emailBoxDao.selectCountByInId(id);
        session.setAttribute("mailCount",count);
        model.addAttribute("list",emailBoxes);
        if (flag!=null){
            if (Integer.parseInt(flag)==1){
                model.addAttribute("modal","<script>$('#myModal5').modal();</script>");
            }
        }
        return "/WEB-INF/user_center/user_mail.jsp";
    }
    @RequestMapping(path = "/user/mail",method = RequestMethod.POST,produces = "application/json;charset=utf-8")
    @ResponseBody
    public List<Object> userMail(String currentPage){
        if (currentPage==null){
            PageHelper.startPage(1,7);
        }else {
            PageHelper.startPage(Integer.parseInt(currentPage),7);
        }
        List<EmailBox> emailBoxes = emailBoxDao.selectByInId(3);
        PageInfo pageInfo = new PageInfo<>(emailBoxes);
        ArrayList<Object> objects = new ArrayList<>();
        objects.add(emailBoxes);
        objects.add(pageInfo);
        return objects;
    }
    @RequestMapping(path = "/user/sendMail",method = RequestMethod.POST)
    public String sendMail(Integer id,String content,HttpSession session){
        EmailBox emailBox = new EmailBox();
        UserEntity superUser = (UserEntity) session.getAttribute("superUser");
        emailBox.setAddresseeId(superUser.getId());
        emailBox.setRecipientsId(id);
        emailBox.setContent(content);
        emailBox.setCreateDate(new Date());
        emailBox.setMailType(1);
        boolean b = emailBoxDao.addMail(emailBox);
        return "redirect:/user/mail?flag=1";
    }
    @RequestMapping(path = "/user/delMail",method = RequestMethod.GET)
    public String delMail(Integer mailId){
        emailBoxDao.delMailById(mailId);
        return "redirect:/user/mail";
    }
}
