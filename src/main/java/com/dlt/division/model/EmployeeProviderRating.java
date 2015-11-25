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
@Table(name="employee_provider_rating")
public class EmployeeProviderRating {

    @Id @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    int id;
    
    @Column(name = "emp_id")
    int emp_id;
    
    @Column(name = "provider_id")
    int provider_id;
    
    @Column(name = "rating")
    int rating;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmpId() {
		return emp_id;
	}

	public void setEmpId(int emp_id) {
		this.emp_id = emp_id;
	}

	public int getProviderId() {
		return provider_id;
	}

	public void setProviderId(int provider_id) {
		this.provider_id = provider_id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}    
   

}
