package controller.user_page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by LJ on 2017/4/11.
 */
@Controller
public class UserInfo {

    @RequestMapping(path = "/userInfo",method = RequestMethod.GET)
    public String userInfo(){
        return "";
    }
}
