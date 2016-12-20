package ru.etu.sapr.mvc.model;

/**
 * Created by Nikita on 20.12.2016.
 */
public class Message {
    private static int messageCounter = 0;
    private int id;

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public Message(){
        id = messageCounter++;
    }

    private String text;

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    private User author;

    public void setAuthor(User author) {
        this.author = author;
    }

    public User getAuthor() {
        return author;
    }
}
