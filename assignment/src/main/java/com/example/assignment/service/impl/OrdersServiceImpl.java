package com.example.assignment.service.impl;

import com.example.assignment.entity.Orders;
import com.example.assignment.entity.User;
import com.example.assignment.repository.OrderRepository;
import com.example.assignment.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<Orders> getAllByUser(User user) {
        return orderRepository.findByUser(user);
    }

    @Override
    public List<Orders> getAll() {
        return orderRepository.findAll();
    }

    @Override
    public Orders getOne(Long idOrder) {
        return null;
    }

    @Override
    public Orders add(Orders orders) {
        return orderRepository.save(orders);
    }

    @Override
    public Orders update(Orders orders) {
        return null;
    }

    @Override
    public void delete(Orders orders) {
        orderRepository.delete(orders);
    }
}
