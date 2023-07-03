package com.example.assignment.controller;

import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.Orders;
import com.example.assignment.entity.OrdersDetail;
import com.example.assignment.entity.Product;
import com.example.assignment.entity.User;
import com.example.assignment.service.CartItemService;
import com.example.assignment.service.OrderService;
import com.example.assignment.service.ProductService;
import com.example.assignment.service.ShoppingCartService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/check-out")
public class CheckoutController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private ProductService productService;
    @Autowired
    private ShoppingCartService shoppingCartService;


    @GetMapping
    private String showCheckout(Model model,
                                HttpSession session
    ) {
        User user = (User) session.getAttribute("userLogin");
        Double totalMoneyCart = (Double) session.getAttribute("totalMoneyCart");
        model.addAttribute("totalMoneyOrder", totalMoneyCart);
        model.addAttribute("user", user);
        return "client/checkout";
    }

    @Transactional
    @PostMapping
    public String checkout(Model model,
                           HttpSession session
    ) {

        User user = (User) session.getAttribute("userLogin");
        List<CartItem> listCarts = (List<CartItem>) session.getAttribute("carts");
        Double totalMoneyOrders = (Double) session.getAttribute("totalMoneyCart");
        Orders orders = new Orders();


        List<OrdersDetail> ordersDetailList = new ArrayList<>();
        Product productDetach = new Product();
        for (CartItem x : listCarts) {
            productDetach = productService.add(x.getProduct());
            OrdersDetail ordersDetail = new OrdersDetail();
            ordersDetail.setOrders(orders);
            ordersDetail.setProduct(productDetach);
            ordersDetail.setPrice(productDetach.getPrice());
            ordersDetail.setQuantity(x.getQuantityBuy());
            ordersDetail.setCreatedDate(LocalDate.now());
            ordersDetailList.add(ordersDetail);
        }
        orders.setOrdersDetails(ordersDetailList); // add cùg vào order
        orders.setAddress(user.getAddress());
        orders.setCreateDate(LocalDate.now());
        orders.setPhoneNumber(user.getPhoneNumber());
        orders.setStatus(1);
        orders.setTotalMoney(totalMoneyOrders);
        orders.setUpdateDate(LocalDate.now());
        orders.setUser(user);

        orders.getOrdersDetails().forEach(System.out::println);

        Orders orderSaved = orderService.add(orders);
        if (orderSaved != null) {
            Product product = new Product();
            for (CartItem x : listCarts) {
                product = productService.getOne(x.getProduct().getId());
                product.setQuantity(product.getQuantity() - x.getQuantityBuy());
                productService.update(product);
                shoppingCartService.delete(x.getProduct().getId(), user);
            }
            session.removeAttribute("totalMoneyCart");
            session.removeAttribute("carts");
        }
        return "/client/done";
    }
}

