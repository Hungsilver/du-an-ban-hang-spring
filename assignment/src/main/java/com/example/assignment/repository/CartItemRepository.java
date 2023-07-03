package com.example.assignment.repository;

import com.example.assignment.entity.CartItem;
import com.example.assignment.entity.Product;
import com.example.assignment.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface CartItemRepository extends JpaRepository<CartItem, Long> {

    List<CartItem> findByUser(User user);

    @Modifying
    @Transactional
    @Query("DELETE FROM CartItem ci WHERE ci.product.id = :productId AND ci.user= :user")
    void deleteByProductIdAndUser(Long productId, User user);

    @Modifying
    @Transactional
    void deleteAllByUser(User user);

    boolean existsByProductIdAndUser(Long idProduct, User user);
}
