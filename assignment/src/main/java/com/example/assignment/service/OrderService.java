package com.example.assignment.service;

import com.example.assignment.entity.Orders;
import com.example.assignment.entity.User;
import jakarta.persistence.criteria.Order;

import java.util.List;

public interface OrderService {

    List<Orders> getAllByUser(User user);

    List<Orders> getAll();

    Orders getOne(Long idOrder);

    Orders add(Orders orders);

    Orders update(Orders orders);

    void delete(Orders orders);

}
