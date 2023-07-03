package com.example.assignment.controller;

import com.example.assignment.dto.ProductDTO;
import com.example.assignment.entity.Orders;
import com.example.assignment.entity.Product;
import com.example.assignment.entity.Role;
import com.example.assignment.entity.User;
import com.example.assignment.helper.ExcelHelper;
import com.example.assignment.repository.ProductRepository;
import com.example.assignment.service.BrandService;
import com.example.assignment.service.CategoryService;
import com.example.assignment.service.ColorService;
import com.example.assignment.service.OrderService;
import com.example.assignment.service.ProductService;
import com.example.assignment.service.RoleService;
import com.example.assignment.service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private ColorService colorService;
    @Autowired
    private BrandService brandService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    ExcelHelper excelHelper;

    //homeDashBoard
    @GetMapping
    private String homeDashBoard(Model model) {

        List<ProductDTO> productDTOS = productRepository.findTop10SPMaxBuy();

        List<Long> listSum = productDTOS.stream()
                .map(x -> x.getTotalQuantity())
                .limit(10)
                .collect(Collectors.toList());
        List<Long> listId = productDTOS.stream()
                .map(x -> x.getId())
                .limit(10)
                .collect(Collectors.toList());
        model.addAttribute("listTotal", listSum);
        model.addAttribute("listId", listId);
        model.addAttribute("listSP", productDTOS);
        return "admin/dash-board";
    }

    @GetMapping("/forDay")
    private String forDay(Model model) {

        LocalDate date = LocalDate.now();
        List<ProductDTO> productDTOS = productRepository.findTop10SPMaxBuyInDay(date);

        List<Long> listSum = productDTOS.stream()
                .map(x -> x.getTotalQuantity())
                .limit(10)
                .collect(Collectors.toList());
        List<Long> listId = productDTOS.stream()
                .map(x -> x.getId())
                .limit(10)
                .collect(Collectors.toList());
        model.addAttribute("listTotal", listSum);
        model.addAttribute("listId", listId);
        model.addAttribute("listSP", productDTOS);
        return "admin/dash-board";
    }

    @GetMapping("/forWeek")
    private String forWeek(Model model) {

        LocalDate date = LocalDate.now();
        List<ProductDTO> productDTOS = productRepository.findTop10SPMaxBuyInWeek(date);

        List<Long> listSum = productDTOS.stream()
                .map(x -> x.getTotalQuantity())
                .limit(10)
                .collect(Collectors.toList());
        List<Long> listId = productDTOS.stream()
                .map(x -> x.getId())
                .limit(10)
                .collect(Collectors.toList());

        model.addAttribute("listTotal", listSum);
        model.addAttribute("listId", listId);
        model.addAttribute("listSP", productDTOS);
        return "admin/dash-board";
    }

    @GetMapping("/forMonth")
    private String forMonth(Model model) {

        LocalDate date = LocalDate.now();
        List<ProductDTO> productDTOS = productRepository.findTop10SPMaxBuyInMonth(date);


        List<Long> listSum = productDTOS.stream()
                .map(x -> x.getTotalQuantity())
                .limit(10)
                .collect(Collectors.toList());
        List<Long> listId = productDTOS.stream()
                .map(x -> x.getId())
                .limit(10)
                .collect(Collectors.toList());

        model.addAttribute("listTotal", listSum);
        model.addAttribute("listId", listId);
        model.addAttribute("listSP", productDTOS);
        return "admin/dash-board";
    }

    @GetMapping("/products")
    public String showProducts(
            Model model,
            @RequestParam(name = "pageNumber", required = false, defaultValue = "1") Integer pageNumber,
            @RequestParam(name = "pageSize", required = false, defaultValue = "5") Integer pageSize,
            @RequestParam(name = "searchProduct", required = false) String searchProduct,
            @RequestParam(name = "firstPrice", required = false) Integer firstPrice,
            @RequestParam(name = "endPrice", required = false) Integer endPrice
    ) {
        if (pageNumber < 1) {
            pageNumber = 1;
        }
        Page<Product> list;
        Pageable pageable = PageRequest.of(pageNumber - 1, pageSize);
        if (searchProduct != null) {
            list = productService.findByNameContains(searchProduct, pageable);
        } else if (firstPrice != null && endPrice != null) {
            list = productService.findByPriceBetween(firstPrice, endPrice, pageable);
        } else {
            list = productService.getAll(pageable);
        }
        model.addAttribute("products", list);

        model.addAttribute("brands", brandService.getAll());
        model.addAttribute("categories", categoryService.getAll());
        model.addAttribute("colors", colorService.getAll());

        return "/admin/products";
    }

    //    add product
    @PostMapping("/products")
    public String addProduct(Model model,
                             @ModelAttribute(name = "pd") Product product
    ) {
        product.setStatus(1);
        product.setCreateDate(LocalDate.now());
        product.setUpdatedDate(LocalDate.now());
        Product product1 = productService.add(product);
        return "redirect:/admin/products";
    }


    //    update product
    @PostMapping("/products/{id}")
    public String updateProduct(@PathVariable("id") Long id,
                                @ModelAttribute(name = "pd") Product product
    ) {
        Product product1 = productService.getOne(id);
        product.setCreateDate(product1.getCreateDate());
        product.setUpdatedDate(LocalDate.now());
        if (product.getImage().isBlank()) {
            product.setImage(product1.getImage());
        }
        System.out.println(product);
        Product product2 = productService.update(product);
        return "redirect:/admin/products";
    }

    @GetMapping("/products/delete/{id}")
    private String delete(RedirectAttributes redirectAttributes,
                          @PathVariable Long id
    ) {
        Product product = productService.getOne(id);
        if (product != null) {
            productService.delete(product);
        }
        return "redirect:/admin/products";
    }

    //showOrders
    @GetMapping("/orders")
    private String showOrders(Model model
    ) {
        List<Orders> list = orderService.getAll();
        model.addAttribute("orders", list);
        return "admin/orders";
    }


    @GetMapping("/users")
    private String showUser(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        return "/admin/users";
    }

    @GetMapping("/delete/{id}")
    private String delete(Model model, @PathVariable("id") Long idUser) {
        userService.delete(userService.getOne(idUser));
        return "redirect:/admin/users";
    }

    @GetMapping("/profile/{id}")
    private String showProfile(Model model, @PathVariable("id") Long idUser) {
        return "users";
    }

    @PostMapping("/products/importByExcel")
    private String importExcel(Model model, @RequestParam(name = "excel") MultipartFile file) {
        if (excelHelper.hasExcelFormat(file)) {
            try {
                productService.insertDataFromExcel(file);
            } catch (IOException e) {
                throw new RuntimeException("error inserting excel" + e.getMessage());
            }
        }
        return "redirect:/admin/products";
    }
}
