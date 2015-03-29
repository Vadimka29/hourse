package ua.com.iweb.enteties;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by vanya on 22.03.15.
 */
@Entity
@Table(name = "hourse_order", schema = "", catalog = "hourse")
public class HourseOrderEntity {
    private int orderId;
    private String orderPhoto;
    private String orderPhone;
    private Date orderDate;
    private String orderDescription;
    private String orderType;
    private String orderTitle;
    private String orderAuthor;
    private String orderSmallDescription;

    @Id
    @Column(name = "order_id")
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "order_photo")
    public String getOrderPhoto() {
        return orderPhoto;
    }

    public void setOrderPhoto(String orderPhoto) {
        this.orderPhoto = orderPhoto;
    }

    @Basic
    @Column(name = "order_phone")
    public String getOrderPhone() {
        return orderPhone;
    }

    public void setOrderPhone(String orderPhone) {
        this.orderPhone = orderPhone;
    }

    @Basic
    @Column(name = "order_date")
    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    @Basic
    @Column(name = "order_description")
    public String getOrderDescription() {
        return orderDescription;
    }

    public void setOrderDescription(String orderDescription) {
        this.orderDescription = orderDescription;
    }

    @Basic
    @Column(name = "order_type")
    public String getOrderType() {
        return orderType;
    }

    public void setOrderType(String orderType) {
        this.orderType = orderType;
    }

    @Basic
    @Column(name = "order_title")
    public String getOrderTitle() {
        return orderTitle;
    }

    public void setOrderTitle(String orderTitle) {
        this.orderTitle = orderTitle;
    }

    @Basic
    @Column(name = "order_author")
    public String getOrderAuthor() {
        return orderAuthor;
    }

    public void setOrderAuthor(String orderAuthor) {
        this.orderAuthor = orderAuthor;
    }

    @Basic
    @Column(name = "order_small_description")
    public String getOrderSmallDescription() {
        return orderSmallDescription;
    }

    public void setOrderSmallDescription(String orderSmallDescription) {
        this.orderSmallDescription = orderSmallDescription;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HourseOrderEntity entity = (HourseOrderEntity) o;

        if (orderId != entity.orderId) return false;
        if (orderAuthor != null ? !orderAuthor.equals(entity.orderAuthor) : entity.orderAuthor != null) return false;
        if (orderDate != null ? !orderDate.equals(entity.orderDate) : entity.orderDate != null) return false;
        if (orderDescription != null ? !orderDescription.equals(entity.orderDescription) : entity.orderDescription != null)
            return false;
        if (orderPhone != null ? !orderPhone.equals(entity.orderPhone) : entity.orderPhone != null) return false;
        if (orderPhoto != null ? !orderPhoto.equals(entity.orderPhoto) : entity.orderPhoto != null) return false;
        if (orderSmallDescription != null ? !orderSmallDescription.equals(entity.orderSmallDescription) : entity.orderSmallDescription != null)
            return false;
        if (orderTitle != null ? !orderTitle.equals(entity.orderTitle) : entity.orderTitle != null) return false;
        if (orderType != null ? !orderType.equals(entity.orderType) : entity.orderType != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderId;
        result = 31 * result + (orderPhoto != null ? orderPhoto.hashCode() : 0);
        result = 31 * result + (orderPhone != null ? orderPhone.hashCode() : 0);
        result = 31 * result + (orderDate != null ? orderDate.hashCode() : 0);
        result = 31 * result + (orderDescription != null ? orderDescription.hashCode() : 0);
        result = 31 * result + (orderType != null ? orderType.hashCode() : 0);
        result = 31 * result + (orderTitle != null ? orderTitle.hashCode() : 0);
        result = 31 * result + (orderAuthor != null ? orderAuthor.hashCode() : 0);
        result = 31 * result + (orderSmallDescription != null ? orderSmallDescription.hashCode() : 0);
        return result;
    }
}
