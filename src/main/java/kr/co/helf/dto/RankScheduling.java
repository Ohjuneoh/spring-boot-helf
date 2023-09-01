package kr.co.helf.dto;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.helf.service.UserService;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class RankScheduling {

	private final UserService userService;
	
	@Scheduled(cron = "0 0 0 * * ?")
	public void updateRank() {
		//userService.updateRank();
	}
}
