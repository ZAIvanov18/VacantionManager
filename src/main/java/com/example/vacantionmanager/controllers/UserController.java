package com.example.vacantionmanager.controllers;


import com.example.vacantionmanager.Model.User;
import com.example.vacantionmanager.dao.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {

    @Autowired
    UserRepository userRepo;

    @GetMapping("/")
    public String indexPage() {
        return "index";
    }

    @GetMapping("/goToLoginPage")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/goToRegisterPage")
    public String registerPage() {
        return "register";
    }

    @PostMapping("/register")
    public String addUser(@ModelAttribute User user) {
        userRepo.save(user);
        return "index";
    }

    @GetMapping(value="/login")
    public String getUserByUsernameAndPassword(@ModelAttribute User user, Model model) {
        User loggedUser = userRepo.findByNicknameAndPassword(user.getNickname(), user.getPassword());
        model.addAttribute("getLoggedUser", loggedUser);

        if(loggedUser.getRole().contains("CEO")) {
            return "ceoPage";
        }
        else if(loggedUser.getRole().contains("Developer")) {
            return "developerPage";
        }
        return "welcome";
    }
}