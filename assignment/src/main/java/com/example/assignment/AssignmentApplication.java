package com.example.assignment;

import com.example.assignment.entity.Product;
import com.example.assignment.entity.User;
import com.example.assignment.repository.CartItemRepository;
import com.example.assignment.repository.ProductRepository;
import com.example.assignment.repository.UserRepository;
import com.example.assignment.service.ProductService;
import com.example.assignment.service.ShoppingCartService;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItem;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.beans.Transient;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.time.LocalDate;

@SpringBootApplication
public class AssignmentApplication {

    public static void main(String[] args) {
        SpringApplication.run(AssignmentApplication.class, args);
    }

    @Autowired
    ProductService productService;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    ShoppingCartService shoppingCartService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    CartItemRepository cartItemRepository;


    @Bean
    @Transactional
    CommandLineRunner run() {
        return args -> {
//            LocalDate date = LocalDate.of(2023, 6, 10);

//            productRepository.findTop10Record(date).forEach(System.out::println);
//            productRepository.findTop10SPMaxBuyInDay(date).forEach(System.out::println);

        };
    }


}

