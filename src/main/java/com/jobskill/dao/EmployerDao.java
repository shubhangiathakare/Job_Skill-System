package com.jobskill.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.jobskill.model.Employer;

@Repository
public class EmployerDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Transactional
    public int saveEmployer(Employer employer) {
        entityManager.persist(employer);
        return 1;
    }

    public List<Employer> getAllEmployers() {
        return entityManager.createQuery("from Employer", Employer.class).getResultList();
    }

    public Employer findByEmailAndPassword(String email, String password) {
        TypedQuery<Employer> query = entityManager.createQuery(
            "from Employer where email = :email and password = :password", Employer.class
        );
        query.setParameter("email", email);
        query.setParameter("password", password);

        List<Employer> result = query.getResultList();
        return result.isEmpty() ? null : result.get(0);
    }
}
