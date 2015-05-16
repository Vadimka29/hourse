package ua.com.iweb.controller;

import org.hibernate.Session;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.io.IOUtils;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.config.ServicePath;
import ua.com.iweb.dao.EventDAO;
import ua.com.iweb.dao.GalleryDAO;
import ua.com.iweb.dao.SliderDAO;
import ua.com.iweb.dao.UserDAO;
import ua.com.iweb.enteties.EventsEntity;
import ua.com.iweb.enteties.UserEntity;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
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
    public ModelAndView getOrder(HttpServletRequest request) throws IOException{
        String login = null;
        Cookie[] cookies = request.getCookies();
        //if there are not cookies
        if(cookies.length == 0){
            login = (String) request.getSession().getAttribute("user");
        }
        for(int i = 0; i < cookies.length; i++){
            if("isAuth".equals(cookies[i].getName())){
                login = cookies[i].getValue();
            }
        }
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/sale");
        }
        if("unregistered".equals(request.getSession().getAttribute("user"))){
            return new ModelAndView("redirect:/sale");
        }
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
    @RequestMapping(method = RequestMethod.GET, value="/calendar")
    public ModelAndView getCalendar(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsCalendar");
    }
    @RequestMapping(method = RequestMethod.GET, value="/results")
    public ModelAndView getResults(HttpServletResponse response) throws IOException{
        return new ModelAndView("/events/eventsResults");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin")
    public ModelAndView getAdmin(@CookieValue("isAuth") String login, HttpServletRequest request) throws IOException{
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/");
        }
        if("unregistered".equals(request.getSession().getAttribute("user"))){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/main");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/gallery")
    public ModelAndView getAdminGallery(@CookieValue("isAuth") String login) throws IOException{
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/gallery");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/slider")
    public ModelAndView getAdminSlider(@CookieValue("isAuth") String login) throws IOException{
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/slider");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/add_to_blog")
    public ModelAndView getBlogPost(@CookieValue("isAuth") String login) throws IOException{
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/addToBlog");
    }
    @RequestMapping(method = RequestMethod.GET, value="/admin/calendar")
    public ModelAndView getAdminCalendar(@CookieValue("isAuth") String login) throws IOException{
        if((!"admin".equals(login)) || login.isEmpty() || login == null){
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("/admin/startbootstrap-sb-admin-2-1.0.5/pages/calendar");
    }
    @RequestMapping(method = RequestMethod.GET, value ="/logout")
    @ResponseStatus(HttpStatus.OK)
    public ModelAndView logout(HttpSession session, HttpServletResponse response){
        Cookie exitCookie = new Cookie("isAuth", "unregistered");
        response.addCookie(exitCookie);
        session.invalidate();
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(method= RequestMethod.POST, value ="/rest/calendar", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public @ResponseBody List<EventsEntity> getCalendarJson(@RequestBody String body){
        System.out.println(body);
        List<EventsEntity> events = null;
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        EventDAO eventDAO = (EventDAO) context.getBean("eventDAO");
        try {
            events = eventDAO.getAllEvents();
        } catch (SQLException e) {
            System.out.println("Can't read all events");
        }
        return events;
    }
    @RequestMapping(value = "/get-gallery")
    public void getImageFromGallery(HttpServletResponse response, HttpServletRequest request) throws IOException{
        String imageName = request.getParameter("name");
        if(imageName == null){
            return;
        }
        System.out.println("name: " + imageName);
        File image = new File(ServicePath.PATH_TO_GALLERY_IMAGES + "/" + imageName);
        byte[] byteImage = IOUtils.toByteArray(new FileInputStream(image));
        response.getOutputStream().write(byteImage);
    }
    @RequestMapping(value = "/get-slider")
    public void getImageFromSlider(HttpServletResponse response,HttpServletRequest request) throws IOException{
        String imageName = request.getParameter("name");
        if(imageName == null){
            return;
        }
        File image = new File(ServicePath.PATH_TO_SLIDER_IMAGES + "/" + imageName);
        byte[] byteImage = IOUtils.toByteArray(new FileInputStream(image));
        response.getOutputStream().write(byteImage);
    }
    @RequestMapping(value = "/get-postphoto/{userPhoto}")
    public void getImageFromUserPost(HttpServletRequest request, HttpServletResponse response,
                                     @PathVariable String userPhoto) throws IOException{
        String url = request.getRequestURI();
        String[] data = url.split("/");
        String imageName = data[data.length - 1];
        System.out.println("Url: " + url);
        System.out.println("image Name: " + imageName);
        if(imageName == null){
            return;
        }
        File image = new File(ServicePath.PATH_TO_USER_PHOTO + "/" + imageName);
        byte[] byteImage = IOUtils.toByteArray(new FileInputStream(image));
        response.getOutputStream().write(byteImage);
    }

}