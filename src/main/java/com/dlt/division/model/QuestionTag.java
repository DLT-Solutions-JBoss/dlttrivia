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
@Table(name="question_tag")
public class QuestionTag {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "question_tag_id")
    int question_tag_id;
    
    @ManyToOne
    @JoinColumn(name="question_id")
    private Question question;

    @ManyToOne
    @JoinColumn(name="tag_id")
    private Tag tag;

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

    public Tag getTag() {
      return tag;
    }

    public void setTag(Tag tag) {
      this.tag = tag;
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
