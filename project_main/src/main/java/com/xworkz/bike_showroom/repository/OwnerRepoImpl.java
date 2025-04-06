package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.BranchEntity;
import com.xworkz.bike_showroom.entity.OwnerLoginEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

@Repository
public class OwnerRepoImpl implements OwnerRepo {

    private static final Logger log = LoggerFactory.getLogger(OwnerRepoImpl.class);
    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public OwnerLoginEntity checkemail(String email) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            Query query=entityManager.createNamedQuery("checklogin");
            query.setParameter("email",email);
            OwnerLoginEntity object =(OwnerLoginEntity) query.getSingleResult();
            if (object!=null){
                return object;
            }
            return null;
        }catch (Exception e){
            log.info(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean addPassword(String email, String password) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("updatepassword");
            query.setParameter("password",password);
            query.setParameter("email",email);
            int result1=query.executeUpdate();
            System.out.println("======"+result1);
            if (result1==1){
                return true;
            }else {
                return false;
            }
        }catch (Exception e){
            log.info(e.getMessage());
            System.out.println(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean addBranch(BranchEntity branchEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(branchEntity);
            entityManager.getTransaction().commit();
            return true;
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

    @Override
    public int bikecount() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("bikecount");
            int count=query.executeUpdate();
            return count;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }

    @Override
    public int branchcount() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("branchcount");
            int count=query.executeUpdate();
            return count;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }

    @Override
    public int usercount() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("usercount");
            int count=query.executeUpdate();
            return count;
        }catch (Exception e){
            log.error(e.getMessage());
            entityManager.getTransaction().rollback();
            return -1;
        }finally {
            if (entityManager!=null){
                entityManager.close();
            }
        }
    }
}
