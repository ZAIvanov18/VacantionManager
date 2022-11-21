package com.example.vacantionmanager.dao;

import com.example.vacantionmanager.Model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> {


    User findByNicknameAndPassword(String nickname, String password);
}