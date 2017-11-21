package com.dlt.division.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.ManyToOne;
import javax.xml.bind.annotation.XmlRootElement;
import java.sql.Date;

@XmlRootElement
@Entity
@Table(name="question_choice")
public class QuestionChoice {

    @ManyToOne
    @JoinColumn(name="question_id")
    private Question question;

    @ManyToOne
    @JoinColumn(name="choice_id")
    private Choice choice;

    @Column(name = "is_correct")
    private boolean is_correct = false;

    @Column(name = "created", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;

    public Question getQuestion() {
      return question;
    }

    public void setQuestion(Question question) {
      this.question = question;
    }

    public Choice getChoice() {
      return choice;
    }

    public void setChoice(Choice choice) {
      this.choice = choice;
   }

    public boolean getIsCorrect() {
      return this.is_correct;
    }

    public void setIsCorrect(boolean is_correct) {
      this.is_correct = is_correct;
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
