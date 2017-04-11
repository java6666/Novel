package controller.user_page;

import model.dao.EmailBoxDao;
import model.entity.other.EmailBox;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2017/4/11.
 */
@Controller
public class UserEmail {
    @Resource
    EmailBoxDao emailBoxDao;
    @RequestMapping("/user/mail")
    public String userMail(HttpSession session, Model model){
        UserEntity user =(UserEntity)session.getAttribute("superUser");
        Integer id = user.getId();
        List<EmailBox> emailBoxes = emailBoxDao.selectByInId(id);
        Integer count = emailBoxDao.selectCountByInId(id);
        model.addAttribute("count",count);
        model.addAttribute("list",emailBoxes);
        return "/WEB-INF/user_center/user_mail.jsp";
    }
}
