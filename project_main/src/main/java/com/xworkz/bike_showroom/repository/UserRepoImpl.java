package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.LoginEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;

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

    @Override
    public List<String> getbikeonbranch(String branchname) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query1=entityManager.createNamedQuery("branchnamefromid");
            query1.setParameter("name",branchname);
            int id= (int) query1.getSingleResult();
            System.out.println(id);
            Query query=entityManager.createNamedQuery("getnameonbranch");
            query.setParameter("branchid",id);
            List<String> bike= query.getResultList();
            return bike;
        }catch (Exception e){
         log.error(e.getMessage());
         return null;
        }
    }

    @Override
    public boolean numberexist(long number) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("numberexist");
            query.setParameter("number",number);
            Object o=query.getSingleResult();
            if (o!=null){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean dlnumber(String dlnum) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("dlnumexist");
            query.setParameter("dlnum",dlnum);
            Object o=query.getSingleResult();
            if (o!=null){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean nameExist(String name) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("nameexist");
            query.setParameter("name",name);
            Object o=query.getSingleResult();
            if (o!=null){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public LoginEntity login(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getuserdata");
            query.setParameter("email",email);
            LoginEntity loginEntity=(LoginEntity) query.getSingleResult();

            return loginEntity;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean logincountincrement(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("logincountincrement");
            query.setParameter("email", email);
            int update=query.executeUpdate();
            entityManager.getTransaction().commit();
            if (update==1){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public void timeout(String email) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("timelock");
            query.setParameter("email", email);
            query.setParameter("time", LocalDateTime.now());
            int update = query.executeUpdate();
            entityManager.getTransaction().commit();
        }catch (Exception e){
            log.error(e.getMessage());
        }
    }

    @Override
    public void loginrest(String email) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("loginreset");
            query.setParameter("email", email);
            int update=query.executeUpdate();
            entityManager.getTransaction().commit();

        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }

    @Override
    public boolean setpassword(String email, String password) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("setpassword");
            query.setParameter("password",password);
            query.setParameter("email", email);
            int update=query.executeUpdate();
            entityManager.getTransaction().commit();
            return  true;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return false;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }
}
