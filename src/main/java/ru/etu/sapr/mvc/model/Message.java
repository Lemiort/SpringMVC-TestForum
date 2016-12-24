package ru.etu.sapr.mvc.model;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.Calendar;
import java.util.Comparator;

/**
 * Created by Nikita on 20.12.2016.
 */
@Component
@Entity
@Table(name = "message")
public class Message {
    @Id
    @GeneratedValue
    private int idMessage;

    public int getIdMessage() {
        return idMessage;
    }

    public void setIdMessage(int idMessage) {
        this.idMessage = idMessage;
    }

    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @ManyToOne(cascade = {CascadeType.MERGE}, fetch = FetchType.EAGER)
    private User idUser;

    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }

    private Calendar date_posted;

    public Calendar getDate_posted() {
        return date_posted;
    }

    public void setDate_posted(Calendar date_posted) {
        this.date_posted = date_posted;
    }

    public static final Comparator<Message> COMPARE_BY_DATE = new Comparator<Message>() {
        public int compare(Message m1, Message m2) {
            return m1.getDate_posted().compareTo(m2.getDate_posted());
        }
    };
}
