package ua.com.iweb.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Vadym on 27.02.2015.
 */
@Controller
public class GetControllers {

	@RequestMapping(method = RequestMethod.GET, value="/")
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
    @RequestMapping(method = RequestMethod.GET, value="/register")
    public ModelAndView getRegister(HttpServletResponse response) throws IOException{
        return new ModelAndView("register");
    }
    @RequestMapping(method = RequestMethod.GET, value="/sale")
    public ModelAndView getSale(HttpServletResponse response) throws IOException{
        return new ModelAndView("sale");
    }

}