package ua.com.iweb.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GetControllers {

	@RequestMapping(value="/")
	public ModelAndView getIndex(HttpServletResponse response) throws IOException{
        //comment
		return new ModelAndView("index");
	}
}