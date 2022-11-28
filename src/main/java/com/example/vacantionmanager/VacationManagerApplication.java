package com.example.vacantionmanager;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

@SpringBootApplication
public class VacationManagerApplication {

    public static void main(String[] args) {
        SpringApplication.run(VacationManagerApplication.class, args);
        System.out.println("http://127.0.0.1:8080/");
        System.out.println("test");
    }

}