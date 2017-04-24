package controller.main_page;

import com.google.code.kaptcha.Producer;
import model.dao.UserEntityDao;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by Administrator on 2017/4/11.
 */
@Controller
public class Login {
    @Resource
    private Producer producer;
    @Resource
    private UserEntityDao userEntityDao;
    @RequestMapping(path = "/login",method = RequestMethod.POST)
    public String login(String code,String username, String password, HttpSession session, Model model){
        UserEntity userEntity = new UserEntity();
        userEntity.setUserName(username);
        userEntity.setPassword(password);
        UserEntity user = userEntityDao.selectUserByUser(userEntity);
        String code1 = (String) session.getAttribute("code");
        if (user==null){
            session.setAttribute("message","账号密码不匹配！");
        }else if (!code.equals(code1)){
            session.setAttribute("message","验证码错误！");
        } else {
            session.setAttribute("superUser",user);
            session.removeAttribute("message");
        }
        return "redirect:/main";
    }

    @RequestMapping(path = "/logout",method = RequestMethod.GET)
    public String logout(HttpSession session){
        session.invalidate();//把session销毁
        return "/main";
    }
    @RequestMapping(path = "/code.jpg")
    @ResponseBody
    public void getCodeImg(HttpSession session, HttpServletResponse resp) throws IOException {
        //响应headers设置
        // Set to expire far in the past.
        resp.setDateHeader("Expires", 0);
        // Set standard HTTP/1.1 no-cache headers.
        resp.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
        resp.addHeader("Cache-Control", "post-check=0, pre-check=0");
        // Set standard HTTP/1.0 no-cache header.
        resp.setHeader("Pragma", "no-cache");
        // 设置响应图片类型为jpg
        resp.setContentType("image/jpeg");
  /*      前面是图片流响应格式设置*/

        // 生成随机验证字符
        String capText = producer.createText();
        // 存储字符到session
        session.setAttribute("code", capText);
        // 生成带该字符的图片流
        BufferedImage bi = producer.createImage(capText);
        //生成response输出流
        ServletOutputStream out = resp.getOutputStream();
        // 已图片流输出
        ImageIO.write(bi, "jpg", out);
        try {
            out.flush();
        } finally {
            out.close();
        }
    }
}
