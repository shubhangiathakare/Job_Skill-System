package com.jobskill.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.jobskill.dao.AppliedJobDao;
import com.jobskill.dao.JobDao;
import com.jobskill.dao.JobSeekerDao;
import com.jobskill.model.JobSeeker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class JobSeekerController {
	
	
	@Autowired
	private AppliedJobDao appliedJobDao;
	
	
	@Autowired
	private JobDao jobDao;


    @Autowired
    private JobSeekerDao jobSeekerDao;

    @GetMapping("/jobSeekerLogin")
    public String showLoginPage() {
        return "jobSeekerLogin";
    }

    @PostMapping("/jobSeekerAuthenticate")
    public String authenticateJobSeeker(HttpServletRequest request, Model model, HttpSession session) {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        JobSeeker seeker = jobSeekerDao.findByEmailAndPassword(email, password);
        if (seeker != null) {
            session.setAttribute("jobSeeker", seeker);
            return "redirect:/jobSeekerDashboard";
        } else {
            model.addAttribute("error", "Invalid email or password");
            return "jobSeekerLogin";
        }
    }

    @GetMapping("/jobSeekerSignup")
    public String showSignupPage() {
        return "jobSeekerSignup";
    }

    @PostMapping("/registerJobSeeker")
    public String registerJobSeeker(HttpServletRequest request, Model model) {
        JobSeeker js = new JobSeeker();
        js.setEmail(request.getParameter("email"));
        js.setName(request.getParameter("name"));
        js.setPassword(request.getParameter("password"));
        js.setContact(Long.parseLong(request.getParameter("contact")));

        jobSeekerDao.save(js);
        model.addAttribute("success", "Signup successful! Please log in.");
        return "jobSeekerLogin";
    }

    @GetMapping("/jobSeekerDashboard")
    public String showDashboard(HttpSession session, Model model) {
        JobSeeker jobSeeker = (JobSeeker) session.getAttribute("jobSeeker");
        if (jobSeeker == null) {
            return "redirect:/jobSeekerLogin";
        }
        model.addAttribute("jobSeeker", jobSeeker);
        return "jobSeekerDashboard";
    }

    @GetMapping("/jobSeekerLogout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/jobSeekerLogin";
    }
    
    
    @GetMapping("/viewAllJobs")
    public String viewAllJobs(Model model) {
        model.addAttribute("jobList", jobDao.getAllJobs());
        return "viewAllJobs";
    }
    
    
    
    @GetMapping("/appliedJobs")
    public String viewAppliedJobs(HttpSession session, Model model) {
        JobSeeker seeker = (JobSeeker) session.getAttribute("jobSeeker");
        if (seeker == null) return "redirect:/jobSeekerLogin";

        model.addAttribute("appliedJobs", appliedJobDao.getAppliedJobsBySeeker(seeker.getEmail()));
        return "appliedJobs";  // JSP page: appliedJobs.jsp
    }

    
    @PostMapping("/applyJob")
    public String applyJob(@RequestParam("jobId") int jobId, HttpSession session) {
        JobSeeker jobSeeker = (JobSeeker) session.getAttribute("jobSeeker");
        if (jobSeeker != null) {
            appliedJobDao.applyToJob(jobId, jobSeeker.getEmail());
        }
        return "jobSeekerDashboard"; // or back to job list
    }



}
