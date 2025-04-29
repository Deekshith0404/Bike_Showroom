package com.xworkz.bike_showroom.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan("com.xworkz.bike_showroom")
@EnableWebMvc
public class BikeConfig {
        @Bean
        public LocalContainerEntityManagerFactoryBean getLocalContainerEntityManagerFactoryBean(){
            LocalContainerEntityManagerFactoryBean bean=new LocalContainerEntityManagerFactoryBean();
            bean.setPackagesToScan("com.xworkz.bike_showroom.entity");
            bean.setDataSource(getDataSource());
            bean.setJpaProperties(jpaProperties());
            bean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
            return bean;
        }

        private Properties jpaProperties()
        {
            Properties pro=new Properties();
            pro.setProperty("hibernate.show_sql","true");
            pro.setProperty("hibernate.hbm2ddl.auto","update");
            return pro;
        }
        @Bean
        public DataSource getDataSource(){
            DriverManagerDataSource dm=new DriverManagerDataSource();
            dm.setDriverClassName("com.mysql.cj.jdbc.Driver");
            dm.setUrl("jdbc:mysql://localhost:3306/bike_project");
            dm.setUsername("root");
            dm.setPassword("root");
            return dm;
        }

    @Bean
    public MultipartResolver multipartResolver(){
        return new StandardServletMultipartResolver();
    }

        @Bean
        public ViewResolver viewResolver() {
            InternalResourceViewResolver resolver = new InternalResourceViewResolver();
            resolver.setSuffix(".jsp");
            return resolver;
        }
    }


