package controller.user_page;

import model.dao.UserEntityDao;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/4/12.
 */
@Controller
public class ChangePassword {
    @Resource
    private UserEntityDao userEntityDao;
    @RequestMapping(path = "/user/updatePassword",method = RequestMethod.POST)
    public String updatePassword(String oldPassword, String newPassword, HttpSession session){
        UserEntity user = (UserEntity)session.getAttribute("superUser");
        Integer flag=-1;
        if (oldPassword.equals(user.getPassword())){
            UserEntity userEntity = new UserEntity();
            userEntity.setPassword(newPassword);
            userEntity.setId(user.getId());
            boolean b = userEntityDao.updateUserByUser(userEntity);
            user.setPassword(newPassword);
            session.setAttribute("superUser",user);
            flag=1;
        }else {
            flag=0;
        }
        return "redirect:/user/mail?flag="+flag;
    }
}
