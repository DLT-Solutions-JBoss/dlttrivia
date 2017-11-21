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
@Table(name="contest")
public class Contest {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "contest_id")
    int contest_id;
    
    @Column(name = "contest_title")
    String contest_title;
    
    @Column(name = "created", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;

    public int getContestId() {
      return contest_id;
    }

    public void setContestId(int contest_id) {
      this.contest_id = contest_id;
    }

    public String getContestTitle() {
      return this.contest_title;
    }

    public void setContestTitle(String title) {
      this.contest_title = title;
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
