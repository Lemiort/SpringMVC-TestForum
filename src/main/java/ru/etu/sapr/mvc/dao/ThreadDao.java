package ru.etu.sapr.mvc.dao;

import ru.etu.sapr.mvc.model.Thread;

import java.util.List;

/**
 * Created by Red on 24.12.2016.
 */
public interface ThreadDao {
    List<Thread> getAll();

    Thread getById(int id);

    void update(Thread thread);

    void delete(Thread thread);

    void create(Thread thread);
}
