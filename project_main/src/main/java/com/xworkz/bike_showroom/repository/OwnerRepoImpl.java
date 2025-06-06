package com.xworkz.bike_showroom.repository;

import com.xworkz.bike_showroom.entity.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
            entityManager.getTransaction().commit();
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
            branchEntity.setCreatedBy(branchEntity.getManagerName());
            branchEntity.setCreatedTime(LocalDateTime.now());
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
    public boolean addBike(BikeEntity bikeEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(bikeEntity);
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
            Long count= (Long) query.getSingleResult();
            return Math.toIntExact(count);
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
            Long count= (Long) query.getSingleResult();
            return Math.toIntExact(count);
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
            Long count= (Long) query.getSingleResult();
            return Math.toIntExact(count);
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
    public List<BranchEntity> allbranchdata() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("allbranchdata");
                List<BranchEntity> list= query.getResultList();
            System.out.println("------------------"+list);
            return list;
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
    public List<BikeEntity> allbikedata() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("allbikedata");
            List<BikeEntity> list=query.getResultList();
            return list;
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
    public boolean register(UserReristerEntity userReristerEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            userReristerEntity.setCreatedBy(userReristerEntity.getName());
            userReristerEntity.setCreatedTime(LocalDateTime.now());
            entityManager.getTransaction().begin();
            entityManager.persist(userReristerEntity);
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
    public boolean addbiketobranch(int branchid, int bikeid) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("addbranch");
            query.setParameter("branchId",branchid);
            query.setParameter("bikeId",bikeid);
            int result1=query.executeUpdate();
            entityManager.getTransaction().commit();
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
    public List<BikeEntity> unselectedBike() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("notselectedbike");
            List<BikeEntity> list=query.getResultList();
            return list;
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
    public List<BikeEntity> notFullBranch() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("showroomsWithFewBikes");
            List<BikeEntity> list=query.getResultList();
            return list;
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
    public List<String> branchnames() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("branchname");
            List<String> list = query.getResultList();
            return list;
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
    public boolean followUp(FollowUpEntity followUpEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(followUpEntity);
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
    public List<UserReristerEntity> getalluser() {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getalluser");
            List<UserReristerEntity> list=query.getResultList();
            return list;
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
    public UserReristerEntity getalluserbyname(String name) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getalluserbyname");
            query.setParameter("name",name);
            UserReristerEntity userReristerEntity= (UserReristerEntity) query.getSingleResult();

            return userReristerEntity;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean editfollowupsubmit(FollowUpEntity followUpEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(followUpEntity);
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
    public List<FollowUpEntity> getallbyname(String name) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("getallonname");
            query.setParameter("name",name);
            List<FollowUpEntity>  list=query.getResultList();
            return list;
        }catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean checkbranchExist(String branchName) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("existcheck");
            query.setParameter("branchname",branchName);
            Object object=query.getSingleResult();
            if(object!=null){
                return true;
            }
            else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean checkmodelexist(String model) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try{
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("modelexist");
            query.setParameter("model",model);
            Object object=query.getSingleResult();
            if(object!=null){
                return true;
            }
            else {
                return false;
            }
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public List<BikeEntity> bikes() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("allbikedata");
            List<BikeEntity> bike = query.getResultList();
            return bike;
        } catch (Exception e) {
            log.error(e.getMessage());
            return null;
        }
    }
    @Override
    public BikeEntity bikebyId(int id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query = entityManager.createNamedQuery("bikebyId");
            query.setParameter("id",id);
            BikeEntity bike=(BikeEntity)query.getSingleResult();
            return bike;
        } catch (Exception e) {
            log.error(e.getMessage());
            return null;
        }
    }

    @Override
    public boolean saveloign(LoginEntity loginEntity) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(loginEntity);
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
    public boolean deletebranchbyname(String name) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("deletebranch");
            query.setParameter("name",name);
            int result=query.executeUpdate();
            entityManager.getTransaction().commit();
            if (result>=1){
                return true;
            }
            return false;
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }

    @Override
    public boolean deletebikebymodel(String name) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            Query query=entityManager.createNamedQuery("deletebike");
            query.setParameter("model",name);
            int result=query.executeUpdate();
            entityManager.getTransaction().commit();
            if (result>=1){
                return true;
            }
            return false;
        }catch (Exception e){
            log.error(e.getMessage());
            return false;
        }
    }
}
