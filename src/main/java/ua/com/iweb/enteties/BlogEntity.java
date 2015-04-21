package ua.com.iweb.enteties;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by vanya on 01.04.15.
 */
@Entity
@Table(name = "blog", schema = "", catalog = "hourse")
public class BlogEntity {
    private int messageId;
    private Date messageDate;
    private String messageBody;
    private String imageUrl;
    private String messageTittle;
    private String messageSmallDescription;
    private String messageType;

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
    @Column(name = "message_body")
    public String getMessageBody() {
        return messageBody;
    }

    public void setMessageBody(String messageBody) {
        this.messageBody = messageBody;
    }

    @Basic
    @Column(name = "image_url")
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Basic
    @Column(name = "message_tittle")
    public String getMessageTittle() {
        return messageTittle;
    }

    public void setMessageTittle(String messageTittle) {
        this.messageTittle = messageTittle;
    }

    @Basic
    @Column(name = "messageSmallDescription")
    public String getMessageSmallDescription() {
        return messageSmallDescription;
    }

    public void setMessageSmallDescription(String messageSmallDescription) {
        this.messageSmallDescription = messageSmallDescription;
    }

    @Basic
    @Column(name = "message_type")
    public String getMessageType() {
        return messageType;
    }

    public void setMessageType(String messageType) {
        this.messageType = messageType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        BlogEntity entity = (BlogEntity) o;

        if (messageId != entity.messageId) return false;
        if (imageUrl != null ? !imageUrl.equals(entity.imageUrl) : entity.imageUrl != null) return false;
        if (messageBody != null ? !messageBody.equals(entity.messageBody) : entity.messageBody != null) return false;
        if (messageDate != null ? !messageDate.equals(entity.messageDate) : entity.messageDate != null) return false;
        if (messageSmallDescription != null ? !messageSmallDescription.equals(entity.messageSmallDescription) : entity.messageSmallDescription != null)
            return false;
        if (messageTittle != null ? !messageTittle.equals(entity.messageTittle) : entity.messageTittle != null)
            return false;
        if (messageType != null ? !messageType.equals(entity.messageType) : entity.messageType != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = messageId;
        result = 31 * result + (messageDate != null ? messageDate.hashCode() : 0);
        result = 31 * result + (messageBody != null ? messageBody.hashCode() : 0);
        result = 31 * result + (imageUrl != null ? imageUrl.hashCode() : 0);
        result = 31 * result + (messageTittle != null ? messageTittle.hashCode() : 0);
        result = 31 * result + (messageSmallDescription != null ? messageSmallDescription.hashCode() : 0);
        result = 31 * result + (messageType != null ? messageType.hashCode() : 0);
        return result;
    }
}
