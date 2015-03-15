package ua.com.iweb.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLDecoder;
import java.sql.SQLException;

/**
 * Created by Vadym on 05.03.15.
 */
@Controller
public class AuthorizationController {
    @RequestMapping(method = RequestMethod.POST, value="/login_post")
    public @ResponseBody String login(HttpServletResponse response,HttpSession session, @RequestBody String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0,json.length()-1),"utf-8");
        ObjectMapper mapper = new ObjectMapper();
        Login login = mapper.readValue(data.getBytes(),Login.class);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        UserDAO userDAO = (UserDAO) context.getBean("userDAO");
        System.out.println(login.getPassword());
        final String unregistered = "unregistered";
        try {
            if (userDAO.authorizationCheck(login)) {
                session.setAttribute("user", login.getLogin());
                System.out.println(session.getAttribute("user"));
                return login.getLogin();
            } else {
                session.setAttribute("user", unregistered);
                System.out.println(session.getAttribute("user"));
                return unregistered;
            }
        } catch (SQLException e){
            session.setAttribute("user", unregistered);
            System.out.println(session.getAttribute("user"));
            return unregistered;
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/register_post")
    public void register(HttpServletResponse response, HttpSession session, @RequestBody String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0, json.length()-1), "utf-8");
        System.out.println("data: " + data);
        ObjectMapper mapper = new ObjectMapper();
        UserEntity user = mapper.readValue(data.getBytes(), UserEntity.class);
        System.out.println(user);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        UserDAO userDAO = (UserDAO) context.getBean("userDAO");
        try {
            userDAO.registerUser(user);
        } catch (SQLException e){
            System.out.println("Can't save user!");
        }
    }
}