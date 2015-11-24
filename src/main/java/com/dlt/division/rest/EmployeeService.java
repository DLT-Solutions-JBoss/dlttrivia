package com.dlt.division.rest;

import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.lang.annotation.Annotation;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import com.dlt.division.model.Response;
import com.dlt.division.model.Employee;


//Dummy comment
@Path("/EP")
public class EmployeeService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Emp", type=PersistenceContextType.EXTENDED)
        private EntityManager emStation;



        @GET()
        @Path("station/{stationId}")
        @Produces("application/json")
        @DivisionService(ServiceType.Emp)
        public List<Station> getStation(@PathParam("stationId") String sStationId)
        {

                Query query = emStation.createQuery("FROM com.dlt.division.model.Station where id = ?1 order by name");
                query.setParameter(1,sStationId);
                @SuppressWarnings("unchecked")
                List <Station> station = query.getResultList();

                return station;
        }

        @GET()
        @Path("station/state/{stateCode}")
        @Produces("application/json")
        @DivisionService(ServiceType.Emp)
        public List<Station> getStationsByState(@PathParam("stateCode") String sStateCode)
        {

                Query query = emStation.createQuery("FROM com.dlt.division.model.Station where state = ?1 order by name");
                query.setParameter(1,sStateCode);
                @SuppressWarnings("unchecked")
                List <Station> station = query.getResultList();

                return station;
        }

        @GET()
        @Path("stations")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Station> getStations()
        {

                Query query = emStation.createQuery("FROM com.dlt.division.model.Station order by name");
                @SuppressWarnings("unchecked")
                List <Station> station = query.getResultList();

                return station;
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

