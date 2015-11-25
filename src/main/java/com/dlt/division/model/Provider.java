package com.dlt.division.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@Table(name="provider")
public class Provider {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    int id;
    
    @Column(name = "name")
    String name;
    
    @Column(name = "website_url")
    String website_url;

    public int getId() {
      return id;
    }

    public void setId(int id) {
      this.id = id;
    }

    public String getName() {
      return this.name;
    }

    public void setName(String name) {
      this.name = name;
    }

    public String getWebSiteUrl() {
      return this.website_url;
    }

    public void setWebSiteUrl(String sUrl) {
      this.website_url = sUrl;
    }
}
