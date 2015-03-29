package ua.com.iweb.controller;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
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
import ua.com.iweb.dao.SliderDAO;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.UserEntity;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Vadym on 27.02.2015.
 */
@Controller
public class GetControllers {

	@RequestMapping(method = {RequestMethod.GET, RequestMethod.HEAD}, value="/")
	public ModelAndView getIndex(HttpServletRequest request,HttpServletResponse response) throws IOException{
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        SliderDAO sliderDAO = (SliderDAO) context.getBean("sliderDAO");
        ModelAndView view = new ModelAndView("/index");
        try {
            view.addObject("sliderPhotos", sliderDAO.getPhotos());
        } catch (SQLException e) {
            System.out.println("I can't load files to slider");
        }
        return view;
	}

    @RequestMapping(method = RequestMethod.GET, value="/order")
    public ModelAndView getOrder(HttpServletResponse response) throws IOException{
        return new ModelAndView("addOrder");
    }
    @RequestMapping(method = RequestMethod.GET, value="/clubs")
    public ModelAndView getClubs(HttpServletResponse response) throws IOException{
        return new ModelAndView("clubs");
    }
    @RequestMapping(method = RequestMethod.GET, value="/authorization")
    public ModelAndView getRegister(HttpServletResponse response) throws IOException{
        return new ModelAndView("register");
    }
    @RequestMapping(method = RequestMethod.GET, value="/about")
    public ModelAndView getAbout(HttpServletResponse response) throws IOException{
        return new ModelAndView("/indexSub/aboutFederation");
    }
    @RequestMapping(method = RequestMethod.GET, value="/sponsors")
    public ModelAndView getSponsors(HttpServletResponse response) throws IOException{
        return new ModelAndView("/indexSub/sponsors");
    }
    @RequestMapping(method = RequestMethod.GET, value="/contacts")
    public ModelAndView getContacts(HttpServletResponse response) throws IOException{
        return new ModelAndView("/indexSub/contacts");
    }
    @RequestMapping(method = RequestMethod.GET, value="/leaders")
    public ModelAndView getleaderPage(HttpServletResponse response) throws IOException{
        return new ModelAndView("/indexSub/leaderPage");
    }
    @RequestMapping(method = RequestMethod.GET, value="/events/calendar")
    public ModelAndView getCalendar(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsCalendar");
    }
    @RequestMapping(method = RequestMethod.GET, value="/events/competitions")
    public ModelAndView getCompetitions(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsCompetitions");
    }
    @RequestMapping(method = RequestMethod.GET, value="/events/results")
    public ModelAndView getResults(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsResults");
    }
    @RequestMapping(method = RequestMethod.GET, value="/events/seminars")
    public ModelAndView getSeminars(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsSeminars");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin")
    public ModelAndView getAdmin(HttpSession session,HttpServletResponse response) throws IOException{
        String user = (String) session.getAttribute("user");
        if((!"admin".equals(user)) || user.isEmpty() || user == null){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/main");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/gallery")
    public ModelAndView getAdminGallery(HttpServletResponse response) throws IOException{
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/gallery");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/slider")
    public ModelAndView getAdminSlider(HttpServletResponse response) throws IOException{
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/slider");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/add_to_blog")
    public ModelAndView getBlogPost(HttpServletResponse response) throws IOException{
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/addToBlog");
    }


}