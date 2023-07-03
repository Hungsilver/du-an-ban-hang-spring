package com.example.assignment.service.impl;

import com.example.assignment.entity.Role;
import com.example.assignment.repository.RoleRepository;
import com.example.assignment.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public List<Role> getAll() {
        return roleRepository.findAll();
    }

    @Override
    public Role getOne(Long id) {
        return roleRepository.findById(id).orElse(null);
    }

    @Override
    public Role add(Role customer) {
        return roleRepository.save(customer);
    }

    @Override
    public Role update(Role customer) {
        return roleRepository.save(customer);
    }

    @Override
    public void delete(Role customer) {
        roleRepository.delete(customer);
    }
}
