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
@Table(name="tag")
public class Tag {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "tag_id")
    int tag_id;
    
    @Column(name = "tag_text")
    String tag_text;
    
    @Column(name = "created", columnDefinition="DATETIME")
    private Date created;

    @Column(name = "updated", columnDefinition="DATETIME")
    private Date updated;

    public int getTagId() {
      return tag_id;
    }

    public void setTagId(int tag_id) {
      this.tag_id = tag_id;
    }

    public String getTagText() {
      return this.tag_text;
    }

    public void setTagText(String text) {
      this.tag_text = text;
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
