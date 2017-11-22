package com.dlt.division.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlRootElement;
import java.sql.Date;

@XmlRootElement
@Entity
@Table(name="ask")
public class Ask {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "ask_id")
    int ask_id;

    @ManyToOne
    @JoinColumn(name="scheduled_question_id")
    private ScheduledQuestion scheduledQuestion;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @Column(name = "asked", columnDefinition="DATETIME")
    private Date asked;

    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    public int getAskId() {
      return ask_id;
    }

    public void setAskId(int ask_id) {
      this.ask_id = ask_id;
   }

    public ScheduledQuestion getScheduledQuestion() {
      return scheduledQuestion;
    }

    public void setScheduledQuestion(ScheduledQuestion question) {
      this.scheduledQuestion = question;
    }

   public Date getAsked() {
      return asked;
    }

    public void setAsked(Date asked) {
      this.asked = asked;
   }

    public User getUser() {
      return user;
    }

    public void setUser(User user) {
      this.user = user;
   }

    public Date getCreated() {
      return this.created;
    }

    public void setCreated(Date created) {
      this.created = created;
    }

    public Date getUpdated() {
      return this.updated;
    }

    public void setUpdated(Date updated) {
      this.updated = updated;
    }

}
