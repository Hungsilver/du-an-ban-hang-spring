package com.example.assignment.service;

import com.example.assignment.entity.Color;

import java.util.List;

public interface ColorService {

    List<Color> getAll();

    Color getOne(Long id);

    Color add(Color cart);

    Color update(Color cart);

    void delete(Color cart);

}
