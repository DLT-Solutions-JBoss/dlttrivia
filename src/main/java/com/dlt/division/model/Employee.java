package com.dlt.division.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@Table(name="employee")
public class Employee {

    @Id
    @Column(name = "id")
    int id;
    
    @Column(name = "first_name")
    String firstName;
    
    @Column(name = "last_name")
    String lastName;

    public int getId() {
      return id;
    }

    public void setId(int id) {
      this.id = id;
    }

    public String getFirstName() {
      return this.firstName;
    }

    public void setFirstName(String fname) {
      this.firstName = fname;
    }

    public String getLastName() {
      return this.lastName;
    }

    public void setLastName(String lname) {
      this.lastName = lname;
    }
}
