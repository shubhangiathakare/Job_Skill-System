package com.jobskill.dao;

import com.jobskill.model.JobSeeker;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import java.util.List;

@Repository
public class JobSeekerDao {

    @PersistenceContext
    private EntityManager entityManager;

    public JobSeeker findByEmailAndPassword(String email, String password) {
        List<JobSeeker> seekers = entityManager.createQuery(
            "FROM JobSeeker WHERE email = :email AND password = :password", JobSeeker.class)
            .setParameter("email", email)
            .setParameter("password", password)
            .getResultList();

        return seekers.isEmpty() ? null : seekers.get(0);
    }
    @Transactional
    public void save(JobSeeker js) {
        entityManager.persist(js);
    }

    // ✅ Add this method
    public List<JobSeeker> getAllSeekers() {
        return entityManager.createQuery("FROM JobSeeker", JobSeeker.class)
                .getResultList();
    }
}
