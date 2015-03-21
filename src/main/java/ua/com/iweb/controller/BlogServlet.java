package ua.com.iweb.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

/**
 * Created by vanya on 19.03.15.
 */
public class BlogServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] urlParts = request.getRequestURL().toString().split("/");
        System.out.println(urlParts.length);
        System.out.println(Arrays.toString(urlParts));
        if(urlParts.length == 5){
            String number = urlParts[urlParts.length - 1];
            request.setAttribute("pageNumber", number);
        }
        request.getRequestDispatcher("/WEB-INF/views/blog.jsp").forward(request, response);
    }
}
