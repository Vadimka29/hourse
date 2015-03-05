package ua.com.iweb.enteties;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by root on 05.03.15.
 */
@Entity
@Table(name = "hourse_order", schema = "", catalog = "hourse")
public class HourseOrderEntity {
    private int orderId;
    private String orderName;
    private String orderPhoto;
    private String orderPhone;
    private Date orderDate;
    private String orderDescription;

    @Id
    @Column(name = "order_id")
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    @Basic
    @Column(name = "order_name")
    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HourseOrderEntity that = (HourseOrderEntity) o;

        if (orderId != that.orderId) return false;
        if (orderDate != null ? !orderDate.equals(that.orderDate) : that.orderDate != null) return false;
        if (orderDescription != null ? !orderDescription.equals(that.orderDescription) : that.orderDescription != null)
            return false;
        if (orderName != null ? !orderName.equals(that.orderName) : that.orderName != null) return false;
        if (orderPhone != null ? !orderPhone.equals(that.orderPhone) : that.orderPhone != null) return false;
        if (orderPhoto != null ? !orderPhoto.equals(that.orderPhoto) : that.orderPhoto != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = orderId;
        result = 31 * result + (orderName != null ? orderName.hashCode() : 0);
        result = 31 * result + (orderPhoto != null ? orderPhoto.hashCode() : 0);
        result = 31 * result + (orderPhone != null ? orderPhone.hashCode() : 0);
        result = 31 * result + (orderDate != null ? orderDate.hashCode() : 0);
        result = 31 * result + (orderDescription != null ? orderDescription.hashCode() : 0);
        return result;
    }
}
