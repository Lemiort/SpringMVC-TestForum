package ru.etu.sapr.mvc.controller;

import org.hibernate.SessionFactory;
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
import ru.etu.sapr.mvc.dao.MessageDao;
import ru.etu.sapr.mvc.dao.MessageDaoImpl;
import ru.etu.sapr.mvc.model.Forum;
import ru.etu.sapr.mvc.model.Message;
import ru.etu.sapr.mvc.model.User;

@Controller
public class MainController {

    MessageDao messageDao = new MessageDaoImpl();
    //private Forum forum = new Forum();

    /*First method on start application*/
    /*Попадаем сюда на старте приложения (см. параметры аннотации и настройки пути после деплоя) */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main() {
        ModelAndView modelAndView = new ModelAndView();
        //modelAndView.addObject("forumJSP",forum);
        modelAndView.setViewName("index");
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
        modelAndView.addObject("threadId", id);
        modelAndView.setViewName("thread");
        return modelAndView;
    }


    @RequestMapping(value = "/messages", method = RequestMethod.GET)
    public ModelAndView viewMessages() {
        ModelAndView modelAndView = new ModelAndView();
        /*if(messageDao.getAll().size() == 0) {
            Message temp = new Message();
            temp.setText("rgewgegwg");
            messageDao.create(temp);
        }*/
        modelAndView.addObject("messagesJSP",messageDao.getAll());
        modelAndView.setViewName("messages");
        return modelAndView;
    }
}