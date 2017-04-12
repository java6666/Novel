package controller.user_page;

import model.dao.AuthorDao;
import model.dao.EmailBoxDao;
import model.entity.author.Author;
import model.entity.other.EmailBox;
import model.entity.user.UserEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/4/12.
 */
@Controller
public class UserUp {
    @Resource
    private AuthorDao authorDao;
    @Resource
    private EmailBoxDao emailBoxDao;
    @RequestMapping(path = "/user/showUpAuthor")
    public String showUpAuthor(){
        return "/WEB-INF/user_center/user_up_author.jsp";
    }
    @RequestMapping(path = "/user/upAuthor",method = RequestMethod.POST)
    public String upAuthor(Integer year, Integer month, Integer day, String penName,
                           String introduce, String address, HttpSession session) throws ParseException {
        Author author = new Author();
        author.setPenName(penName);
        author.setBirthAddress(address);
        author.setCreateDate(new Date());
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr=year+"-"+month+"-"+day;
        Date date = simpleDateFormat.parse(dateStr);
        author.setBirthDate(date);
        author.setAuthorIntroduce(introduce);
        UserEntity user = (UserEntity) session.getAttribute("superUser");
        author.setUserId(user.getId());
        authorDao.addAuthor(author);
        EmailBox emailBox = new EmailBox();
        emailBox.setAddresseeId(user.getId());
        emailBox.setRecipientsId(1);
        emailBox.setContent("普通用户申请升级为作者,请管理员处理");
        emailBox.setCreateDate(new Date());
        emailBoxDao.addMail(emailBox);
        return "redirect:/user/mail";
    }
}
