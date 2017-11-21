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
@Table(name="user")
public class User {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "user_id")
    int user_id;
    
    @Column(name = "first_name")
    String first_name;
    
    @Column(name = "last_name")
    String last_name;

    @Column(name = "email")
    String email;
 
    @Column(name = "status")
    String status;
	
    public int getUserId() {
      return user_id;
    }

    public void setUserId(int id) {
      this.user_id = id;
    }

    public String getFirstName() {
      return this.first_name;
    }

    public void setFirstName(String fname) {
      this.first_name = fname;
    }

    public String getLastName() {
      return this.last_name;
    }

    public void setLastName(String lname) {
      this.last_name = lname;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

    public String getStatus() {
	return status;
    }

    public void setStatus(String status) {
	this.status = status;
    }
}
