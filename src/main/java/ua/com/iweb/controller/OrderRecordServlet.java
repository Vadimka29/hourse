package ua.com.iweb.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.OrderDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by vanya on 20.03.15.
 */
public class OrderRecordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //sale/post/id - path
        String[] urlParts = request.getRequestURL().toString().split("/");
        Integer id = null;
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        OrderDAO orderDAO = (OrderDAO) context.getBean("orderDAO");
        if(urlParts.length == 6) {
            String idString = urlParts[urlParts.length - 1];
            try {
                request.setAttribute("post", orderDAO.getOrderById(Integer.parseInt(idString)));
            } catch (SQLException e) {
                System.out.println("Can't read orderRecord by id");
            }
        }
        request.getRequestDispatcher("/WEB-INF/views/order_post_page.jsp").forward(request, response);
    }
}
