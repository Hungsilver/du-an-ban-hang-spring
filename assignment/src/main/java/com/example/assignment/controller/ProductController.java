package com.example.assignment.controller;

import com.example.assignment.entity.Product;
import com.example.assignment.service.ProductService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/home", "", "/"})
public class ProductController {
    @Autowired
    private ProductService productService;

    @GetMapping
    private String homeProducts(
            Model model,
            @RequestParam(name = "pageNumber", required = false, defaultValue = "1") Integer pageNumber,
            @RequestParam(name = "searchProduct", required = false) String searchProduct,
            HttpSession session
    ) {
        Page<Product> products;
        int pageSize = 8;
        int pageNum = pageNumber - 1;

        Pageable pageable = PageRequest.of(pageNum, pageSize);

        if (searchProduct == null || searchProduct.isBlank()) {
            products = productService.getAll(pageable);
        } else {
            products = productService.findByNameContains(searchProduct, pageable);
        }
        model.addAttribute("products", products);
        return "home";
    }

    @GetMapping("/detail/{id}")
    private String detail(Model model,
                          @PathVariable Long id
    ) {
        Product product = productService.getOne(id);
        model.addAttribute("product", product);
        return "/detail";
    }

}
