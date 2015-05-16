package ua.com.iweb.controller;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.UserEntity;
import ua.com.iweb.helpfull.Login;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
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
    @ResponseStatus(HttpStatus.OK)
    @RequestMapping(method = RequestMethod.POST, value="/login_post")
    public @ResponseBody String login(HttpServletRequest request, HttpServletResponse response,HttpSession session, @RequestBody String json) throws IOException {
        String data = URLDecoder.decode(json.substring(0,json.length()-1),"utf-8");
        ObjectMapper mapper = new ObjectMapper();
        Login login = mapper.readValue(data.getBytes(),Login.class);
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        UserDAO userDAO = (UserDAO) context.getBean("userDAO");
        System.out.println("password: " + login.getPassword());
        final String unregistered = "unregistered";
        try {
            if (userDAO.authorizationCheck(login)) {
                session.setAttribute("user", login.getLogin());
                System.out.println(session.getAttribute("user"));
                Cookie cookie = new Cookie("isAuth", login.getLogin());
                System.out.println("cookie: " + cookie.getValue());
                response.addCookie(cookie);
                request.getSession(true).setAttribute("CKFinder_UserRole", "admin");
                System.out.println("login: " + login.getLogin());
                return "true";
            } else {
                session.setAttribute("user", unregistered);
                System.out.println(session.getAttribute("user"));
                Cookie cookie = new Cookie("isAuth",unregistered);
                System.out.println("cookie: " + cookie.getValue());
                response.addCookie(cookie);
                return "false";
            }
        } catch (SQLException e){
            session.setAttribute("user", unregistered);
            System.out.println(session.getAttribute("user"));
            return "false";
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