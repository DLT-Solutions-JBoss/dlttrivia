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
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceUnit;
import javax.persistence.Query;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.dlt.division.model.Ask;
import com.dlt.division.model.Contestant;
import com.dlt.division.model.QuestionChoice;
import com.dlt.division.model.ScheduledQuestion;

//Path to REST Service
@Path("/EP")
public class SendTriviaQuestion implements DivisionService {
	
	    //Set constants
	    static final String TITLE_TAG            = "<!--TITLE-->";
	    static final String API_URL_TAG          = "<!--API_URL-->";
	    static final String FIRST_NAME_TAG       = "<!--FIRST_NAME-->";
	    static final String QUESTION_TEXT_TAG    = "<!--QUESTION-->";
	    static final String QUESTION_ID_TAG      = "<!--QUESTION_ID-->";
	    static final String ASK_ID_TAG           = "<!--ASK_ID-->";
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
	    static final String ALPHABET             = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	    
        //Email scheduled trivia question
	final String username = System.getenv("DLT_JBOSS_EMAIL_USER");
        final String password = System.getenv("DLT_JBOSS_EMAIL_PWD");

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
        
        @DivisionService(ServiceType.EP)
        @PersistenceContext(unitName="Division", type=PersistenceContextType.TRANSACTION)
        private EntityManager emAsk;
 
        @DivisionService(ServiceType.EP)
        @PersistenceUnit(unitName="Division")
        private EntityManagerFactory factory;
        
