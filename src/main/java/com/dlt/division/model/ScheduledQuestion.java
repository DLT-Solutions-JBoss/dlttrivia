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
@Table(name="scheduled_question")
public class ScheduledQuestion {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "scheduled_question_id")
    int scheduled_question_id;

    @ManyToOne
    @JoinColumn(name="question_id")
    private Question question;

    @ManyToOne
    @JoinColumn(name="contest_id")
    private Contest contest;

    @Column(name = "has_been_asked")
    private boolean has_been_asked = false;

    @Column(name = "scheduled", columnDefinition="DATETIME")
    private Date scheduled;

    @Column(name = "value")
    int value;

    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    public Question getQuestion() {
      return question;
    }

    public void setQuestion(Question question) {
      this.question = question;
    }

   public int getValue() {
      return value;
    }

    public void setValue(int value) {
      this.value = value;
   }

    public Contest getContest() {
      return contest;
    }

    public void setContest(Contest contest) {
      this.contest = contest;
   }

    public boolean getHasBeenAsked() {
      return this.has_been_asked;
    }

    public void setHasBeenAsked(boolean has_been_asked) {
      this.has_been_asked = has_been_asked;
    }

    public Date getScheduled() {
      return this.scheduled;
    }

    public void setScheduled(Date scheduled) {
      this.scheduled = scheduled;
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
