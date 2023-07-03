package com.example.assignment.service;

import com.example.assignment.entity.Category;

import java.util.List;

public interface CategoryService {

    List<Category> getAll();

    Category getOne(Long id);

    Category add(Category cate);

    Category update(Category cate);

    void delete(Category cate);

}
