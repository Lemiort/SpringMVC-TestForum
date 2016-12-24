package ru.etu.sapr.mvc.model;
import org.springframework.stereotype.Component;

import javax.persistence.*;

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

    @ManyToOne(cascade = {CascadeType.ALL}, fetch = FetchType.EAGER)
    private User idUser;

    public User getIdUser() {
        return idUser;
    }

    public void setIdUser(User idUser) {
        this.idUser = idUser;
    }
}
