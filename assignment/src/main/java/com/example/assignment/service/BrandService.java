package com.example.assignment.service;

import com.example.assignment.entity.Brand;
import com.example.assignment.entity.Color;

import java.util.List;

public interface BrandService {

    List<Brand> getAll();

    Brand getOne(Long id);

    Brand add(Brand br);

    Brand update(Brand br);

    void delete(Brand br);

}
