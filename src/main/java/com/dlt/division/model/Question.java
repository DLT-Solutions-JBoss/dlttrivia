package com.dlt.division.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import java.sql.Date;

@XmlRootElement
@Entity
@Table(name="question")
public class Question {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "question_id")
    int question_id;
    
    @Column(name = "question_text", columnDefinition="varchar(5000)")
    String question_text;

    @Column(name = "answer_text", columnDefinition="varchar(5000)")
    String answer_text;
    
    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    @Column(name = "question_value")
    private int question_value;

    public int getQuestionId() {
      return question_id;
    }

    public void setQuestionId(int question_id) {
      this.question_id = question_id;
    }

    public String getQuestionText() {
      return this.question_text;
    }

    public void setQuestionText(String text) {
      this.question_text = text;
    }

    public String getAnswerText() {
      return this.answer_text;
    }

    public void setAnswerText(String text) {
      this.answer_text = text;
    }


    public int getQuestionValue() {
      return this.question_value;
    }

    public void setQuestionValue(int i) {
      this.question_value = i;
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
