package com.example.assignment.service;

import com.example.assignment.entity.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

public interface ProductService {

    Page<Product> getAll(Pageable pageable);

    Page<Product> findByNameContains(String name, Pageable pageable);
//    Page<Product> findtop10();

    Page<Product> findByPriceBetween(Integer gia1, Integer gia2, Pageable pageable);

    void insertDataFromExcel(MultipartFile multipartFile) throws IOException;

    Product getOne(Long id);

    Product add(Product product);

    Product update(Product productNew);

    void delete(Product product);

    int totalProduct();

}
