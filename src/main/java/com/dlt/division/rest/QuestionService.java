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

import com.dlt.division.model.Question;


//Dummy comment
@Path("/EP")
public class QuestionService implements DivisionService{



        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emQuestion;



        @GET()
        @Path("question/{question_id}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Question> getQuestion(@PathParam("question_id") int iQuestionId)
        {

                Query query = emQuestion.createQuery("FROM com.dlt.division.model.Question where question_id = ?1");
                query.setParameter(1,iQuestionId);
                @SuppressWarnings("unchecked")
                List <Question> question = query.getResultList();

                return question;
        }

        @GET()
        @Path("contestQuestions/{contest_id}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Question> getContestQuestions(@PathParam("contest_id") int iContestId)
        {

                Query query = emQuestion.createQuery("FROM com.dlt.division.model.Question where question_id " +
				"in (select question_id from scheduled_question where contest_id = ?1) order by question_id");
                query.setParameter(1,iContestId);
                @SuppressWarnings("unchecked")
                List <Question> question = query.getResultList();

                return question;
        }

        @GET()
        @Path("askedQuestions/{contest_id}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<Question> getAskedQuestions(@PathParam("contest_id") int iContestId)
        {
                Query query = emQuestion.createQuery("FROM com.dlt.division.model.Question where question_id " +
				"in (select question_id from scheduled_question where has_been_asked is true and contest_id = ?1) "+
				"order by question_id");
                query.setParameter(1,iContestId);
                @SuppressWarnings("unchecked")
                List <Question> question = query.getResultList();

                return question;
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

