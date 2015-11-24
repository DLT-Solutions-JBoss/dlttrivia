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

import com.dlt.division.model.Provider;


//Dummy comment
@Path("/EP")
public class ProviderService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emProvider;



        @GET()
        @Path("provider/{providerId}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Provider> getProvider(@PathParam("providerId") int iProviderId)
        {

                Query query = emProvider.createQuery("FROM com.dlt.division.model.Provider where id = ?1");
                query.setParameter(1,iProviderId);
                @SuppressWarnings("unchecked")
                List <Provider> provider = query.getResultList();

                return provider;
        }

        @GET()
        @Path("providers")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Provider> getProviders()
        {

                Query query = emProvider.createQuery("FROM com.dlt.division.model.Provider order by last_name, first_name");
                @SuppressWarnings("unchecked")
                List <Provider> provider = query.getResultList();

                return provider;
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

