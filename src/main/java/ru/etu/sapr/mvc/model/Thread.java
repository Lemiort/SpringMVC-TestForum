package ru.etu.sapr.mvc.model;

import org.springframework.stereotype.Component;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by Red on 14.11.2016.
 */
@Component
@Entity
@Table(name = "thread")
public class Thread {
    @Id
    @GeneratedValue
    private int idThread;


    public int getIdThread(){
        return idThread;
    }

    public void setIdThread(int idThread) {
        this.idThread = idThread;
    }

    @OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    private Collection<Message> messages;

    public Collection<Message> getMessages() {
        return messages;
    }

    public void setMessages(Collection<Message> messages) {
        this.messages = messages;
    }
}
