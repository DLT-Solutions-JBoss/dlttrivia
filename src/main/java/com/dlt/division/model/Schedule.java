package com.dlt.division.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@Entity
@Table(name="schedule")
public class Schedule {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    int id;
    
    @Column(name = "emp_id")
    int emp_id;
    
    @Column(name = "delivery_date")
    Date delivery_date;

    @ManyToOne
    private Employee employee;

    public int getId() {
      return id;
    }

    public void setId(int id) {
      this.id = id;
    }

    public int getEmployeeId() {
      return this.emp_id;
    }

    public void setEmployeeId(int empId) {
      this.emp_id = empId;
    }

    public Date getDeliveryDate() {
      return this.delivery_date;
    }

    public void setDeliveryDate(Date dDate) {
      this.delivery_date = dDate;
    }
}
