package com.springblog.services.connections;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Service;

@Service
public class ConnectionSession {

    private static Configuration configuration = null;
    private static SessionFactory factory = null;

    public Session OpenSession() {

        if (configuration == null) {
            try {
                configuration = new Configuration().configure();
                StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties());
                factory = configuration.buildSessionFactory(builder.build());
            } catch (HibernateException e) {
                System.out.println(e.getMessage());
                return null;
            }
        }
        return factory.openSession();
    }
}
