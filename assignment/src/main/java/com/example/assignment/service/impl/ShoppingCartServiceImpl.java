package com.example.assignment.service.impl;

import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.Product;
import com.example.assignment.entity.User;
import com.example.assignment.mapper.Mapper;
import com.example.assignment.repository.CartItemRepository;
import com.example.assignment.repository.OrderRepository;
import com.example.assignment.repository.ProductRepository;
import com.example.assignment.service.ShoppingCartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
    @Autowired
    private CartItemRepository cartItemRepository;
    @Autowired
    private OrderRepository orderRepository;
    @Autowired
    private ProductRepository productRepository;


    @Override
    public List<CartItem> getAll(User user) {
        return cartItemRepository.findByUser(user);
    }

    @Override
    public CartItem getOne(Long idProduct) {
        return null;
    }

    @Override
    public CartItem add(Long idProduct, User user, Integer quantity) {
        for (CartItem x : cartItemRepository.findByUser(user)) {
            if (x.getProduct().getId().equals(idProduct)) {
                x.setQuantityBuy(x.getQuantityBuy() + quantity);
                return cartItemRepository.save(x);
            }
        }
        Product product = productRepository.findById(idProduct).orElse(null);
        return cartItemRepository.save(new CartItem(null, user, product, quantity));
    }

    @Override
    public CartItem update(Long idProduct, User user, Integer quantity) {
        return null;
    }

    @Override
    public void delete(Long idProduct, User user) {
        cartItemRepository.deleteByProductIdAndUser(idProduct, user);
    }

    @Override
    public Double getTotalMoney(List<CartItem> list) {
        if (list.isEmpty()) {
            return 0.0;
        }
        return list.stream()
                .map(x -> x.getProduct().getPrice() * x.getQuantityBuy())
                .reduce(0, Integer::sum).doubleValue();
    }

    @Override
    public void deleteAll(User user) {

    }
}
