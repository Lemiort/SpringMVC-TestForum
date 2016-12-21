package ru.etu.sapr.mvc.dao;

import ru.etu.sapr.mvc.model.Message;

import java.util.List;

/**
 * Created by Red on 21.12.2016.
 */
public interface MessageDao {
    List<Message> getAll();

    Message getById(int id);

    void update(Message message);

    void delete(Message message);

    void create(Message message);
}
