package com.jobskill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jdk.management.resource.internal.inst.SocketOutputStreamRMHooks;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home(){
		return "index";
	}

}
