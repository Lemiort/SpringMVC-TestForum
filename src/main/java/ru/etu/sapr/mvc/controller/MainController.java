package ru.etu.sapr.mvc.controller;

import org.hibernate.SessionFactory;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.jboss.jandex.Main;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.etu.sapr.mvc.dao.*;
import ru.etu.sapr.mvc.model.Forum;
import ru.etu.sapr.mvc.model.Message;
import ru.etu.sapr.mvc.model.Thread;
import ru.etu.sapr.mvc.model.User;

import javax.jws.soap.SOAPBinding;
import java.util.ArrayList;

@Controller
public class MainController {

    MessageDao messageDao = new MessageDaoImpl();
    UserDao userDao = new UserDaoImpl();
    ThreadDao threadDao = new ThreadDaoImpl();
    //private Forum forum = new Forum();

    public MainController(){
     /*   if(userDao.getAll().size() == 0){
            User temp = new User();
            temp.setName("Ololosh");
            userDao.create(temp);
        }*/

    }

    /*First method on start application*/
    /*Попадаем сюда на старте приложения (см. параметры аннотации и настройки пути после деплоя) */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView();
        //modelAndView.addObject("forumJSP",forum);
        modelAndView.setViewName("index");

        if(threadDao.getAll().size() == 1){
            Thread  temp = new Thread();
            //temp.setTitle("Thread 1");
            //temp.setMessages( new ArrayList<Message>());
            User user = new User();
            user.setName("Azazello");
            Message message = new Message();
            message.setIdUser(user);
            message.setText("1fwqngtkg");
            temp.setMessages(new ArrayList<Message>());
            temp.getMessages().add(message);

            Message message2 = new Message();
            message2.setIdUser(user);
            message2.setText("2fwqngtkg");
            temp.getMessages().add(message2);
            threadDao.create(temp);
        }

        return modelAndView;
    }

    /*как только на index.jsp подтвердится форма
    <spring:form method="post"  modelAttribute="userJSP" action="check-user">,
    то попадем вот сюда
     */
    @RequestMapping(value = "/check-user")
    public ModelAndView checkUser(@ModelAttribute("userJSP") User user) {
        ModelAndView modelAndView = new ModelAndView();

        //имя представления, куда нужно будет перейти
        modelAndView.setViewName("secondPage");

        //записываем в атрибут userJSP (используется на странице *.jsp объект user
        modelAndView.addObject("userJSP", user);

        return modelAndView; //после уйдем на представление, указанное чуть выше, если оно будет найдено.
    }

    @RequestMapping(value = "/thread", method = RequestMethod.GET)
    public ModelAndView viewThread(@ModelAttribute("userJSP") User user,
                                   @RequestParam("id") int id) {
        ModelAndView modelAndView = new ModelAndView();
        //modelAndView.addObject("userJSP", new User());
        //modelAndView.addObject("threadJSP",forum.getThreads().get(0));
        modelAndView.addObject("threadJSP", threadDao.getById(id));
        modelAndView.setViewName("thread");
        return modelAndView;
    }


    @RequestMapping(value = "/messages", method = RequestMethod.GET)
    public ModelAndView viewMessages() {
        ModelAndView modelAndView = new ModelAndView();
        messageDao.getAll().get(0);
        modelAndView.addObject("messagesJSP",messageDao.getAll());
        modelAndView.setViewName("messages");
        return modelAndView;
    }

    @RequestMapping(value = "/messages", method = RequestMethod.POST)
    public ModelAndView postMessages(@RequestParam("text") String text) {
        Message temp = new Message();
        temp.setText(text);
        temp.setIdUser(userDao.getAll().get(0));
        messageDao.create(temp);

        return viewMessages();
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public ModelAndView viewUser() {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("usersJSP",userDao.getAll());
        modelAndView.setViewName("users");
        return modelAndView;
    }

    @RequestMapping(value = "/users", method = RequestMethod.POST)
    public ModelAndView createUser(@RequestParam("nick") String nick) {
        User temp = new User();
        temp.setName(nick);
        userDao.create(temp);

        return viewUser();
    }
}