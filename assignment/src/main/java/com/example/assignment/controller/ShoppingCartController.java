package com.example.assignment.controller;

import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.User;
import com.example.assignment.service.CartItemService;
import com.example.assignment.service.ProductService;
import com.example.assignment.service.ShoppingCartService;
import com.example.assignment.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.annotation.SessionScope;

import java.util.List;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {


    @Autowired
    private ProductService productService;
    @Autowired
    private ShoppingCartService shoppingCartService;
    @Autowired
    private UserService userService;


    @GetMapping
    private String showCart(HttpSession session,
                            Model model
    ) {
        User user = (User) session.getAttribute("userLogin");
        List<CartItem> cartItemList = shoppingCartService.getAll(user);

        model.addAttribute("carts", cartItemList);
        Double totalMoney = shoppingCartService.getTotalMoney(cartItemList);
        model.addAttribute("totalMoneyCart", totalMoney);

        session.setAttribute("carts", cartItemList);
        session.setAttribute("totalMoneyCart", totalMoney);

        return "/client/cart";
    }

    @PostMapping("/{id}")
    private String addCart(Model model,
                           @RequestParam("quantityBuy") Integer quantityBuy,
                           @PathVariable("id") Long idProduct,
                           HttpSession session
    ) {
        User user = (User) session.getAttribute("userLogin");
        shoppingCartService.add(idProduct, user, quantityBuy);
        return "redirect:/cart";
    }

    @GetMapping("/delete/{id}")
    private String delete(
            Model model,
            HttpSession session,
            @PathVariable("id") Long idProduct
    ) {
        User user = (User) session.getAttribute("userLogin");
        shoppingCartService.delete(idProduct, user);
        return "redirect:/cart";
    }


}
