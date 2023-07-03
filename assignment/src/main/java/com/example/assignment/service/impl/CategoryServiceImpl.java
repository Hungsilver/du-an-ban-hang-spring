package com.example.assignment.service.impl;

import com.example.assignment.entity.Category;
import com.example.assignment.repository.CategoryRepository;
import com.example.assignment.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryRepository categoryRepository;

    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category getOne(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    @Override
    public Category add(Category cate) {
        return categoryRepository.save(cate);
    }

    @Override
    public Category update(Category cate) {
        return categoryRepository.save(cate);
    }

    @Override
    public void delete(Category cate) {
        categoryRepository.delete(cate);
    }
}
