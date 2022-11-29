package com.example.vacantionmanager.controllers;

import com.example.vacantionmanager.dao.UserRepository;
import com.example.vacantionmanager.model.User;
import com.example.vacantionmanager.services.CEOuser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    private UserRepository userRepository;

    private CEOuser ceo;
    private User maybeCurrUser;
    @GetMapping(value = {"/", "/home", "/index", "/welcome"})
    public String getIndex(Model model) {

        model.addAttribute("user", new User());

        return "index";

    }

    @GetMapping(value = "/ceopage")
    public String getLogin(Model model){
        model.addAttribute("user",new User());
        model.addAttribute("ceo",ceo);
        //System.out.println(ceo.toString());
        return "CEOPage";
    }

    @PostMapping(value = "/login")
    public String postLogin(@ModelAttribute User user, Model model) {
        model.addAttribute("user", user);
        if (userRepository.checkPassword(user)) {
            User u2= userRepository.getUserByUsername(user.getUsername());
            maybeCurrUser=u2;

            if(u2.getRole().getId()==1) {
                this.ceo = new CEOuser(u2);
                return "redirect:/ceopage";
            } else if (u2.getRole().getId()==2) {
                //team lead

                System.out.println("team lead");
                return "redirect:/teamLeadPage";
            } else if (u2.getRole().getId()==3) {
                //dev
                System.out.println("dev");
                return "redirect:/developerPage";

            } else if (u2.getRole().getId()==4) {
                //unassigned
                System.out.println("unassigned");
                return "redirect:/unassignedPage";

            }else{
                //404
                System.out.println("ERROR");

            }
        }
        return "redirect:/index";
    }

    @PostMapping(value = "/postRegister")
    public String postRegister(@ModelAttribute User user, Model model)  {
        model.addAttribute("user", maybeCurrUser);

        if (userRepository.insertUser(user) == 0) {
        }
        return "redirect:/index";
    }


    @PostMapping(value="postAddEmployee")
    public String postAddEmployee(@ModelAttribute User user,Model model){
        user.setCompanyName(ceo.getUser().getCompanyName());

        model.addAttribute("user",user);
        user.getRole().setIdByRoleName();
        userRepository.insertUser(user);
        return "redirect:/ceopage";
    }

    @GetMapping(value = "/developerPage")
    public String getDeveloperPage(Model model){

        model.addAttribute("user",maybeCurrUser);
        System.out.println();
        return "DeveloperPage";
    }
    @GetMapping(value = "/teamLeadPage")
    public String getTeamLeadPage(Model model){

        model.addAttribute("user",maybeCurrUser);
        System.out.println();
        return "TeamLead";
    }
    @GetMapping(value = "/unassignedPage")
    public String getUnassignedPage(Model model){

        model.addAttribute("user",maybeCurrUser);
        System.out.println();
        return "Unassigned";
    }


    @GetMapping(value="allUsers")
    public String getAllUsers(Model model){
        model.addAttribute("user",maybeCurrUser);
        List<User> list=userRepository.getUsersByCompanyName(ceo.getUser().getCompanyName());
        for (User u:
                list) {
            System.out.println(u);
        }
        model.addAttribute("list",list);
        return "ViewAllUsers";
    }
}