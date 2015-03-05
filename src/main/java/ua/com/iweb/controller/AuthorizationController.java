package ua.com.iweb.controller;

import com.sun.deploy.net.HttpResponse;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.beans.beancontext.BeanContext;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

/**
 * Created by Vadym on 05.03.15.
 */
@Controller
public class AuthorizationController {
    @RequestMapping(method = RequestMethod.POST, value="/login_post")
    public void login(HttpServletResponse response,HttpSession session, @RequestBody String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0,json.length()-1),"utf-8");
        ObjectMapper mapper = new ObjectMapper();
        Login login = mapper.readValue(data.getBytes(),Login.class);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        UserDAO userDAO = (UserDAO) context.getBean("userDAO");
        System.out.println(login.getPassword());
        try {
            if (userDAO.authorizationCheck(login)) {
                session.setAttribute("user", login.getLogin());
            } else {
                session.setAttribute("user", "unregistered");
            }
        } catch (SQLException e){
            session.setAttribute("user", "unregistered");
        }
        System.out.println(session.getAttribute("user"));
    }
}
