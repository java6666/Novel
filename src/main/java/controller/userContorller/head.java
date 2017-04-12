package controller.userContorller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

/**
 * Created by HKB on 2017/4/10.
 */
@Controller
public class head {
    @RequestMapping(value = "upload",method = RequestMethod.POST)
    public String Upload(@RequestParam("upload") MultipartFile file) throws IOException {
        if (file.isEmpty()){
            System.out.println("没有文件");
        }else {
            Files.copy(file.getInputStream(),new File("D:/gitWorkSpace/novel/src/main/webapp//images/tomHead.png").toPath());
            Files.copy(file.getInputStream(),new File("D:/gitWorkSpace/novel/target/novel-1.0-SNAPSHOT/images/tomHead.png").toPath());
        }
        return "个人信息模板";
    }
}
