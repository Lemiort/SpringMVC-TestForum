package ru.etu.sapr.mvc.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.TransactionException;
import org.hibernate.service.ServiceRegistry;

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
        //session.close();
        return list;
    }

    public Message getById(int id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Message message =  (Message) session.get(Message.class, id);
        session.getTransaction().commit();
        //session.close();
        return message;
    }

    public void update(Message message) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.update(message);
        session.getTransaction().commit();
    }
    public void delete(Message message) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.delete(message);
        session.getTransaction().commit();
    }

    public void create(Message message) {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(message);
            session.getTransaction().commit();
    }
}
