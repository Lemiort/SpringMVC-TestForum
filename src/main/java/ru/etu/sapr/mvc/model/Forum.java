package ru.etu.sapr.mvc.model;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.context.Theme;

import java.util.*;

/**
 * Created by Red on 14.11.2016.
 */
@Component
public class Forum {
    public  Forum(){
       /* threads = new ArrayList<Thread>();
        User lemiort = new User();
        lemiort.setName("Lemiort");

        User freewind = new User();
        freewind.setName("Freewind");

        Thread faq = new Thread();
        faq.setTitle("FAQ");
        faq.setCreator(lemiort);
        faq.setTimeCreated(new Date(2016,07,16,23,45));
        faq.setLastUser(freewind);
        faq.setTimeUpdated(new Date(2016,07,16,23,46));
        threads.add(faq);

        Thread flood = new Thread();
        flood.setTitle("Флудилка");
        flood.setCreator(freewind);
        flood.setTimeCreated(new Date(2016,05,16,23,45));
        flood.setLastUser(lemiort);
        flood.setTimeUpdated(new Date(2016,05,16,23,46));
        threads.add(flood);*/
    }

    private ArrayList<Thread> threads;
    public  ArrayList<Thread> getThreads(){
        return  threads;
    }

    public void AddThread(Thread thread){
        threads.add(thread);
    }
}
