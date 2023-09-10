package kr.co.helf.dto;

import java.util.List;

import kr.co.helf.vo.Career;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TrainerDto {

	private int lessonCount;
	List<Career> careers;
}
