package com.dlt.division.rest;

import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.annotation.Annotation;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

import java.util.Properties;

import com.dlt.division.model.Ask;
import com.dlt.division.model.Choice;
import com.dlt.division.model.QuestionChoice;
import com.dlt.division.model.Response;
import com.dlt.division.model.ScheduledQuestion;

//Path to REST Service
@Path("/EP")
public class ReceiveUserAnswer implements DivisionService {
	
	    //Set constants
	    static final String TITLE_TAG                       = "<!--TITLE-->";
	    static final String SUMMARY_TAG                     = "<!--SUMMARY-->";
	    static final String API_URL_TAG                     = "<!--API_URL-->";
	    static final String FIRST_NAME_TAG                  = "<!--FIRST_NAME-->";
	    static final String RESULT_TEXT_TAG                 = "<!--RESULT_TEXT-->";
	    static final String USER_ANSWER_TEXT_TAG            = "<!--USER_CHOICE_TEXT-->";
	    static final String CORRECT_ANSWER_CHOICE_TEXT_TAG  = "<!--CORRECT_ANSWER_CHOICE_TEXT-->";
	    static final String ANSWER_LONG_TEXT_TAG            = "<!--CORRECT_ANSWER_LONG_TEXT-->";
	    static final String QUESTION_ID_TAG                 = "<!--QUESTION_ID-->";
	    static final String QUESTION_TEXT_TAG               = "<!--QUESTION_TEXT-->";
	    static final String USER_ID_TAG                     = "<!--USER_ID-->";
	    static final String SMTP_MSG_TYPE                   = "text/html";
	    static final String RESULT_COLOR_TAG                = "<!--RESULT_COLOR-->";
	    static final String RESULT_CORRECT_COLOR            = "green";
	    static final String RESULT_INCORRECT_COLOR          = "red";
	    static final String TRIVIA_ANSWER_HTML_TEMPLATE     = "../../../../trivia_answer_template.html";
	    static final String TRIVIA_TITLE                    = "DLT EP Trivia";
	    
        //Establish empty Email property class
        Properties props = new Properties();
	    
        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emAsk;
        
        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emChoice;

        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emResponse;
        
        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emQuestionChoice;
        
        @DivisionService(ServiceType.EP)
        @PersistenceUnit(unitName="Division")
        private EntityManagerFactory factory;
        
