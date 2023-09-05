package com.example.demo;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import kr.co.helf.vo.Order;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;

@SpringBootTest
class SpringBootHelfApplicationTests {
	

	@Test
	void contextLoads() {
	}

	@Test
	public void checkRankTest() {
		
//		List<User> customers = userMapper.getAllCustomer();
//		for(User customer : customers) {
//			List<Order> orders = orderMapper.getMonthOrderById(customer.getId());
//			int totalAmount = 0;
//			
//			for(Order order : orders) {
//				totalAmount += order.getTotalPrice();
//			}
//			
//			List<Rank> ranks = userMapper.getRanks();
//			for(Rank rank : ranks) {
//				if(rank.getCriteria() <= totalAmount) {
//					customer.setRank(rank);
//					customer.setPoint(customer.getPoint() + rank.getBenefit());
//					
//					break;
//				}
//			}
//		}
	}

}
