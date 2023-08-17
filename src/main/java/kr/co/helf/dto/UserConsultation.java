package kr.co.helf.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.Rank;
import kr.co.helf.vo.User;
import lombok.Data;
import lombok.ToString;

@Data
@ToString
@Alias("UserConsultation")
public class UserConsultation {
	
	private User user;
	private List<Consultation> consultations;
	private Rank rank;
}
