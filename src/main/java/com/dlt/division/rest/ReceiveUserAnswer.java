package com.dlt.division.rest;

import javax.ws.rs.Produces;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.annotation.Annotation;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;

import java.util.Properties;

import com.dlt.division.model.Contestant;
import com.dlt.division.model.QuestionChoice;
import com.dlt.division.model.ScheduledQuestion;

//Path to REST Service
@Path("/EP")
public class ReceiveUserAnswer implements DivisionService {
	
	    //Set constants
	    static final String TITLE_TAG            = "<!--TITLE-->";
	    static final String API_URL_TAG          = "<!--API_URL-->";
	    static final String FIRST_NAME_TAG       = "<!--FIRST_NAME-->";
	    static final String QUESTION_TEXT_TAG    = "<!--QUESTION-->";
	    static final String QUESTION_ID_TAG      = "<!--QUESTION_ID-->";
	    static final String CHOICE_LIST_TAG      = "<!--CHOICE_LIST-->";
	    static final String USER_ID_TAG          = "<!--USER_ID-->";
	    static final String SMTP_AUTH_PROP_TAG   = "mail.smtp.auth";
	    static final String SMTP_START_TLS_TAG   = "mail.smtp.starttls.enable";
	    static final String SMTP_HOST_TAG        = "mail.smtp.host";
	    static final String SMTP_PORT_TAG        = "mail.smtp.port";
	    static final String SMTP_AUTH_PROP_VALUE = "true";
	    static final String SMTP_START_TLS_VALUE = "true";
	    static final String SMTP_HOST_VALUE      = "smtp.gmail.com";
	    static final String SMTP_PORT_VALUE      = "587";
	    static final String SMTP_MSG_TYPE        = "text/html";
	    static final String TRIVIA_HTML_TEMPLATE = "../../../../trivia_template.html";
	    static final String TRIVIA_EMAIL_SUBJECT = "DLT EP Trivia";
	    
        //Establish empty Email property class
        Properties props = new Properties();
	    
        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emScheduledQuestion;

        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emContestant;

        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.EXTENDED)
        private EntityManager emQuestionChoice;
        
        @GET()
        @Path("answerQuestion/{questionId}/{userId}/{answerId}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<ScheduledQuestion> getAnswer(@PathParam("questionId") int iQuestionId,
        		@PathParam("userId") int iUserId, @PathParam("answerId") int iAnswerId)
        {
        	//Get Question from Contest
            Query query = emScheduledQuestion.createQuery("FROM com.dlt.division.model.ScheduledQuestion where scheduled > current_date() - 1 order by scheduled")
                            .setMaxResults(1);
            @SuppressWarnings("unchecked")
            List <ScheduledQuestion> ScheduledQuestion = query.getResultList();
            
        	//Get Contestants for Contest
            query = emContestant.createQuery("FROM com.dlt.division.model.Contestant where contest_id = ?1");

            @SuppressWarnings("unchecked")
            List <Contestant> ContestantList = query.getResultList();           
      
            if(!ScheduledQuestion.isEmpty() && !ContestantList.isEmpty())
            {
            	props.put(SMTP_AUTH_PROP_TAG, SMTP_AUTH_PROP_VALUE);
                props.put(SMTP_START_TLS_TAG, SMTP_START_TLS_VALUE);
                props.put(SMTP_HOST_TAG, SMTP_HOST_VALUE);
                props.put(SMTP_PORT_TAG, SMTP_PORT_VALUE);


                try {
                	//Establish email message
                	ScheduledQuestion sched = ScheduledQuestion.get(0);                                 
                      

                    InputStream in =
                    		SendTriviaQuestion.class.getClassLoader().getResourceAsStream(TRIVIA_HTML_TEMPLATE);
 
                    StringBuffer fileContents = new StringBuffer(); 
                    
                    if (in == null) 
                    {
                    	System.out.println("File Not Found: "+TRIVIA_HTML_TEMPLATE);
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
                    
                    //Get HTML email template from webapp resource location
                    String htmlTemplate = fileContents.toString();
                    
                    //Replace tag with title
                    htmlTemplate = htmlTemplate.replaceAll(TITLE_TAG, TRIVIA_EMAIL_SUBJECT);
                    
                  //Replace tag with question text
                    htmlTemplate = htmlTemplate.replaceAll(API_URL_TAG,
                    		"http://trivia-dlt.apps.ocp.test-demo-dlt.com/rest/EP/triviaAnswer");
                    
                    //Replace tag with question text
                    htmlTemplate = htmlTemplate.replaceAll(QUESTION_TEXT_TAG,
                    		sched.getQuestion().getQuestionText());
                    
                    //Replace question ID in param syntax
                    htmlTemplate = htmlTemplate.replaceAll(QUESTION_ID_TAG,
                    		Integer.toString(sched.getQuestion().getQuestionId()));

                    //Get Choices for Contest Question
                    query = emContestant.createQuery("FROM com.dlt.division.model.QuestionChoice where question_id = ?1");
                    query.setParameter(1,sched.getQuestion().getQuestionId());
                    @SuppressWarnings("unchecked")
                    List <QuestionChoice> QuestionChoiceList = query.getResultList(); 
                            
                    //Create Alpha Choice for end user
                    char[] alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
                            
                    //Create dynamic string for series of variable choices
                    StringBuffer htmlQuestionChoice = new StringBuffer();
                       	
                  
                    //Loop through choices and create rows/columns of radio buttons for the user to select
                    for (int i = 0; i < QuestionChoiceList.size(); i++) 
                    {
                    	QuestionChoice questionChoice = QuestionChoiceList.get(i);
                            	
                    	//Create list of choices in html format
                        htmlQuestionChoice.append("<input type='radio' name='answer' id='question-answers-")
                        .append(Integer.toString(i))
                        .append("' value='")
                        .append(Integer.toString(questionChoice.getChoice().getChoiceId()))
                        .append("' /> <label for='question-answers-")
                        .append(Integer.toString(i))
                        .append("'>")
                        .append(Character.toString(alphabet[i]))
                        .append(") ")
                        .append(questionChoice.getChoice().getChoiceText())
                        .append("</label><br>\n");
                        
                    }
                    
                    //Replace choice list with question html
                    htmlTemplate = htmlTemplate.replaceAll(CHOICE_LIST_TAG,
                    		htmlQuestionChoice.toString());
                            
                    //Now loop through contestants and send the emails
                    for (int i = 0; i < ContestantList.size(); i++) 
                    {
                    	//For each contestant
                    	Contestant contestant = ContestantList.get(i);
                    	
                                
                        //Log that email was sent
                        System.out.println("Scheduled Question "+
                          sched.getValue()+ "sent to"+
                          contestant.getUser().getFirstName() + " " +
                          contestant.getUser().getLastName());
                        
                        //Email content
                       // System.out.println(content);
                    }                            

                    System.out.println("Done sending scheduled question - "+sched.getValue());
                }
                  catch (IOException ex) 
                {
            	    throw new RuntimeException(ex);
                } 
        }

        return ScheduledQuestion;
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
