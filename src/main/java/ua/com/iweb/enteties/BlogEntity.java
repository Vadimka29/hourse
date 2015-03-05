package ua.com.iweb.enteties;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by root on 05.03.15.
 */
@Entity
@Table(name = "blog", schema = "", catalog = "hourse")
public class BlogEntity {
    private int messageId;
    private Date messageDate;
    private String messageBidy;

    @Id
    @Column(name = "message_id")
    public int getMessageId() {
        return messageId;
    }

    public void setMessageId(int messageId) {
        this.messageId = messageId;
    }

    @Basic
    @Column(name = "message_date")
    public Date getMessageDate() {
        return messageDate;
    }

    public void setMessageDate(Date messageDate) {
        this.messageDate = messageDate;
    }

    @Basic
    @Column(name = "message_bidy")
    public String getMessageBidy() {
        return messageBidy;
    }

    public void setMessageBidy(String messageBidy) {
        this.messageBidy = messageBidy;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BlogEntity that = (BlogEntity) o;

        if (messageId != that.messageId) return false;
        if (messageBidy != null ? !messageBidy.equals(that.messageBidy) : that.messageBidy != null) return false;
        if (messageDate != null ? !messageDate.equals(that.messageDate) : that.messageDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = messageId;
        result = 31 * result + (messageDate != null ? messageDate.hashCode() : 0);
        result = 31 * result + (messageBidy != null ? messageBidy.hashCode() : 0);
        return result;
    }
}
