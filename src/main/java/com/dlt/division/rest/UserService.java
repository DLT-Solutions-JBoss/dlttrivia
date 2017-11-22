package com.dlt.division.rest;

import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import java.lang.annotation.Annotation;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import com.dlt.division.model.User;


//Dummy comment
@Path("/EP")
public class UserService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emUser;



        @GET()
        @Path("user/{user_id}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<User> getUser(@PathParam("user_id") int iUserId)
        {

                Query query = emUser.createQuery("FROM com.dlt.division.model.User where user_id = ?1");
                query.setParameter(1,iUserId);
                @SuppressWarnings("unchecked")
                List <User> user = query.getResultList();

                return user;
        }

        @GET()
        @Path("users")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<User> getUsers()
        {

                Query query = emUser.createQuery("FROM com.dlt.division.model.User order by last_name, first_name");
                @SuppressWarnings("unchecked")
                List <User> user = query.getResultList();

                return user;
        }

        @GET()
        @Path("activeUsers")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<User> getActiveUsers()
        {

                Query query = emUser.createQuery("FROM com.dlt.division.model.User where status = TRUE order by last_name, first_name");
                @SuppressWarnings("unchecked")
                List <User> user = query.getResultList();

                return user;
        }        
        
        @Override
        public Class<? extends Annotation> annotationType() {
                return null;
        }
        @Override
        public ServiceType value() {
                return null;
        }
}

