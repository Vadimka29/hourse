package ua.com.iweb.dao;

import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.HourseOrderEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 18.03.15.
 */
public interface BlogDAOInterface {
    void addPost(BlogEntity entity) throws SQLException;
    List<BlogEntity> getPosts(int countIndex, String type) throws SQLException;
    int getCount() throws SQLException;
    int getCount(String type) throws SQLException;
    BlogEntity getBlogById(int id) throws SQLException;
}
