package ru.etu.sapr.mvc.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import java.util.List;
import ru.etu.sapr.mvc.util.HibernateUtil;
import ru.etu.sapr.mvc.model.Message;

/**
 * Created by Red on 21.12.2016.
 */
public class MessageDaoImpl implements MessageDao {
    private static final String FROM_MESSAGE = "from Message";

    public List<Message> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery(FROM_MESSAGE);
        List<Message> list = (List<Message>) q.list();
        session.getTransaction().commit();
        return list;
    }

    public Message getById(int id) {
        return null;
    }

    public void update(Message message) {

    }
    public void delete(Message message) {

    }

    public void create(Message message) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(message);
        session.getTransaction().commit();
    }
}