        @GET()
        @Path("emailQuestion/{contestId}")
        @Produces("application/json")
        @DivisionService(ServiceType.EP)
        public List<ScheduledQuestion> sendQuestion(@PathParam("contestId") int iContestId)
        {
        	//Get Question from Contest
            Query query = emScheduledQuestion.createQuery("FROM com.dlt.division.model.ScheduledQuestion where scheduled > current_date() - 1 order by scheduled")
                            .setMaxResults(1);
            @SuppressWarnings("unchecked")
            List <ScheduledQuestion> ScheduledQuestion = query.getResultList();
            
        	//Get Contestants for Contest
            query = emContestant.createQuery("FROM com.dlt.division.model.Contestant where contest_id = ?1");
            query.setParameter(1,iContestId);
            @SuppressWarnings("unchecked")
            List <Contestant> ContestantList = query.getResultList();           
      
            if(!ScheduledQuestion.isEmpty() && !ContestantList.isEmpty())
            {
            	
            	props.put(SMTP_AUTH_PROP_TAG, SMTP_AUTH_PROP_VALUE);
                props.put(SMTP_START_TLS_TAG, SMTP_START_TLS_VALUE);
                props.put(SMTP_HOST_TAG, SMTP_HOST_VALUE);
                props.put(SMTP_PORT_TAG, SMTP_PORT_VALUE);

                Session session = Session.getInstance(props,
                		new javax.mail.Authenticator() {
                	protected PasswordAuthentication getPasswordAuthentication() {
                		return new PasswordAuthentication(username, password);
                		}
                	});

                try {
                	//Establish email message
                	Message message = new MimeMessage(session);
                	message.setFrom(new InternetAddress(username));
                	ScheduledQuestion sched = ScheduledQuestion.get(0);                                 
                      
                    message.setSubject(TRIVIA_EMAIL_SUBJECT);
                    message.setSentDate(new java.util.Date());

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
                    
                    //Get Trivia URL from environmental variables
                    String triviaUrl = "";
                    if(System.getenv("TRIVIA_ANSWER_URL") != null)
                    {
                    	triviaUrl = System.getenv("TRIVIA_ANSWER_URL");
                    }
                    
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
                            
                    //Now loop through contestants and send the emails
                    for (int i = 0; i < ContestantList.size(); i++) 
                    {
                    	//For each contestant
                    	Contestant contestant = ContestantList.get(i);
                    	
                    	//Don't send again to any user that has already asked the question
                    	query = emAsk.createQuery("FROM com.dlt.division.model.Ask where scheduled_question_id = ?1 and user_id = ?2");
                        query.setParameter(1, sched.getScheduledQuestionId());
                        query.setParameter(2, contestant.getUser().getUserId());
                        @SuppressWarnings("unchecked")
                        List <Ask> AskedUserList = query.getResultList();
                    	
                        //Only process the Ask if it has not been asked before
                        if(AskedUserList.isEmpty())
                        { 
                        	//Set email address
                    	    message.setRecipients(Message.RecipientType.TO,
                    			InternetAddress.parse(contestant.getUser().getEmail()));
                    			
                    	    //Set first name to make friendly text
                    	    String content = htmlTemplate.replaceAll(FIRST_NAME_TAG,
                    			contestant.getUser().getFirstName());
                    	    
                    	    //Send randomized choices to users to hinder cheating
                    	    content = content.replaceAll(CHOICE_LIST_TAG, 
                    	    		randomizeChoiceList(QuestionChoiceList, triviaUrl));
                    	    
                            EntityManager emAskInsert = factory.createEntityManager();
                            EntityTransaction entityTransaction = emAskInsert.getTransaction();
                   
                           //Insert a record into the Ask table to ensure no duplicate Asks
                            try
                            {
                            	entityTransaction.begin();
                            	
                                Ask ask = new Ask();
                                ask.setScheduledQuestion(sched);
                                ask.setUser(contestant.getUser());
                                ask.setAsked(new Date(System.currentTimeMillis()));
                                ask.setCreated(new Date(System.currentTimeMillis()));
                                ask.setUpdated(new Date(System.currentTimeMillis()));
                                emAskInsert.persist(ask);                                
                                emAskInsert.flush();                               
                                entityTransaction.commit();
                                
                        	    //Set the Ask ID in order to establish the ability to process answer
                        	    content = content.replaceAll(ASK_ID_TAG,
                        			Long.toString(ask.getAskId()));
                                
                                System.out.println("Ask saved successfully with ID = "+ask.getAskId());
                            }
                            catch (Exception e) {
                                if (emAskInsert != null) {
                                    System.out.println("Ask Transaction is being rolled back.");
                                    entityTransaction.rollback();
                                 }
                            }
                    			
                    	    //Set content to message text
                            message.setContent(content, SMTP_MSG_TYPE);

                            //Send the email
                            Transport.send(message);
                                
                            //Log that email was sent
                            System.out.println("Scheduled Question "+
                              sched.getValue()+ "sent to"+
                              contestant.getUser().getFirstName() + " " +
                              contestant.getUser().getLastName());
                        
                            //Email content
                            System.out.println(content);
                        }
                        else
                        {
                        	System.out.println(contestant.getUser().getEmail()+" already sent question.");
                        }
                    }                            

                    System.out.println("Done sending scheduled question - "+sched.getValue());

                } catch (MessagingException e) {
                	throw new RuntimeException(e);
                } catch (IOException ex) {
            	    throw new RuntimeException(ex);
                } 
        }

        return ScheduledQuestion;
    }

    public String randomizeChoiceList(List <QuestionChoice> QuestionChoiceList, String triviaUrl)
    {
    	//Create Alpha Choice for end user
        char[] alphabet = ALPHABET.toCharArray();
                    
        //Create dynamic string for series of variable choices
        StringBuffer htmlQuestionChoice = new StringBuffer();
  	      
        Collections.shuffle(QuestionChoiceList);
            
        //Loop through choices and create rows/columns of radio buttons for the user to select
        for (int i = 0; i < QuestionChoiceList.size(); i++) 
        {
        	QuestionChoice questionChoice = QuestionChoiceList.get(i);
                    	
            //Create list of choices in html format
            htmlQuestionChoice.append("<a href=\"")
                .append(triviaUrl)
                .append(ASK_ID_TAG)
                .append("/")
                .append(Integer.toString(questionChoice.getChoice().getChoiceId()))
                .append("\">")
                .append(Character.toString(alphabet[i]))
                .append(") ")
                .append(questionChoice.getChoice().getChoiceText())
                .append("</a><br>\n");
                
         }
         
        return htmlQuestionChoice.toString();
            
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

