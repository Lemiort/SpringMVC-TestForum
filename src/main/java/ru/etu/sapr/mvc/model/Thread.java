package ru.etu.sapr.mvc.model;

import org.hibernate.annotations.*;
import org.hibernate.annotations.OrderBy;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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

    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIdThread(){
        return idThread;
    }

    public void setIdThread(int idThread) {
        this.idThread = idThread;
    }

    @OneToMany(cascade = {CascadeType.ALL},fetch = FetchType.EAGER)
    private List<Message> messages;

    public List<Message> getMessages() {
        return messages;
    }

    public void setMessages(List<Message> messages) {
        this.messages = messages;
    }

    public void deleteMessageById(int messageId){
        for(int i=0; i< messages.size();i++){
            if(messages.get(i).getIdMessage() == messageId){
                this.messages.remove(i);
            break;
            }
        }
    }

    public Message getMessageById(int idMessage){
        for(int i=0; i< messages.size();i++){
            if(messages.get(i).getIdMessage() == idMessage){
                return messages.get(i);
            }
        }
        return  null;
    }
}
