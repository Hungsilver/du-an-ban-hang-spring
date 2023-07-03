package com.example.assignment.repository;

import com.example.assignment.entity.Orders;
import com.example.assignment.entity.OrdersDetail;
import com.example.assignment.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderDetailRepository extends JpaRepository<OrdersDetail, Long> {
    List<OrdersDetail> findByOrders(Orders orders);

}
