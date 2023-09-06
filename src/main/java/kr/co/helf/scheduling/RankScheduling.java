package kr.co.helf.scheduling;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.helf.service.UserService;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class RankScheduling {

	private final UserService userService;
	
	@Scheduled(cron = "0 0 0 1 * *")
	//@Scheduled(cron = "0 0/1 * * * *")
	public void updateRank() {
		userService.checkRank();
	}
}
