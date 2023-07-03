package com.example.assignment.service.impl;

import com.example.assignment.entity.Brand;
import com.example.assignment.repository.BrandRepository;
import com.example.assignment.service.BrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandServiceImpl implements BrandService {
    @Autowired
    private BrandRepository brandRepository;

    @Override
    public List<Brand> getAll() {
        return brandRepository.findAll();
    }

    @Override
    public Brand getOne(Long id) {
        return brandRepository.findById(id).orElse(null);
    }

    @Override
    public Brand add(Brand br) {
        return brandRepository.save(br);
    }

    @Override
    public Brand update(Brand br) {
        return brandRepository.save(br);
    }

    @Override
    public void delete(Brand br) {
        brandRepository.delete(br);
    }
}
