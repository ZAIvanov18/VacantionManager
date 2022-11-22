package com.example.vacantionmanager;


import com.example.vacantionmanager.Model.User;
import com.example.vacantionmanager.dao.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class VacationManagerApplication implements CommandLineRunner {

    @Autowired
    UserRepository userRepository;
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    public static void main(String[] args) {
        SpringApplication.run(VacationManagerApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        logger.info("Inserting Player 2: {}", userRepository.save(new User("Username123", "abc123",
                "Zhelyazko", "Ivanov", "Admin")));

    }
}