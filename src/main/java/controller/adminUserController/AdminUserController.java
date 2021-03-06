package controller.adminUserController;

import model.dao.AuthorDao;
import model.dao.EmailBoxDao;
import model.dao.UserEntityDao;
import model.entity.author.Author;
import model.entity.other.EmailBox;
import model.entity.user.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by yz on 2017/4/11.
 * 管理用户
 */
@Controller
public class AdminUserController {
    //用户表dao
    @Resource
    private UserEntityDao userEntityDao;
    //作者详细信息dao
    @Resource
    private AuthorDao authorDao;
    //邮件dao
    @Resource
    private EmailBoxDao emailBoxDao;
    //查看所有用户
    @RequestMapping(value = "/admin/showUsers",method = RequestMethod.GET)
    public String showUsers(Model model){
        List<UserEntity> userEntities = userEntityDao.selectUserEntityAll();
        model.addAttribute("userEntities",userEntities);
        return "/WEB-INF/admin/showUsers.jsp";
    }

    //查看用户详细信息
    @RequestMapping(value = "/admin/showUserDetails",method = RequestMethod.GET,produces = "text/html;charset=UTF-8")
    public String showUserDetails(Model model,Integer id,Integer userType) {
        Author authorInfoDetails = null;
        //判断前台传过来的userType调用相应的方法进行显示相应的内容
        //1为管理员2为作者3为普通用户
        if (userType==1){

        }else if (userType == 2) {
            authorInfoDetails = authorDao.selectAuthorByUserId(id);

        }else if (userType==3){

        }
         model.addAttribute("authorINfoDetails",authorInfoDetails);
         model.addAttribute("userType",id);
        return "/WEB-INF/admin/showUsers.jsp";
    }

}
