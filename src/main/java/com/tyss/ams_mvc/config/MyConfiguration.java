package com.tyss.ams_mvc.config;

import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan(basePackages = "com.tyss.ams_mvc")
public class MyConfiguration {
	@Bean(value = "entityManager")
	@Scope(value = "prototype")
	public EntityManager getEntityManager() {
		return Persistence.createEntityManagerFactory("dev").createEntityManager();
	}

	@Bean
	public ViewResolver viewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/views/");
		resolver.setSuffix(".jsp");
		return resolver;
	}
	
//	@Bean
//	public ViewResolver viewResolver2() {
//		return new InternalResourceViewResolver("/views/", ".jsp") ;
//	}
	@Bean
	public MultipartResolver multipartResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(10485760);
		return resolver;
	}
	
}
