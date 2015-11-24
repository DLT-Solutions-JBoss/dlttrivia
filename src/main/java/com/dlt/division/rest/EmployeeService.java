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

import com.dlt.division.model.Employee;


//Dummy comment
@Path("/EP")
public class EmployeeService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emEmployee;



        @GET()
        @Path("employee/{employeeId}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Employee> getEmployee(@PathParam("employeeId") String sEmployeeId)
        {

                Query query = emEmployee.createQuery("FROM com.dlt.division.model.Employee where id = ?1");
                query.setParameter(1,sEmployeeId);
                @SuppressWarnings("unchecked")
                List <Employee> employee = query.getResultList();

                return employee;
        }

        @GET()
        @Path("employees")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Employee> getEmployees()
        {

                Query query = emEmployee.createQuery("FROM com.dlt.division.model.Employee order by last_name, first_name");
                @SuppressWarnings("unchecked")
                List <Employee> employee = query.getResultList();

                return employee;
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

