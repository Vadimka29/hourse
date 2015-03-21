package ua.com.iweb.dao;

import ua.com.iweb.enteties.BlogEntity;
import ua.com.iweb.enteties.HourseOrderEntity;

import java.sql.SQLException;
import java.util.List;

/**
 * Created by vanya on 18.03.15.
 */
public interface BlogDAOInterface {
    public boolean addPost(BlogEntity entity) throws SQLException;
    public List<BlogEntity> getPosts(int countIndex) throws SQLException;
    public int getCount() throws SQLException;
    public BlogEntity getBlogById(int id) throws SQLException;
}
