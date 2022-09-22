package com.aptech.order;

import org.springframework.data.jpa.repository.JpaRepository;

import com.aptech.common.entity.order.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}

