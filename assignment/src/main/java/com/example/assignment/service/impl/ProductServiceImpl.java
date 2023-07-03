package com.example.assignment.service.impl;

import com.example.assignment.entity.Product;
import com.example.assignment.helper.ExcelHelper;
import com.example.assignment.repository.ProductRepository;
import com.example.assignment.service.ProductService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    ExcelHelper excelHelper;

    @Autowired
    public ProductRepository productRepository;

    @Override
    public Page<Product> getAll(Pageable pageable) {
        return productRepository.findAll(pageable);
    }

    @Override
    public Page<Product> findByNameContains(String name, Pageable pageable) {
        return productRepository.findByNameContains(name, pageable);
    }

    @Override
    public Page<Product> findByPriceBetween(Integer gia1, Integer gia2, Pageable pageable) {
        return productRepository.findByPriceBetween(gia1, gia2, pageable);
    }

    @Override
    public void insertDataFromExcel(MultipartFile file) throws IOException {
        try {
            List<Product> products = excelHelper.excelToProducts(file.getInputStream());
            productRepository.saveAll(products);
        } catch (IOException e) {
            throw new RuntimeException("fail import excel to products" + e.getMessage());
        }
    }

    @Override
    public Product getOne(Long id) {
        return productRepository.findById(id).orElse(null);
    }


    @Override
    public Product add(Product product) {
        return productRepository.save(product);
    }

    @Override
    public Product update(Product product) {
        if (productRepository.existsById(product.getId())) {
            return productRepository.save(product);
        }
        return null;
    }

    @Override
    public void delete(Product product) {
        productRepository.delete(product);
    }

    @Override
    public int totalProduct() {
        return (int) productRepository.count();
    }

}
