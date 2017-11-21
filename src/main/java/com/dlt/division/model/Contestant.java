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
@Table(name="contestant")
public class Contestant {

    @JoinColumn(name="contest_id")
    private Contest contest;

    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @Column(name = "created", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME"))
    @Temporal(TemporalType.TIMESTAMP)
    private Date updated;

    public int getContest() {
      return contest;
    }

    public void setContest(Contest contest) {
      this.contest = contest;
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
