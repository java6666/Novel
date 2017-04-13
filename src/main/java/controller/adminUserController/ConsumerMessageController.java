package controller.adminUserController;

import model.dao.AuthorDao;
import model.dao.EmailBoxDao;
import model.dao.UserEntityDao;
import model.entity.other.EmailBox;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yz on 2017/4/13.
 * 处理普通用户消息
 */
@Controller
public class ConsumerMessageController {
    //用户表dao
    @Resource
    private UserEntityDao userEntityDao;
    //作者详细信息dao
    @Resource
    private AuthorDao authorDao;
    //邮件dao
    @Resource
    private EmailBoxDao emailBoxDao;
    @RequestMapping(value = "/admin/generalInformation",method = RequestMethod.GET)
    public String generalInformation(Model model){
        Integer recipientsId=1;
        Integer mailType=1;
        EmailBox emailBox = new EmailBox();
        emailBox.setRecipientsId(recipientsId);
        emailBox.setMailType(mailType);
        List<EmailBox> emailBoxes = emailBoxDao.selectEmailTypeByEmailBox(emailBox);
        Integer emailCount = emailBoxDao.selectEmailTypeCountByEmailBox(emailBox);
        model.addAttribute("emailBoxes",emailBoxes);
        model.addAttribute("emailCount",emailCount);
        model.addAttribute("mailType",mailType);
        return "/WEB-INF/admin/processingApplication.jsp";
    }

}
