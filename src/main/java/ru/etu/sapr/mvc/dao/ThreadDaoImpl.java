package ru.etu.sapr.mvc.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import ru.etu.sapr.mvc.model.Thread;
import ru.etu.sapr.mvc.util.HibernateUtil;

import java.util.List;

/**
 * Created by Red on 24.12.2016.
 */
public class ThreadDaoImpl implements ThreadDao{
    private static final String FROM_THREAD = "from Thread";

    public List<Thread> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery(FROM_THREAD);
        List<Thread> list = (List<Thread>) q.list();
        session.getTransaction().commit();
        //session.close();
        return list;
    }

    public Thread getById(int id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Thread thread =  (Thread) session.get(Thread.class, id);
        session.getTransaction().commit();
        //session.close();
        return thread;
    }

    public void update(Thread thread) {

    }
    public void delete(Thread thread) {

    }

    public void create(Thread thread) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(thread);
        session.getTransaction().commit();
    }
}
