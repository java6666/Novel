package controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by lenovo on 2017/4/13.
 */
@Controller
public class TestController {
    @RequestMapping("/list")
    public String  foo(Model model){
        String [] list={"a","b","c"};
        model.addAttribute("list",list);
        return "/WEB-INF/test.jsp";
    }
    @RequestMapping("/fileUp")
    public String  fileUp(@RequestParam MultipartFile file, String name){
        System.out.println(file.getSize());
        String [] list={"a","b","c"};
return "";
    }
}
