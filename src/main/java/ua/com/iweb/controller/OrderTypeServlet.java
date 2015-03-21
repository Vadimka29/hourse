package ua.com.iweb.controller;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import ua.com.iweb.config.DaoBeanConfig;
import ua.com.iweb.dao.OrderDAO;
import ua.com.iweb.enteties.HourseOrderEntity;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 19.03.15.
 */
public class OrderTypeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] urlParts = request.getRequestURL().toString().split("/");
        String type = null;
        Integer number = null;
        ApplicationContext context = new AnnotationConfigApplicationContext(DaoBeanConfig.class);
        OrderDAO orderDAO = (OrderDAO) context.getBean("orderDAO");
        if(urlParts.length == 6){
            type = urlParts[urlParts.length - 2];
            number = Integer.parseInt(urlParts[urlParts.length - 1]);
            try {
                List<HourseOrderEntity> list = orderDAO.getByType(type, number);
                request.setAttribute("pageCount", orderDAO.getOrderCountByType(type));
                request.setAttribute("orderType", type);
                request.setAttribute("typeList", list);
                request.setAttribute("is", "true");
            } catch (SQLException e) {
                System.out.println("Can't get by type");
            }
        } else {
            if(urlParts.length == 5){
                try {
                    number = Integer.parseInt(urlParts[urlParts.length - 1]);
                } catch (NumberFormatException e){
                    number = 1;
                }
            } else {
                number = 1;
            }
            try {
                List<HourseOrderEntity> lst = orderDAO.getOrders(number);
                request.setAttribute("pageCount", orderDAO.getOrderCount());
                request.setAttribute("is", "false");
                request.setAttribute("lst", lst);
            } catch (SQLException e) {
                System.out.println("Can't");
            }
        }
        request.getRequestDispatcher("/WEB-INF/views/sale.jsp").forward(request,response);
    }
}
