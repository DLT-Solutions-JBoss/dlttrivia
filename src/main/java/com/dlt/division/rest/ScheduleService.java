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

import com.dlt.division.model.Schedule;


//Dummy comment
@Path("/EP")
public class ScheduleService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emSchedule;



        @GET()
        @Path("schedule/{ScheduleId}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Schedule> getSchedule(@PathParam("ScheduleId") int iScheduleId)
        {

                Query query = emSchedule.createQuery("FROM com.dlt.division.model.Schedule where id = ?1");
                query.setParameter(1,iScheduleId);
                @SuppressWarnings("unchecked")
                List <Schedule> Schedule = query.getResultList();

                return Schedule;
        }

        @GET()
        @Path("schedules")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Schedule> getSchedules()
        {

                Query query = emSchedule.createQuery("FROM com.dlt.division.model.Schedule order by delivery_date");
                @SuppressWarnings("unchecked")
                List <Schedule> Schedule = query.getResultList();

                return Schedule;
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

