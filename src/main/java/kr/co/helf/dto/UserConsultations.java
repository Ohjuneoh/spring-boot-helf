package kr.co.helf.dto;

import org.apache.ibatis.type.Alias;

import kr.co.helf.vo.Consultation;
import kr.co.helf.vo.User;
import lombok.Data;

@Data
@Alias("UserConsultations")
public class UserConsultations {

	private User user;
	private Consultation consultations;
	
}
