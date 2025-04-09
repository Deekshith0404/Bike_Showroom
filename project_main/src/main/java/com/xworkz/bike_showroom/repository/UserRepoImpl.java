package com.xworkz.bike_showroom.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
@Repository
public class UserRepoImpl implements UserRepo{

    private static final Logger log = LoggerFactory.getLogger(OwnerRepoImpl.class);
    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public Long emailoccurence(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("emailcheck");
            query.setParameter("email",email);
            Long result=(Long) query.getSingleResult();
            return result;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return null;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }
}
