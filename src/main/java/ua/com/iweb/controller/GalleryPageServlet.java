package ua.com.iweb.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.GalleryDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by vanya on 24.03.15.
 */
public class GalleryPageServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] urlParts = request.getRequestURL().toString().split("/");
        Integer id = null;
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        GalleryDAO galleryDAO = (GalleryDAO) context.getBean("galleryDAO");
        if(urlParts.length == 5) {
            String idString = urlParts[urlParts.length - 1];
            id = Integer.parseInt(idString);
        } else {
            id = 1;
        }
        try {
            request.setAttribute("photos", galleryDAO.getPhotos(id));
            request.setAttribute("count", galleryDAO.getCount());
        } catch (SQLException e) {
            System.out.println("Can't read photos by id");
        }
        request.getRequestDispatcher("/WEB-INF/views/gallery.jsp").forward(request, response);
    }
}
