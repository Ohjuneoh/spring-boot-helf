package kr.co.helf;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@EnableScheduling
@SpringBootApplication
public class SpringBootHelfApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootHelfApplication.class, args);
		
	}

}
