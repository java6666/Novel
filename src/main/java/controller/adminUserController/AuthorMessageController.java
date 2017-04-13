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
 * 处理作者申请消息
 */
@Controller
public class AuthorMessageController {
    //用户表dao
    @Resource
    private UserEntityDao userEntityDao;
    //作者详细信息dao
    @Resource
    private AuthorDao authorDao;
    //邮件dao
    @Resource
    private EmailBoxDao emailBoxDao;
    //查看作者申请
    @RequestMapping(value = "/admin/showApplication",method = RequestMethod.GET)
    public String showApplication(Model model){
        EmailBox emailBox = new EmailBox();
        emailBox.setRecipientsId(1);
        emailBox.setMailType(2);
        List<EmailBox> emailBoxes = emailBoxDao.selectEmailTypeByEmailBox(emailBox);
        Integer emailCount = emailBoxDao.selectEmailTypeCountByEmailBox(emailBox);
        model.addAttribute("emailBoxes",emailBoxes);
        model.addAttribute("emailCount",emailCount);
        return "/WEB-INF/admin/processingApplication.jsp";
    }

    //接收到消息后根据id通过请求操作并删除对应邮件
    @RequestMapping(value = "/admin/applicationApproved",method = RequestMethod.GET)
    public String applicationApproved(Model model,Integer addresseeId,Integer id){
        userEntityDao.updateUserEntityByUserId(addresseeId);
        emailBoxDao.delMailById(id);
        return "redirect:/admin/showApplication";
    }
    //接收到消息后根据id驳回请求操作并删除Author中相关信息
    @RequestMapping(value = "/admin/rejectTheRequest",method = RequestMethod.GET)
    public String rejectTheRequest(Model model,Integer addresseeId,Integer id){
        authorDao.deleteAuthorInfoByUserId(addresseeId);
        emailBoxDao.delMailById(id);
        return "redirect:/admin/showApplication";
    }
}
