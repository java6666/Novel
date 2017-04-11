package controller.main_page;

import model.dao.UserEntityDao;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/4/11.
 */
@Controller
public class Login {
    @Resource
    UserEntityDao userEntityDao;
    @RequestMapping(path = "/main",method = RequestMethod.GET)
    public String main(){
        return "/WEB-INF/main_page/index.jsp";
    }
    @RequestMapping(path = "/login",method = RequestMethod.POST)
    public String login(String username, String password, HttpSession session, Model model){
        UserEntity userEntity = new UserEntity();
        userEntity.setUserName(username);
        userEntity.setPassword(password);
        UserEntity user = userEntityDao.selectUserByUser(userEntity);
        if (user==null){
            model.addAttribute("message","账号密码不匹配！");
        }else {
            session.setAttribute("superUser",user);
        }
        return "/WEB-INF/main_page/index.jsp";
    }

    @RequestMapping(path = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();//把session销毁
        return "/WEB-INF/main_page/index.jsp";
    }
}
