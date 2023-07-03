package com.example.assignment.service;

import com.example.assignment.entity.User;

import java.util.List;

public interface UserService {

    List<User> getAll();

    User getOne(Long id);

    User add(User user);

    User update(User user);

    void delete(User user);

    User getUserByEmailAndPassWord(String email, String password);
}
