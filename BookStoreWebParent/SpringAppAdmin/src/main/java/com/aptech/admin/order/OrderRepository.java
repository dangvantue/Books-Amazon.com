package com.aptech.admin.order;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.aptech.common.entity.order.Order;

public interface OrderRepository extends PagingAndSortingRepository<Order, Integer> {

}
