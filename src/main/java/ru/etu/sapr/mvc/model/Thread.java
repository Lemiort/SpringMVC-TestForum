package ru.etu.sapr.mvc.model;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.Date;

/**
 * Created by Red on 14.11.2016.
 */
@Component
public class Thread {
    private String title;
    private Date timeCreated;
    private Date timeUpdated;
    private User creator;
    private User lastUser;
    private int id;
    private ArrayList<Message> messages;

    static int globalThreadCounter = 0;

    public int getId(){
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Thread(){
        id = globalThreadCounter++;
        messages = new ArrayList<Message>();
        Message tempMessage = new Message();
        tempMessage.setText("jwesglker");
        messages.add(tempMessage);

        tempMessage = new Message();
        tempMessage.setText("gjugygjfyjjyh");

        messages.add(tempMessage);
    }

    public String getTitle(){
        return title;
    }

    public void setTitle(String str){
        title = str;
    }

    public Date getTimeCreated(){
        return timeCreated;
    }

    public void setTimeCreated(Date date){
        timeCreated = date;
    }

    public Date getTimeUpdated(){
        return  timeUpdated;
    }

    public void setTimeUpdated(Date date){
        timeUpdated = date;
    }

    public User getCreator(){
        return  creator;
    }

    public void setCreator(User user){
        creator = user;
    }

    public User getLastUser(){
        return  lastUser;
    }

    public void setLastUser(User user)
    {
        lastUser = user;
    }

    public ArrayList<Message> getMessages() {
        return messages;
    }

    public void setMessages(ArrayList<Message> messages) {
        this.messages = messages;
    }
}
