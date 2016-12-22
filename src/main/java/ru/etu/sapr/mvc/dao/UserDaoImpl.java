package ru.etu.sapr.mvc.dao;

import ru.etu.sapr.mvc.model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import ru.etu.sapr.mvc.util.HibernateUtil;
import java.util.List;


/**
 * Created by Nikita on 22.12.2016.
 */
public class UserDaoImpl implements UserDao {
    private static final String FROM_USER = "from User";

    public List<User> getAll() {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery(FROM_USER);
        List<User> list = (List<User>) q.list();
        session.getTransaction().commit();
        //session.close();
        return list;
    }

    public User getById(int id) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        Query q = session.createQuery("from User where  idUser ="+id);
        List<User> list = (List<User>) q.list();
        session.getTransaction().commit();
        //session.close();
        return list.get(0);
    }

    public void update(User user) {

    }
    public void delete(User user) {

    }

    public void create(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
    }
}
