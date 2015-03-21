package ua.com.iweb.controller;

import org.hibernate.Session;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.UserEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Vadym on 27.02.2015.
 */
@Controller
public class GetControllers {

	@RequestMapping(method = {RequestMethod.GET, RequestMethod.HEAD}, value="/")
	public ModelAndView getIndex(HttpServletResponse response) throws IOException{
		return new ModelAndView("index");
	}

    @RequestMapping(method = RequestMethod.GET, value="/blog/new")
    public ModelAndView getBlogPost(HttpServletResponse response) throws IOException{
        return new ModelAndView("addBlogPost");
    }
    @RequestMapping(method = RequestMethod.GET, value="/order")
    public ModelAndView getOrder(HttpServletResponse response) throws IOException{
        return new ModelAndView("addOrder");
    }
    @RequestMapping(method = RequestMethod.GET, value="/clubs")
    public ModelAndView getClubs(HttpServletResponse response) throws IOException{
        return new ModelAndView("clubs");
    }
    @RequestMapping(method = RequestMethod.GET, value="/gallery")
    public ModelAndView getGallery(HttpServletResponse response) throws IOException{
        return new ModelAndView("gallery");
    }
    @RequestMapping(method = RequestMethod.GET, value="/authorization")
    public ModelAndView getRegister(HttpServletResponse response) throws IOException{
        return new ModelAndView("register");
    }
//    @RequestMapping(method = RequestMethod.GET, value="/sale")
//    public ModelAndView getSale(HttpServletResponse response) throws IOException{
//        return new ModelAndView("sale");
//    }
    @RequestMapping(method = RequestMethod.GET, value="/users")
    @ResponseBody
    public String getUser(HttpServletResponse response) throws IOException{
        Session session = null;
        List<UserEntity> users =  new ArrayList <UserEntity>();
        try {
            session = null;
            session.beginTransaction();
            users = session.createCriteria(UserEntity.class).list();
        } finally {
            if(session != null && session.isOpen()) {
                session.close();
            }
        }
        AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        UserDAO userDAO = (UserDAO) context.getBean(UserDAO.class);
        return "Hello word";
    }
}