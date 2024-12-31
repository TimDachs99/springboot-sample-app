package com.deployments.springboot_sample_app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringbootSampleAppApplication {

	@GetMapping("/show")
	public String showString(){
		return "App deployed to k8s";
	}

	public static void main(String[] args) {
		SpringApplication.run(SpringbootSampleAppApplication.class, args);
	}

}
