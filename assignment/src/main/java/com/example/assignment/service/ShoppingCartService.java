package com.example.assignment.service;

import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.User;

import java.util.List;

public interface ShoppingCartService {
    List<CartItem> getAll(User user);


    CartItem getOne(Long idProduct);


    CartItem add(Long idProduct, User user, Integer quantity);


    CartItem update(Long idProduct, User user, Integer quantity);


    void delete(Long idProduct, User user);


    Double getTotalMoney(List<CartItem> list);

    void deleteAll(User user);
}
