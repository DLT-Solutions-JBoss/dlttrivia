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
@Table(name="choice")
public class Choice {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "choice_id")
    int choice_id;
    
    @Column(name = "choice_text")
    String choice_text;
    
    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    public int getChoiceId() {
      return choice_id;
    }

    public void setChoiceId(int choice_id) {
      this.choice_id = choice_id;
    }

    public String getChoiceText() {
      return this.choice_text;
    }

    public void setChoiceText(String text) {
      this.choice_text = text;
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
