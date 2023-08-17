package kr.co.helf.dto;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.helf.service.OrderService;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MembershipScheduling {
	
	private final OrderService orderService;

	@Scheduled(cron = "0 0 0 * * ?")
	public void changeStartDate() {
		// 시작일이 오늘인 사용대기인 멤버십을 조회한다.
		// 사용중으로 바꾼다.
		orderService.getMyMembershipStartToday();
	}

	@Scheduled(cron = "0 0 0 * * ?")
	public void changeEndDate() {
		// 만기일이 오늘인 사용중인 멤버십을 조회한다. 
		// 사용불가로 바꾼다.
		orderService.getMyMembershipEndToday();
	}

	@Scheduled(cron = "0 0 0 * * ?")
	public void changeMyOptionEndDate() {
		// 만기일이 오늘인 내 옵션을 조회한다. 
		// 상태를 '사용불가'으로 바꾼다.
		orderService.getMyOptionEndToday();
	}
}
