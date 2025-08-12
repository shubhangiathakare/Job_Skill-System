package com.jobskill.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.jobskill.dao.EmployerDao;
import com.jobskill.dao.JobDao;
import com.jobskill.dao.JobSeekerDao;
import com.jobskill.model.Employer;
import com.jobskill.model.Job;
import com.jobskill.model.JobSeeker;

@Controller
public class AdminController {

    @Autowired
    private EmployerDao employerDao;

    @Autowired
    private JobSeekerDao jobSeekerDao;

    @Autowired
    private JobDao jobDao;

    @GetMapping("/adminlog")
    public String adminlog() {
        return "adminLogin";
    }

    @PostMapping("/subadminLogin")
    public String subadminLogin(HttpServletRequest request) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
            return "adminDashboard";
        } else {
            return "adminLogin";
        }
    }

    @GetMapping("/addEmployer")
    public String addEmployer() {
        return "addEmployer";
    }

    @PostMapping("/saveEmployer")
    public String saveEmployer(HttpServletRequest request) {
        Employer employer = new Employer();
        employer.setContact(Double.parseDouble(request.getParameter("contact")));
        employer.setName(request.getParameter("name"));
        employer.setCompanyname(request.getParameter("companyname"));
        employer.setEmail(request.getParameter("email"));
        employer.setPassword(request.getParameter("password"));

        int i = employerDao.saveEmployer(employer);

        if (i > 0) {
            return "addEmployer";
        } else {
            return "adminDashboard";
        }
    }

    @GetMapping("/viewEmployers")
    public String viewEmployers(Model model) {
        List<Employer> employers = employerDao.getAllEmployers();
        model.addAttribute("viewEmployers", employers);
        return "viewEmployers";
    }

    @GetMapping("/admin/viewSeekers")
    public String viewAllJobSeekers(Model model) {
        List<JobSeeker> seekers = jobSeekerDao.getAllSeekers();
        model.addAttribute("seekers", seekers);
        return "adminViewSeekers";
    }

    @GetMapping("/admin/viewAllJobs")
    public String viewAllJobs(Model model) {
        List<Job> jobs = jobDao.getAllJobs();
        model.addAttribute("jobs", jobs);
        return "adminViewJobs";
    }
} 