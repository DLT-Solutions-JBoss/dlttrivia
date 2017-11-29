package com.dlt.division.model;

import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import java.util.List;

@Stateful
public class Asks {

    @PersistenceContext(unitName = "Division", type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    public void addAsk(Ask Ask) throws Exception {
        entityManager.persist(Ask);
    }

    public void deleteAsk(Ask Ask) throws Exception {
        entityManager.remove(Ask);
    }

    public List<Ask> getAsks() throws Exception {
        Query query = entityManager.createQuery("SELECT m from Ask as m");
        return query.getResultList();
    }
}