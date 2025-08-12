package com.jobskill.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.jobskill.model.Job;

@Repository
public class JobDao {

    @PersistenceContext
    private EntityManager entityManager;

    // Save a job
    @Transactional
    public void saveJob(Job job) {
        entityManager.persist(job);
    }

    // Get all jobs
    public List<Job> getAllJobs() {
        return entityManager
                .createQuery("FROM Job", Job.class)
                .getResultList();
    }

    // Get jobs posted by a specific employer (using contact number)
    public List<Job> getJobsByEmployer(double contact) {
        TypedQuery<Job> query = entityManager.createQuery(
            "FROM Job WHERE postedBy = :contact", Job.class
        );
        query.setParameter("contact", contact);
        return query.getResultList();
    }

    // Get job by ID
    public Job getJobById(int jobId) {
        return entityManager.find(Job.class, jobId);
    }

    // Delete a job (optional, for admin/employer dashboard)
    @Transactional
    public void deleteJob(int jobId) {
        Job job = entityManager.find(Job.class, jobId);
        if (job != null) {
            entityManager.remove(job);
        }
    }
}
