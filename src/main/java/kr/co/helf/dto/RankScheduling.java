package kr.co.helf.dto;

import kr.co.helf.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class RankScheduling {

	private final UserService userService;
	
//	@Scheduled(cron = "0 0 0 * * ?")
//	public void updateRank() {
//		userService.updateRank();
//	}
}
