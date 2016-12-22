package ru.etu.sapr.mvc.dao;

import ru.etu.sapr.mvc.model.User;

import java.util.List;

/**
 * Created by Nikita on 22.12.2016.
 */
public interface UserDao {
    List<User> getAll();

    User getById(int id);

    void update(User user);

    void delete(User user);

    void create(User user);
}
