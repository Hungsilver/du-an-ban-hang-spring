package com.example.assignment.service.impl;

import com.example.assignment.entity.Color;
import com.example.assignment.repository.ColorRepository;
import com.example.assignment.service.ColorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ColorServiceImpl implements ColorService {
    @Autowired
    private ColorRepository colorRepository;

    @Override
    public List<Color> getAll() {
        return colorRepository.findAll();
    }

    @Override
    public Color getOne(Long id) {
        return colorRepository.findById(id).orElse(null);
    }

    @Override
    public Color add(Color cl) {
        return colorRepository.save(cl);
    }

    @Override
    public Color update(Color cl) {
        return colorRepository.save(cl);
    }

    @Override
    public void delete(Color cl) {
        colorRepository.delete(cl);
    }
}
