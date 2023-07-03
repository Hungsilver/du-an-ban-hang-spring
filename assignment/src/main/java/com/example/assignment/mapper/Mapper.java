package com.example.assignment.mapper;

import com.example.assignment.dto.ProductDTO;
import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.Product;
import com.example.assignment.entity.User;
import com.example.assignment.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Mapper {
    @Autowired
    ProductRepository productRepository;

    List<String> mapToObject(){
        return null;
    }

}
