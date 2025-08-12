package com.jobskill.dao;

import com.jobskill.model.AppliedJob;
import com.jobskill.model.Job;
import org.springframework.stereotype.Repository;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.time.LocalDate;
import java.util.List;

@Repository
public class AppliedJobDao {

@PersistenceContext
private EntityManager entityManager;

public List<AppliedJob> getAppliedJobsBySeeker(String email) {
    return entityManager
            .createQuery("FROM AppliedJob WHERE jobSeekerEmail = :email", AppliedJob.class)
            .setParameter("email", email)
            .getResultList();
}

@Transactional
public void applyToJob(int jobId, String email) {
    Job job = entityManager.find(Job.class, jobId);
    if (job == null) return;

    Long count = entityManager.createQuery(
                    "SELECT COUNT(a) FROM AppliedJob a WHERE a.jobId = :jobId AND a.jobSeekerEmail = :email", Long.class)
            .setParameter("jobId", jobId)
            .setParameter("email", email)
            .getSingleResult();

    if (count > 0) return;

    AppliedJob appliedJob = new AppliedJob();
    appliedJob.setJobId(job.getId());
    appliedJob.setJobTitle(job.getTitle());
    appliedJob.setCompanyName(job.getCompanyName());
    appliedJob.setLocation(job.getLocation());
    appliedJob.setAppliedDate(LocalDate.now().toString());
    appliedJob.setStatus("Pending");
    appliedJob.setJobSeekerEmail(email);

    entityManager.persist(appliedJob);
}

public List<AppliedJob> getApplicantsByJobId(int jobId) {
    return entityManager.createQuery("FROM AppliedJob WHERE jobId = :jobId", AppliedJob.class)
            .setParameter("jobId", jobId)
            .getResultList();
}

public List<AppliedJob> getAllApplicants() {
    return entityManager.createQuery("FROM AppliedJob", AppliedJob.class).getResultList();
}

@Transactional
public void updateApplicationStatus(int id, String status) {
    AppliedJob job = entityManager.find(AppliedJob.class, id);
    if (job != null) {
        job.setStatus(status);
        entityManager.merge(job);
    }
}
}