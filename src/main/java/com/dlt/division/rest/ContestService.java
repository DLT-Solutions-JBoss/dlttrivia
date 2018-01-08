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

import com.dlt.division.model.Contest;


//Dummy comment
@Path("/EP")
public class ContestService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emContest;



        @GET()
        @Path("contest/{contest_id}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Contest> getContest(@PathParam("contest_id") int iContestId)
        {

                Query query = emContest.createQuery("FROM com.dlt.division.model.Contest where contest_id = ?1");
                query.setParameter(1,iContestId);
                @SuppressWarnings("unchecked")
                List <Contest> contest = query.getResultList();

                return contest;
        }

        @GET()
        @Path("contests")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Contest> getContests()
        {

                Query query = emContest.createQuery("FROM com.dlt.division.model.Contest order by contest_title");
                @SuppressWarnings("unchecked")
                List <Contest> contest = query.getResultList();

                return contest;
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

