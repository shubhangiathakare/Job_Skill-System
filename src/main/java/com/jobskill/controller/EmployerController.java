package com.jobskill.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jobskill.dao.AppliedJobDao;
import com.jobskill.dao.EmployerDao;
import com.jobskill.dao.JobDao;
import com.jobskill.model.AppliedJob;
import com.jobskill.model.Employer;
import com.jobskill.model.Job;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class EmployerController {

    @Autowired
    private AppliedJobDao appliedJobDao;

    @Autowired
    private EmployerDao employerDao;

    @Autowired
    private JobDao jobDao;

    @GetMapping("/employerLogin")
    public String showEmployerLogin() {
        return "employerLogin";
    }

    @PostMapping("/employerAuthenticate")
    public String authenticateEmployer(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Employer employer = employerDao.findByEmailAndPassword(email, password);

        if (employer != null) {
            session.setAttribute("employer", employer);
            return "employerDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "employerLogin";
        }
    }

    @GetMapping("/postJob")
    public String showPostJobForm() {
        return "postJob";
    }

    @PostMapping("/submitJob")
    public String postJob(HttpServletRequest request, HttpSession session) {
        Employer employer = (Employer) session.getAttribute("employer");
        if (employer == null) return "redirect:/employerLogin";

        try {
            Job job = new Job();
            job.setTitle(request.getParameter("title"));
            job.setDescription(request.getParameter("description"));
            job.setLocation(request.getParameter("location"));

            String type = request.getParameter("type");
            if (type != null && !type.trim().isEmpty()) job.setType(type);

            job.setSalary(Double.parseDouble(request.getParameter("salary")));
            job.setCompanyName(employer.getCompanyname());
            job.setPostedBy(employer.getContact());
            job.setContact(employer.getContact());

            jobDao.saveJob(job);
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }

        return "employerDashboard";
    }

    @GetMapping("/viewMyJobs")
    public String viewMyJobs(Model model, HttpSession session) {
        Employer employer = (Employer) session.getAttribute("employer");
        if (employer == null) return "redirect:/employerLogin";

        double contact = employer.getContact();
        model.addAttribute("myJobs", jobDao.getJobsByEmployer(contact));
        return "viewMyJobs";
    }

    @GetMapping("/viewApplicants")
    public String viewApplicants(@RequestParam("jobId") int jobId, Model model, HttpSession session) {
        Employer employer = (Employer) session.getAttribute("employer");
        if (employer == null) return "redirect:/employerLogin";

        List<AppliedJob> applicants = appliedJobDao.getApplicantsByJobId(jobId);
        model.addAttribute("applicants", applicants);
        model.addAttribute("jobId", jobId);
        return "viewApplicants";
    }

    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam("applicationId") int id,
                               @RequestParam("status") String status,
                               @RequestParam("jobId") int jobId) {
        appliedJobDao.updateApplicationStatus(id, status);
        return "redirect:/viewApplicants?jobId=" + jobId;
    }
}