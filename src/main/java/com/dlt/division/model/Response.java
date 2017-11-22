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
@Table(name="response")
public class Response {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "response_id")
    int response_id;

    @ManyToOne
    @JoinColumn(name="ask_id")
    private Ask ask;

    @ManyToOne
    @JoinColumn(name="choice_id")
    private Choice choice;

    @Column(name = "responded", columnDefinition="DATETIME")
    private Date responded;

    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    public int getResponseId() {
      return response_id;
    }

    public void setResponseId(int response_id) {
      this.response_id = response_id;
   }

    public Ask getAsk() {
      return ask;
    }

    public void setAsk(Ask ask) {
      this.ask = ask;
    }

   public Date getResponded() {
      return responded;
    }

    public void setAsked(Date responded) {
      this.responded = responded;
   }

    public Choice getChoice() {
      return choice;
    }

    public void setChoice(Choice choice) {
      this.choice = choice;
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
