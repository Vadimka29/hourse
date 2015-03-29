package ua.com.iweb.controller.fileupload;

import org.codehaus.jackson.map.ObjectMapper;
import org.hibernate.annotations.SourceType;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ua.com.iweb.helpfull.Login;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;

/**
 * Created by vanya on 29.03.15.
 */
@Controller
public class UploadController {
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(value = "/file/upload", method = RequestMethod.POST, produces = "text/plain")
    public @ResponseBody String uploadImage(HttpServletRequest request, @RequestBody final String json) throws IOException{
        final String PATH = "/home/vanya/Projects/iweb/hourse/target/hourse/resources/useruploads";
        System.out.println("Path : " + PATH);
//        if(json != null || !json.isEmpty()) {
//            String data = URLDecoder.decode(json.substring(0, json.length() - 1), "utf-8");
//            System.out.println("data: " + data);
//            ObjectMapper mapper = new ObjectMapper();
//            UploadEntity entity = mapper.readValue(data.getBytes(), UploadEntity.class);
//            System.out.println("Dir: " + entity.getDir());
//            File f = new File(PATH + "/" + entity.getDir().hashCode());
//            if (!f.exists()) {
//                f.mkdir();
//            }
//            System.out.println("Exitst: " + f.exists());
//        }
        return "Hello";
    }
}
