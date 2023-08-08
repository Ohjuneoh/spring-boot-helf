package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.Career;
import kr.co.helf.vo.Trainer;
import kr.co.helf.vo.User;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TrainerWithCareer {
	
	private Trainer trainer;
	private User user;
	private List<Career> career;

}
