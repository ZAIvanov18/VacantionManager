package com.example.vacantionmanager;

import com.example.vacantionmanager.dao.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

@Component
public class SetupData {

    @Autowired
    RoleRepository roleRepository;

    @PostConstruct
    public void init(){
    }
}