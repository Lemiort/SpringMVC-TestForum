package ru.etu.sapr.mvc.test;

import org.hibernate.Query;
import org.hibernate.Session;
import ru.etu.sapr.mvc.model.Message;
import ru.etu.sapr.mvc.util.HibernateUtil;

import java.util.List;

/**
 * Created by Red on 21.12.2016.
 */
public class SimpleTest {
    //private static final String FROM_MESSAGE = "from Message";
    public static void main(String[] args) throws Exception {

        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        session.beginTransaction();
       /* Query q = session.createQuery(FROM_MESSAGE);
        List<Message> list = (List<Message>) q.list();
        session.getTransaction().commit();*/
    }
}
