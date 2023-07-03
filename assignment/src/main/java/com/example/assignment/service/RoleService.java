package com.example.assignment.service;

import com.example.assignment.entity.Role;

import java.util.List;

public interface RoleService {
    List<Role> getAll();

    Role getOne(Long id);

    Role add(Role r);

    Role update(Role r);

    void delete(Role r);
}