        @GET()
        @Path("answerQuestion/{askId}/{answerId}")
        @Produces("text/html")
        @DivisionService(ServiceType.EP)
        public String getAnswer(@PathParam("askId") long iAskId, @PathParam("answerId") int iAnswerId)
        {
        	String sFormattedDate = "";
        	SimpleDateFormat dateFormat = new SimpleDateFormat("E, MMMM dd yyyy");
        	int iResponseChoiceId = 0;
        	
        	String htmlTemplate = "<!DOCTYPE html><html lang=\"en\">There was an error with your answer</html>";
        	
        	//Get Question from Ask
            Query query = emAsk.createQuery("FROM com.dlt.division.model.Ask where ask_id = ?1");
            query.setParameter(1,iAskId);
            @SuppressWarnings("unchecked")
            List <Ask> askList = query.getResultList();

            //Ensure you received a valid Ask ID
            if(askList.isEmpty())
            {
            	return htmlTemplate;
            }

            //Get Choice text selected by the user
            query = emChoice.createQuery("FROM com.dlt.division.model.Choice where choice_id = ?1");
            query.setParameter(1,iAnswerId);
            @SuppressWarnings("unchecked")
            List <Choice> ChoiceList = query.getResultList(); 
     
            Choice userChoice = ChoiceList.get(0);
            
        	//Ensure it wasn't already responded to
            query = emResponse.createQuery("FROM com.dlt.division.model.Response where ask_id = ?1");
            query.setParameter(1,iAskId);
            @SuppressWarnings("unchecked")
            List <Response> responseList = query.getResultList();

            //Ensure you received a valid Ask ID
            if(responseList.isEmpty())
            {
            	//Insert into Response    
            	EntityManager emResponse = factory.createEntityManager();
            	EntityTransaction entityTransaction = emResponse.getTransaction();
   
                //Insert a record into the Response table to ensure no duplicate Responses
                try
                {
                	entityTransaction.begin();
            	
                    Response response = new Response();
                    response.setAsk(askList.get(0));;
                    response.setChoice(userChoice);
                    response.setResponded(new Date(System.currentTimeMillis()));
                    response.setCreated(new Date(System.currentTimeMillis()));
                    response.setUpdated(new Date(System.currentTimeMillis()));
                    emResponse.persist(response);
                    emResponse.flush();                       
                    entityTransaction.commit();
                    
                    //Regardless of repeated answer IDs from user, always use the one from the Originial Response
                    iResponseChoiceId = response.getChoice().getChoiceId();
                    
                    //Get formatted Date
                    
                    sFormattedDate = dateFormat.format(response.getCreated());

                    System.out.println("Response saved successfully with ID = "+response.getResponseId());
                }
                catch (Exception e) 
                { 
                	if (emResponse != null) 
                	{
                      System.out.println("Ask Transaction is being rolled back.");
                      entityTransaction.rollback();
                    }
                }

            }
            else
            {
            	sFormattedDate = dateFormat.format(responseList.get(0).getCreated());
            	iResponseChoiceId = responseList.get(0).getChoice().getChoiceId();
            }
            
            //Get Choice text selected by the user
            query = emChoice.createQuery("FROM com.dlt.division.model.QuestionChoice where question_id = ?1 and is_correct = true");
            query.setParameter(1,askList.get(0).getScheduledQuestion().getQuestion().getQuestionId());
            @SuppressWarnings("unchecked")
            List <QuestionChoice> QuestionChoiceList = query.getResultList(); 
            
            int iCorrectChoiceId = 0;
            
            if(!QuestionChoiceList.isEmpty())
            {
            	iCorrectChoiceId = QuestionChoiceList.get(0).getChoice().getChoiceId();
            }
         
        	//Get Question from Ask
            if(askList.get(0).getScheduledQuestion() != null)
            {

                try {
                	//Establish response message
                	ScheduledQuestion sched = askList.get(0).getScheduledQuestion();                                 
                      
                    //Read in the content of the html template
                    InputStream in =
                    		ReceiveUserAnswer.class.getClassLoader().getResourceAsStream(TRIVIA_ANSWER_HTML_TEMPLATE);
 
                    StringBuffer fileContents = new StringBuffer(); 
                    
                    if (in == null) 
                    {
                    	System.out.println("File Not Found: "+TRIVIA_ANSWER_HTML_TEMPLATE);
                    } 
                    else 
                    {
                        InputStreamReader inputReader = new InputStreamReader(in);
                        char[] buffer = new char[1000];
                        while (true) 
                        {
                        	int lth = inputReader.read(buffer);
                        	if (lth < 0) 
                        	{
                        		break;
                        	} 
                        	else 
                        	{
                        		fileContents.append(buffer, 0, lth);
                        	}
                        }
                    }
                    
                    //Get HTML template from webapp resource location
                    htmlTemplate = fileContents.toString();
    
                    //Get Trivia URL from environmental variables
                    String triviaUrl = "";
                    if(System.getenv("TRIVIA_BASE_URL") != null)
                    {
                    	triviaUrl = System.getenv("TRIVIA_BASE_URL");
                    }
                    
                    //Replace tag with question text
                    htmlTemplate = htmlTemplate.replaceAll(API_URL_TAG, triviaUrl);
                    
                    //Replace tag with question text
                    htmlTemplate = htmlTemplate.replaceAll(ANSWER_LONG_TEXT_TAG,
                    		sched.getQuestion().getAnswerText());
                    
                    
                    //Replace tag with question text
                    htmlTemplate = htmlTemplate.replaceAll(QUESTION_TEXT_TAG,
                    		sched.getQuestion().getQuestionText());
                    
                    //Replace question ID in param syntax
                    htmlTemplate = htmlTemplate.replaceAll(TITLE_TAG, TRIVIA_TITLE);

                    //If the user answered incorrectly
                    if(iAnswerId == iCorrectChoiceId)
                    {
                        //Replace result text in the template
                        htmlTemplate = htmlTemplate.replaceAll(RESULT_TEXT_TAG,
                    		"Congrats, you're correct!");
                    
                        //Replace result color in the template
                        htmlTemplate = htmlTemplate.replaceAll(RESULT_COLOR_TAG,
                		RESULT_CORRECT_COLOR);                    
                    }
                    else
                    {  
                        //Get Choice text selected by the user
                        query = emChoice.createQuery("FROM com.dlt.division.model.Choice where choice_id = ?1");
                        query.setParameter(1,iCorrectChoiceId);
                        @SuppressWarnings("unchecked")
                        List <Choice> CorrectChoiceList = query.getResultList(); 
                 
                    	//Replace correct answer text in the template
                        htmlTemplate = htmlTemplate.replaceAll(CORRECT_ANSWER_CHOICE_TEXT_TAG,
                        		CorrectChoiceList.get(0).getChoiceText());
                        
                        //Replace result text in the template
                        htmlTemplate = htmlTemplate.replaceAll(RESULT_TEXT_TAG,
                    		"Sorry, that is incorrect.");
                        
                        //Replace result color in the template
                        htmlTemplate = htmlTemplate.replaceAll(RESULT_COLOR_TAG,
                		RESULT_INCORRECT_COLOR);
                    }
                
                    //Replace user's answer text in the template
                    htmlTemplate = htmlTemplate.replaceAll(USER_ANSWER_TEXT_TAG,
                    		ChoiceList.get(0).getChoiceText());

                    //Replace correct answer text in the template
                    htmlTemplate = htmlTemplate.replaceAll(CORRECT_ANSWER_CHOICE_TEXT_TAG,
                    		QuestionChoiceList.get(0).getChoice().getChoiceText());
                                  
                    //Replace summary text in the template
                    if(iResponseChoiceId == iCorrectChoiceId)
                    {
                    	String sPoint = " points.";
                    	if(askList.get(0).getScheduledQuestion().getQuestion().getQuestionValue() == 1)
                    	{
                    		sPoint = " point.";
                    	}
                    	
                    	htmlTemplate = htmlTemplate.replaceAll(SUMMARY_TAG,
                    			"You correctly answered this question on "+sFormattedDate + 
                    			" and earned "+
                		askList.get(0).getScheduledQuestion().getQuestion().getQuestionValue() +
                		        sPoint);
                    }
                    else
                    {
                    	htmlTemplate = htmlTemplate.replaceAll(SUMMARY_TAG,
                    			"You answered this question on "+sFormattedDate);
                    }
                    
                    System.out.println("Done answering scheduled question - "+sched.getValue());

                  }                
                  catch (IOException ex) 
                  { 
                  	throw new RuntimeException(ex);
                  } 
             }

        return htmlTemplate;
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

